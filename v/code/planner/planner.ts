//Get the view library to help with presentation utilities
import { mutall_error, view } from "../../../../outlook/v/code/view.js";
//
//Import the server library to help to communicate with the server
import { exec } from "../../../../schema/v/code/server.js";
//
//Get the datatype/ definaition of a layout from the questionaaire lib
import { layout } from "../../../../schema/v/code/questionnaire.js";
import { dialog } from "./dialog.js";
//
//Define the sturcture of data that will be retrieved form the query
type project = {
  project: number;
  surname: string;
  name: string;
  keywords: string;
  problem: string;
  theme: string | null;
};

export class planner extends view {
  //
  constructor(public year: string = String(new Date().getFullYear())) {
    //
    super();
  }
  //
  //Fetch the data form the dbase and plot the table
  public async show_panels(): Promise<void> {
    //
    //The sql statement to get the required data from the dbase
    const sql: string = `
            select
                project.project,
                intern.surname,
                project.name,
                project.comment as keywords,
                project.problem,
                project.theme
            from
                project
                inner join workplan on project.workplan = workplan.workplan
                inner join intern on workplan.intern = intern.intern
            where
                workplan.year = ${this.year} and project.comment <> 'X'`;
    //
    //Query and get the projects form the database
    const rows: Array<project> = await exec(
      "database",
      ["tracker_mogaka", false],
      "get_sql_data",
      [sql]
    );
    //
    //Read the table body element from the html document
    const tbody = <HTMLTableSectionElement>this.get_element("tbody");
    //
    //Display the projects in the table
    rows.forEach((row) => this.display_row(row, tbody));
  }
  //
  //Dispaly a particular project entry in the table as  a row
  private display_row(row: project, tbody: HTMLTableSectionElement): void {
    //
    //Create a table row in the body for the given project
    const project = tbody.insertRow();
    //
    //Add a cell and display the name of the intern
    project.insertCell().textContent = row.surname;
    //
    //Add a cell and display the name of the project
    project.insertCell().textContent = row.name;
    //
    //Add a cell and display the keywords/ comments associated with the given project
    project.insertCell().textContent = row.keywords;
    //
    //Add a cell for displaying the project problem
    const problem: HTMLTableCellElement = project.insertCell();
    //
    //Display project problem in the cell
    problem.innerHTML = `<p class='problem'>${row.problem}</p>`;
    //
    //Add a click listener event to display either full project problem or summary
    problem.onclick = () => this.toggle(problem);
    //
    //Add a cell to display the project theme
    const theme: HTMLTableCellElement = project.insertCell();
    //
    //Display the theme from the dbase
    theme.textContent = row.theme;
    //
    //
    theme.onclick = () => this.edit(theme, row);
  }
  //
  //TOggles to show summary or detailed view of a project problem
  private toggle(cell: HTMLTableCellElement): void {
    //
    //Get the element holiding the contents
    const elem: HTMLParagraphElement | null = cell.querySelector("p");
    //
    //If the element was not in the cell exit
    if (!elem) return;
    //
    //Finally add the funtionality to display either detailed or summary view of the cell
    elem.classList.toggle("problem");
  }
  //
  //Display dialog that will be used to add or edit a projects theme
  private edit(cell: HTMLTableCellElement, row: project): void {
    //
    //
  }
  //
  //Here we read the value of the input element and compare it to the initial theme
  //If there was a change in the theme we initate the process of saving the new theme
  //othewise we do nothing and retain the initial
  private async update_theme(
    input: HTMLTextAreaElement,
    proj: project
  ): Promise<void> {
    //
    //Read the value of the input
    const current: string = input.value.trim();
    //
    //Compare the input value with the initial theme
    if (current === proj.theme || current === "") return;
    //
    //Otherwise initiate the saving process
    //
    //Collect the layouts
    const layouts: Array<layout> = [
      [current, "project", "theme"], // What we want to save or edit in the dbase
      [proj.name, "project", "name"], // Reference to the project whoes theme was changed
      [this.year, "workplan", "year"], // Reference to the workplan where the project came from
      [proj.surname, "intern", "surname"], // Finally who's workplan is being edited
    ];
    //
    //Save the data using the most common method
    const results: "ok" | string = await exec(
      "questionnaire", //Name of the PHP class to use
      ["tracker_mogaka"], //Constructor arguments
      "load_common", //The method to run
      [
        layouts,
        "/mogaka/schema/v/code/log.xml",
        "/mogaka/schema/v/code/errors.html",
      ] //Method arguments
    );
    //
    //Incase the saving was not succesfull throw an exception
    if (results !== "ok")
      throw new mutall_error(`Theme was not saved due to ${results}`);
    //
    //Alert the user on a succesull save operation
    alert(`${current} theme was saved succesfully`);
  }
}
//
//Dialog that will be used to enter or edit the project theme
class theme extends dialog<string> {
  //
  //Get the project to displayin the form
  constructor(public proj: project, body: HTMLBodyElement) {
    //
    //Initialize the parent class
    super(body, true, "/tracker/v/code/planner/project.html");
  }
  //
  //Display the project we came in with in our form
  async populate(): Promise<void> {
    //
    //Set the intern details
    this.set("intern", "input", this.proj.surname);
    //
    //Display the project name
    this.set("project", "input", this.proj.name);
    //
    //Display the project keywords
    this.set("keywords", "input", this.proj.keywords);
    //
    //Display the project problem
    this.set("problem", "textarea", this.proj.problem);
    //
    //Finally display the theme only if it is not a null otherwise do nothing
    if (this.proj.theme) this.set("theme", "input", this.proj.theme);
  }
  //
  //Given the id of the element to display and the section of the element to display
  //set the content given at the specified section
  private set(id: string, elem: string, content: string): void {
    //
    //Get the element fo the specified id
    const element = this.get_element(id) as HTMLLabelElement;
    //
    //Within the element identify the specific section to display the contents
    const section: HTMLElement | null = element.querySelector(elem);
    //
    //If no specific section exist do the following
    if (!section) {
      //
      //Display the content in the genral area ie the element
      element.textContent = content;
      //
      //Finish the display be exiting
      return;
    }
    //
    //Otherwise if a specific section exist cast the section to either a text area or input element and
    //display the given content on the section
    if (elem === "input") (section as HTMLInputElement).value = content;
    else (section as HTMLTextAreaElement).value = content;
  }
  //
  //Read the value of the given project theme form the form for savign
  async read(): Promise<string | Error | null> {
    //
    //Read the theme entered by the user
    return this.get_value("theme");
  }
  //
  //Finally save the theme to the dbase
  async execute(input: string): Promise<"Ok" | Error> {
    //
    //Collect the layouts
    const layouts: Array<layout> = [
      [input, "project", "theme"], // What we want to save or edit in the dbase
      [this.proj.project, "project", "project"], // Reference to the project whoes theme was changed
    ];
    //
    //Save the data using the most common method
    const results: "ok" | string = await exec(
      "questionnaire", //Name of the PHP class to use
      ["tracker_mogaka"], //Constructor arguments
      "load_common", //The method to run
      [
        layouts,
        "/mogaka/schema/v/code/log.xml",
        "/mogaka/schema/v/code/errors.html",
      ] //Method arguments
    );
    //
    //return the result of the saving process
    if (results === "ok") return "Ok";
    else return new Error(results);
  }
}
