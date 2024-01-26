//
//Get the view library to help with presentation utilities
import { view } from "../../../../outlook/v/code/view.js";
//
//Import the server library to help to communicate with the server
import { exec } from "../../../../schema/v/code/server.js";

//
//Define the sturcture of data that will be retrieved form the query
type project = {
  surname: string;
  name: string;
  keywords: string;
  problem: string;
  theme: string;
};
//
//
export class planner extends view {
  //
  constructor() {
    //
    //
    super();
  }
  //
  //Fetch the data form the dbase and prot the table
  public async show_panels(): Promise<void> {
    //
    //Query and get the projects form the database
    const rows: Array<project> = await exec(
      "database",
      ["tracker_mogaka", false],
      "get_sql_data",
      ["/tracker/v/code/planner/planner.sql", "file"]
    );
    //
    //Display the projects in the table
    rows.forEach((row) =>
      this.display_row(
        row,
        this.get_element("tbody") as HTMLTableSectionElement
      )
    );
  }
  //
  //Dispaly a particular project entry in the table
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
    //Add a cell and display the problem of the project
    project.insertCell().textContent = row.problem;
    //
    //Add a cell and display the project theme
    const theme: HTMLTableCellElement = project.insertCell();
    //
    //Create an input and add it to the theme cell
    const input = this.create_element("input", theme, { value: row.theme });
    //
    //Add the save functionality whenever a user looses focus
    input.onblur = () => this.update_theme(input, row.theme);
  }
  //
  //Here we read the value of the input element and compare it to the initial theme
  //If there was a change in the theme we initate the process of saving the new theme
  //othewise we do nothing and retain the initial
  private update_theme(input: HTMLInputElement, initial: string): void {
    //
    //Read the value of the input
    const current: string = input.value;
    //
    //Compare the input value with the initial theme
    if (current === initial) return;
    //
    //Otherwise initiate the saving process
  }
}
