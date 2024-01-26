//Get the view library to help with presentation utilities
import { mutall_error, view } from "../../../../outlook/v/code/view.js";
//
//Import the server library to help to communicate with the server
import { exec } from "../../../../schema/v/code/server.js";
//
//Get the datatype/ definaition of a layout from the questionaaire lib
import { layout } from "../../../../schema/v/code/questionnaire.js";
//
//Define the sturcture of data that will be retrieved form the query
type project = {
  surname: string;
  name: string;
  keywords: string;
  problem: string;
  theme: string;
};

export class planner extends view {
  //
  constructor(public year: string = String(new Date().getFullYear())) {
    //
    super();
  }
  //
  //Fetch the data form the dbase and prot the table
  public async show_panels(): Promise<void> {
    //
    //The sql statement to get the required data from the dbase
    const sql: string = `
    select
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
        workplan.year = ${this.year}`;
    //
    //Query and get the projects form the database
    const rows: Array<project> = await exec(
      "database",
      ["tracker_mogaka", false],
      "get_sql_data",
      [sql]
    );
    //
    //Display the projects in the table
    rows.forEach(async (row) =>
      this.display_row(
        row,
        this.get_element("tbody") as HTMLTableSectionElement
      )
    );
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
    //Add a cell and display the problem of the project
    project.insertCell().textContent = row.problem;
    //
    //Add a cell and display the project theme
    const theme: HTMLTableCellElement = project.insertCell();
    //
    //Create an input and add it to the theme cell
    const input = this.create_element("input", theme, {
      value: row.theme ?? "",
    });
    //
    //Add the save functionality whenever a user looses focus
    input.onblur = async () => await this.update_theme(input, row);
  }
  //
  //Here we read the value of the input element and compare it to the initial theme
  //If there was a change in the theme we initate the process of saving the new theme
  //othewise we do nothing and retain the initial
  private async update_theme(
    input: HTMLInputElement,
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
    const results: "Ok" | string = await exec(
      "questionnaire", //Name of the PHP class to use
      ["tracker_mogaka"], //Constructor arguments
      "load_common", //The method to run
      [layouts] //Method arguments
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
