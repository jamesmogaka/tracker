import { exec } from "../../../../schema/v/code/server.js";
//
import {
  mutall_error,
  basic_value,
} from "./../../../../schema/v/code/schema.js";
//
import { view, page } from "./../../../../outlook/v/code/view.js";
//
// Define the type
type Ipath = {
  //
  //The full name of thepath
  path: string;
  //
  //Base nane
  name: string;
  //
  //Indicator whether this path is for a file or folder
  is_file: boolean;
  properties: { [index: string]: basic_value }; //e.g., {date_of_modificatin:'2013-13-04 20:00'}
};
//
// The displaying class
export class browser extends page {
  //The chidren of this folder are paths
  private children?: Array<path>;
  //
  //Root is the path we will start to scan for files and folders on the server
  constructor(public root: string) {
    //
    //Initialize the inherited page
    super();
  }
  //
  // This method is used to show the paths,i.e., filesand folders in the current
  // server, starting from theroot folernamed inthe constructor.
  // Below is a dummy of the expected output
  /*
  
          <div id= "root">   
              <details>
                  <summary>x1</summary>
              </details>
              <details>
                  <summary>x2</summary>
              </details>
  
              ...
          </div>        
      */
  //
  //  Display the server contents as listed in the html above
  public async show_panels(): Promise<void> {
    //
    //Get the root node from the current form.
    const root = this.get_element("root");
    //
    //Do not continue with this process if the children are already available
    if (this.children !== undefined) return;
    //
    //Get the child paths, i.e., files and folders, of the root folder.
    //N.B. The fisrt time round, the path isspecified without the document
    //root component, so, it neess to be adde
    const children = await this.get_child_paths(this.root, true);
    //
    //Add the children to the root node
    this.children = children.map((Ipath) =>
      this.create_and_show_path(root, Ipath, this)
    );
    //
    //Get the submit button
    const btn = <HTMLButtonElement>this.get_element("submit");
    //
    //Attach the click functionality
    btn.onclick = () => file.submit_selected_files();
  }
  //
  //Get the child folders of the given path and display them
  private async get_child_paths(
    path: string,
    add_root: boolean
  ): Promise<Array<Ipath>> {
    //
    //Scan the folders (on the index page??)
    const result: Array<Ipath> = await exec(
      "path",
      //
      //Assume that path is not a file
      [path, false, add_root],
      "scandir",
      []
    );
    //
    // Return the paths
    return result;
  }
  //
  //Show the given child of the given parent element
  private create_and_show_path(
    parent: HTMLElement,
    Ipath: Ipath,
    anchor?: browser
  ): path {
    //
    //Define a placeholder for the path object
    let path: path | undefined;
    //

    // Create the path object
    if (Ipath.is_file) {
      //
      const proxy = this.create_element("div", parent, {
        className: "file",
      });
      path = new file(proxy, parent, Ipath, anchor);
    } else {
      const proxy = this.create_element("details", parent);
      path = new folder(proxy, parent, Ipath, anchor);
    }
    return path;
  }
}
//
//This class models paths associated with files and folders in computer disk
abstract class path extends view {
  //
  //Proxy is the HTML element that represents path visually.
  public proxy: HTMLElement;

  //abstract get proxy(): HTMLElement;
  //abstract set proxy(i: HTMLElement);
    
  public full_name: string;
  public name: string;

  public anchor?: browser;

  constructor(
    proxy: HTMLElement,
    public parent: path | undefined,
    child: Ipath,
    anchor?: browser
  ) {
    super();
    this.full_name = child.path;
    this.name = child.name;
    this.proxy = proxy;
    //
    this.anchor = anchor;
  }

  get_browser(): browser {
    //
    if (this instanceof browser) return this;
    //
    return this.parent.get_browser();
  }

  // Common method for handling click events
  protected handle_click(evt: MouseEvent) {
    //
    // Stop propagation the propagation of this event upwards
    evt.stopPropagation();
    //
    // If the control button is pressed, add the select class without removing it
    if (evt.ctrlKey) {
      //
      // Add a select to the selected proxy
      if (this.proxy) {
        this.proxy.classList.add("select");
      }
    } else {
      //
      // Check for a previously selected element
      const previous_selected = document.querySelector(".select");
      //
      // Remove highlight from the previously selected
      if (previous_selected) previous_selected.classList.remove("select");
      //
      // Add a select to the selected entity which is the proxy
      this.proxy.classList.add("select");
    }
  }
}
//
// Class file displays the file contents
class file extends path {
  //
  declare proxy: HTMLElement;

  constructor(
    proxy: HTMLElement,
    parent: HTMLElement,
    child: Ipath,
    anchor?: browser
  ) {
    //
    super(proxy, parent, child, anchor);

    //
    // Create the file icon
    this.create_element("img", this.proxy, {
      className: "file_icon",
      src: "./icons/files.png",
    });
    //
    // Create an element for the file name
    this.create_element("span", this.proxy, {
      className: "file_name",
      textContent: this.name,
      onclick: (event) => this.handle_click(event),
    });
  }

  //
  // Submit an inndividual or multiple selected files to a user
  static submit_selected_files(): void {
    //
    // Get all the files with class select
    const selected_files: NodeListOf<Element> =
      document.querySelectorAll(".file.select");
    //
    //Extracts the text content of each file, and store the result in the selected array.
    const selected: string[] = Array.from(selected_files).map(
      (file) => file.textContent || ""
    );
    //
    // Check if there are selected files
    if (selected.length > 0) {
      alert("Selected Files:\n" + selected.join("\n"));
    }
  }
}
//
// Class folder displays the folder contents
class folder extends path {
  //
  declare proxy: HTMLDetailsElement;
  //
  //The chidren of this folder are paths
  private children?: Array<file | folder>;
  //
  //The image icon element that changes on opening and closing
  private icon: HTMLImageElement;
  //
  constructor(proxy: HTMLElement, parent: HTMLElement, child: Ipath) {
    //
    //Initialize the parent system
    super(proxy, parent, child);
    //
    // Create the details element
    this.proxy.ontoggle = () => {
      //
      // When toggled open, call the open method
      if (this.proxy.open) this.open();
      else this.close();
    };
    //Create the summary tag
    const summary = this.create_element("summary", this.proxy);
    //
    // Create an icon element for the folder
    this.icon = this.create_element("img", summary, {
      className: "folder_icon",
      src: "./icons/closed_folder.png",
    });
    //
    // Create the text element to hold the text
    this.create_element("span", summary, { textContent: this.name });
    //
    // Create a <span> element to wrap the text within the summary
    summary.onclick = (event) => this.handle_click(event);
  }

  //
  //Populate this folder with her children if it is the first time.
  private async open(): Promise<void> {
    //
    // Change the folder icon to indicate an open folder
    this.icon.src = "./icons/opened_folder.png";
    //
    //Do not continue with this process if the children are already available
    if (this.children !== undefined) return;
    //
    //Scan the server for the children of this folder
    this.children = await this.get_children();
    //
    //Mark this folder as having children
    this.proxy.classList.add("has_children");
    //
    // Add a class to the children
    this.children.forEach((child) => {
      child.proxy.classList.add("children");
    });
  }
  //
  // When a folder is closed
  private close() {
    //
    // Remove the open class
    this.proxy.classList.remove("has_children");
    //
    // Change the folder icon to indicate a closed folder
    this.icon.src = "./icons/closed_folder.png";
    //
    // Remove the children class
    this.icon.classList.remove("children");
  }
  //Retrieve the childern of this folder
  private async get_children(): Promise<Array<file | folder>> {
    //
    //Scan the this folder for children (as Ipaths)
    const Ipaths: Array<Ipath> = await this.get_folders(this.full_name, false);
    //
    //The parent rootelement
    const parent = this.proxy;
    //
    //Convert the the child Ipaths to paths
    const paths: Array<file | folder> = Ipaths.map((Ipath) =>
      this.create_and_show_path(parent, Ipath)
    );
    //
    //Return the paths
    return paths;
  }

  //
  //Show the given child of the given parent element
  private create_and_show_path(parent: HTMLElement, Ipath: Ipath): path {
    //
    //Define a placeholder for the path object
    let path: path | undefined;
    //

    // Create the path object
    if (Ipath.is_file) {
      //
      const proxy = this.create_element("div", parent, {
        className: "file",
      });
      path = new file(proxy, parent, Ipath);
    } else {
      const proxy = this.create_element("details", parent);
      path = new folder(proxy, parent, Ipath);
    }
    return path;
  }

  //
  // Get the folders inside the parent folder
  private async get_folders(
    full_name: String,
    add_root: boolean
  ): Promise<Array<Ipath>> {
    //
    // Get the folders
    const folders: Array<Ipath> = await exec(
      "path",
      [full_name, false, add_root],
      "scandir",
      []
    );
    //
    // Return the folders
    return folders;
  }
}
