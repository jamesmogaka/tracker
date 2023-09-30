//Import the page class from outlook
import {page, view} from "../../../../outlook/v/code/view.js";
//
//Import server library
import * as server from "../../../../schema/v/code/server.js";
//
//To support saving of data
import * as quest from "../../../../schema/v/code/questionnaire.js";
//
//To support error reporting
import {mutall_error} from "../../../../schema/v/code/schema.js";
//
//Access the user class to use it as a data type for holding the
//user credentials
import {user} from "../../../../outlook/v/code/app.js";
//
//Access the registration services from the registration class
import {registration} from "../../../../registration/v/code/registration.js";
//
//Define he raw<data> data type where data is an object i.e., an indexed data type
type raw<data extends {[key in keyof data]: data[key]}> = {
    [key in keyof data]: data[key] | Error;
};
//
//Custom data structures to help me in presenting the data that I get
//
//Define a structure to represent the information of an intern
type Iintern = {
    intern: number;
    name: string;
    initials: string;
    day: string;
    start_date: string;
    end_date: string;
    image: string;
    qualification: string;
    year: string;
    university: string;
    user: number;
};
//
//Define the structure of a presentation
export type Ipresentation = {
    presentation: number;
    intern: number;
    surname: string;
    date: string;
    projects: string;
};
//
//Define the project structure
type Iproject = {
    name: string;
    plan: string;
    minutes: Array<Iminute>;
    outcome: string;
    problem: string;
    project: number;
};
//
//Define the minute structure
type Iminute = {
    detail: string;
    numeral: number;
    summary: string;
    contributions: Array<Icontribution>;
    minute: number;
    owner: number;
};
//
//Define the contribution structure, both for new and existing cases
type Icontribution = {
    //
    //The contribution's primary key, if it exists
    contribution?: number;
    //
    //The direct attributes of a contribution
    summary: string;
    detail: string | null;
    ref: string;
    //
    //Support for linking a contribution to...
    //
    //...the contribution intern
    contributor: number;
    surname?: string;
    //
    //..the minute
    minute: number;
    //
    //... the owner of the presentation
    owner?: number;
};
//
//Create presentation as an extension of the page class
export class presentation extends page {
    //
    //Instance that will help in login and logout operations
    public register: registration;
    //
    //
    constructor(
        //
        //The primary key of the presentation
        public pk: number,
        //
        //The element where to hook the presentation; if not provided, the body
        //will be used
        public anchor?: HTMLElement
    ) {
        //
        super();
        //
        //Create an instance of the registration class in order to access
        //the services it offers
        this.register = new registration();
    }
    //
    //Override the show_panels method with the following:-
    //
    /*
        Paint the web document with results fetched from the db
        
        1. Develop a query that gets data form the database in the most suitable 
        form
            /tracker/v/code/minutes.sql
        
        2. Execute the query and get the required results
              
        3. Display the results. 
        */
    public async show_panels(): Promise<void> {
        //
        //Show the presentation in the anchor used in the  constructor
        //
        //Read the sql statement from a file /tracker/v/code/minutes.sql
        let projectsql: string = await server.exec(
            "path",
            ["/tracker/v/code/presentation.sql", true],
            "get_file_contents",
            []
        );
        //
        //Replace the date and name parameters in the sql with actual values
        const minute2sql = projectsql.replace(":presentation", this.pk.toString());
        //
        //Get the data specified in minutes.sql
        const presentations: Array<Ipresentation> = await server.exec(
            "database",
            ["tracker_mogaka", false],
            "get_sql_data",
            [minute2sql]
        );
        //
        //It is an error if there is no presentation retrieved
        if (presentations.length === 0) throw new mutall_error(`No presentation found with pk '${this.pk}'`);
        //
        // If the presentation is more than one query is not valid
        if (presentations.length > 1)
            throw new mutall_error(
                `Not more than one record is expected. '${presentations.length}' were found for the given pk${this.pk}`
            );
        //
        //Present the query data in the webpage by decomposition(from presentation to contribution)
        await this.show_presentation(presentations[0]);
    }
    //
    /*
      The expected html structure looks like this  :-
        <body>
            <h1>Minute for $surname on $date</h1>
            <details>
                <summary>$project.name</summary>
                <details>
                    $minutes
                    $contribution
                </details>
            </details>
            
            ...
            
        </body> 
      */
    private async show_presentation(presentation: Ipresentation): Promise<void> {
        //
        //Destructure the only presentation
        const {surname, date, projects} = presentation;
        //
        //Show the data following the sample in template.html
        //
        //Get the anchor look for the body element
        const anchor: HTMLElement = this.anchor ?? this.query_selector("body");
        //
        //Create the title of the presentation minutes
        this.create_element("h1", anchor, {textContent: `MINUTES FOR ${surname.toUpperCase()} ON ${date}`});
        //
        //Decode and display the projects under the presentation
        JSON.parse(projects).forEach((project: Iproject) => this.show_project(project, anchor));
    }
    //
    //Show a single project with the following structure
    /*
          <details class="project">
            <summary><h2>$project</h2></summary>
            $minutes
          <details>
      */
    private show_project(data: Iproject, body: HTMLElement): void {
        //
        //Destructure the project
        const {name, minutes} = data;
        //
        //Show the project tag that envelops the summary and the minutes
        const details: HTMLDetailsElement = this.create_element("details", body, {className: "project"});
        //Show the summary tag under the project
        this.create_element("summary", details, {textContent: name});
        //
        //Show the minutes under the project
        minutes.forEach((minute: Iminute) => this.show_minute(minute, details));
    }
    //
    //Get the data
    //Display a single minute with the following structure
    /*
          <details class="minute">
            <summary>$minute.summary</summary>
            <div>$ minute.detail</div>
            $minute.contribution
          </details>
      */
    private show_minute(
        data: Iminute,
        project_details: HTMLDetailsElement
    ): void {
        //
        //Destructure the minute
        const {detail, numeral, summary, contributions, minute, owner} = data;
        //
        //Create a minute detail tag that envelops the summary minute details and
        //the contributions
        const details: HTMLDetailsElement = this.create_element("details", project_details, {className: "minute"});
        //
        //Create an element to hold the number and summary
        this.create_element("summary", details, {textContent: `${numeral}: ${summary}`});
        //
        //create a content container to hold the minute detail
        this.create_element("p", details, {className: "content", textContent: detail});
        //
        //Show the contributions
        this.show_contributions(details, contributions, minute, owner);
    }
    //
    //Display contributions following the following html snippet
    /*
          <h3>Contribution</h3>
          <button>Add</button>
          $contributions
      */
    private show_contributions(
        anchor: HTMLElement,
        Icontributions: Array<Icontribution> | null,
        minute_pk: number,
        owner: number,
    ): void {
        //
        //Create a heading for the contribution
        this.create_element("h3", anchor, {textContent: "Contributions", });
        //
        //Create a button for creating contributions
        const button: HTMLButtonElement = this.create_element("button", anchor, {textContent: "Create", });
        //
        //Add a listener for creating a contribution
        button.onclick = async () => await this.create_contribution(minute_pk, anchor, owner);
        //
        //Display the individual contributions if any
        if (Icontributions) Icontributions.forEach((Icontribution) => new contribution(Icontribution, anchor).show());
    }
    //
    //Method that handles signing in the system
    private async sign(): Promise<void> {
        //
        //Get the user that has logged in/registered
        const User: user | undefined = await this.register.administer();
        //
        //If the registration was aborted, do not continue with sign procedure
        if (User === undefined) return;
        //
        //Welcome the user
        alert(`Welcome ${User.name}`);
    }
}
//
//Class responsible for the coontribution
class contribution extends view{
    //
    //
    constructor(
        //
        //The contribution
        public native: Icontribution,
        //
        //
        public anchor: HTMLElement
    ){
        //
        //
        super(); 
    }
    //
    //Display a single contribution with the following structure:-
    /*
      <details onclick='this.select(); this.show_crud()'>
          <summary>$contribution.summary</summary>
          <p>$contribution.details</p>
          <div hidden>
              <button onclick = "contribution.edit_contribution()">Edit</button>
              <button onclick = "contribution.delete_contribution()">Delete</button>
          </div>
      </details>
      */
    public show(): void {
        //
        //Create a paragraph to display a contribution item
        const anchor = this.create_element("details", this.anchor, {className: "contribution", });
        //
        //Show the summary of the contribution 
        this.create_element("summary", anchor, {textContent: `${this.native.summary} (${this.native.surname})`});
        //
        //Show the details of the contribution
        this.create_element("p", anchor, {textContent: this.native.detail});
        //
        //Add the edit button
        this.create_element("button", anchor, {textContent: "Edit", }).onclick = () => {
            alert("Edit this contribution");
        };
        //
        //Add the delete button
        this.create_element("button", anchor, {textContent: "Delete", }).onclick = () => {
            alert("Delete a contribution");
        };
    }
    //Collect, check and write a contribution to the database
    public async save(
        //
        //Return a successfully saved contribution for display
        resolve: (contribution: Icontribution) => void,
        //
        //This links the contribution to the minute during saving
        minute: number,
        //
        // Reference to the owner of the presentation to avoid modification of presentation details
        owner: number
    ): Promise<void> {
        //
        // Extract the contribution as it is from the input dialog
        const contribution: raw<Icontribution> = await this.read_raw_data(minute, owner);
        //
        //Make sure all required info is available i.e., no errors
        if (!this.check(contribution)) return;
        //
        //Write the contribution to the database
        const saved: Icontribution | undefined = await this.write_contribution(contribution as Icontribution);
        //
        //Resolve the promised contribution upon succesful saving operation
        if (saved) resolve(saved);
    }
    //
    //Create a contribution
    private async create(
        //
        //The minute where the contribution is to be created
        minute_pk: number,
        //
        //The element to anchor the new contribution made
        anchor: HTMLElement,
        //
        //Reference to the intern who the minutes belong to
        owner: number
    ): Promise<void> {
        //
        //Wait for the user to input and save a contribution
        const result: Icontribution | "cancel" = await new Promise(
            async (resolve) => await this.get_and_save(resolve, minute_pk, owner)
        );
        //
        //If the contribution was saved successfully display the contribution
        if (result !== "cancel") this.show(result, anchor);
        //
        //Close the dialog box
        (<HTMLDialogElement> this.get_element("contributions_dialog")).close();
    }
    //
    //Collection the contribution from a user (using a dialog box) and save it.
    //You will not get out from this untill a contribution is saved or canceled.
    private async get_and_save(
        resolve: (result: Icontribution | "cancel") => void,
        minute: number,
        owner: number
    ): Promise<void> {
        //
        //1. Get the input elements and clear the input (incase its dirty)
        //
        //1.1 Clear the details
        (<HTMLTextAreaElement> this.get_element("detail")).value = "";
        //
        //1.2 Clear the summary
        (<HTMLTextAreaElement> this.get_element("summary")).value = "";
        //
        //Show the dialog
        (<HTMLDialogElement> this.get_element("contributions_dialog")).showModal();
        //
        //3. After entering contribution details the user can either
        //
        //3.1 ...save the contriburion
        this.get_element("save").onclick = async () => await this.save(resolve, minute, owner);
        //
        //3.2 ... terminate the process by canceling
        this.get_element("cancel").onclick = () => resolve("cancel");
    }
    
    //
    //Get the contribution as raw as it is from, the input
    //We expect to get the detail, summary, contributor, etc from from the user
    //The rest of the information is not supplied by the user explicitly
    private async read_raw_data(minute: number, owner: number): Promise<raw<Icontribution>> {
        //
        //Get the summary of the minute. This is mandatory. So, any empty string is a
        //missing data error
        const summary: string | Error | null = this.get_value("summary");
        //
        //A null value that is not nullable should be flagged as a case
        //of a poorly designed form
        //????????????????
        if (summary === null) throw new mutall_error("Summary should be marked as a required attribute");
        //
        //Get the detail of the minute. An empty string should be interpret as a null
        const detail: string | null | Error = this.get_value("detail");
        //
        //Get the primary key of the contributor who is currently logged in. If there is
        //nobody logged in, start the registration system. Link this work to Joshua's
        //This refers to the contributor
        const contributor: number | Error = await this.get_intern_pk();
        //
        //Add information on ref, minute_pk
        const ref: string = this.get_time();
        //
        //Return the information gathered in an Icontribution structure
        return {summary, detail, contributor, minute, ref, owner};
    }
    //
    //Get the primary key of the contributor who is currently logged in. If there is
    //nobody logged in, start the registration system. Link this work to Joshua's
    //Using a promise that will only resolve once the user is logged in
    private async get_intern_pk(): Promise<number | Error> {
        //
        //Get currently logged in intern
        let user: user | undefined = this.register.get_current();
        //
        //Initialte the registration system when no user is found
        if (!user) user = await this.register.administer();
        //
        //Look for corresponding intern incase the registartion was succesful
        if (user) return this.get_intern(user.pk);
        //
        //And return an error
        return new Error("You cannot proceed without logging in");
    }
    //
    //Associate a given user to an intern
    //Using the user primary key retrieved from the registration system
    //Formulate a query to retrieve details of a given intern
    //Execute the query returning the primary key of the intern that was fetched from the database
    private async get_intern(user: number): Promise<number | Error> {
        //
        //Formulate the sql for retrieving the user information
        const sql = `SELECT * FROM intern WHERE user = ${user}`;
        //
        //Fetch the intern information using the query
        const results: Array<Iintern> = await server.exec(
            "database",
            ["tracker_mogaka", false],
            "get_sql_data",
            [sql]
        );
        //
        //Check the results of the query to ensure that only one record was retrieved
        if (results.length === 0) return new Error("This user is not registered as an intern");
        //.
        //Confirm that there was only one intern registerd from the user primary key
        if (results.length > 1)
            return new Error(`Database design problem!! Only 1 user is expected. ${results.length} found.`);
        //
        //Return the primary key
        return results[0].intern;
    }
    //
    //Do validation of the raw data gotten from the dialog box and return
    //true if there was no error and false if there were errors
    //We validate the data that was explicitly given by the user
    //by testing the raw contribution for presence of errors
    private check(data: raw<Icontribution>): boolean {
        //
        //Get the keys of the raw contribution passed
        const keys: Array<keyof raw<Icontribution>> = Object.keys(data) as Array<keyof raw<Icontribution>>;
        //
        //Out of the keys retrieve the keys which have errors
        const err_keys = keys.filter((key) => data[key] instanceof Error);
        //
        //Report the errors to the user
        err_keys.forEach((key) => this.report_error(key, (<Error> data[key]).message));
        //
        //Return true if there no errors and false when errors are present
        return err_keys.length ? false : true;
    }
    //
    //Use the questionnaire class to write the contribution to the database
    private async write_contribution(
        contribution: Icontribution
    ): Promise<Icontribution | undefined> {
        //
        //1. Collect the layouts of corresponding data
        const layouts: Array<quest.layout> = [
            ...this.collect_layouts(contribution),
        ];
        //
        //2. Using the layouts save the write to the database
        //
        //Save the data collected in layouts to the tracker database, returning ok if
        //successful or a an error as a HTML: string
        const results: "Ok" | string = await server.exec(
            "questionnaire", //Name of the PHP class to use
            ["tracker_mogaka"], //Constructor arguments
            "load_common", //The method to run
            [layouts] //Method arguments
        );
        //
        //Incase saving was succesful return the contribution
        if (results == "Ok") return contribution;
        //
        //Report the results
        this.get_element("report").textContent = results;
        //
        //Exit
        return;
    }
    //
    //Collect all the data required to save a contribution along the following
    //lines
    //
    //The focus of our saving is the contribution.summary and the contribution.detail
    //
    //The following data must be available for the content to be saved
    //
    //The identifiers of contribution are:-
    //intern(contributor), minute, contribution.ref
    //
    //The identifiers of intern are:-
    //intern.surname intern.intern
    //
    //The identifiers of minute are:-
    //presentation.presentation, minute.minute, intern.intern(Owner)
    private *collect_layouts(data: Icontribution): Generator<quest.layout> {
        //
        //Destructure the contribution data
        const {summary, detail, contributor, minute, ref, owner} = data;
        //
        //produce layout of contribution summary
        yield [summary, "contribution", "summary", ["contributor"]],
            //
            //Produce the layout of the detail
            yield [detail, "contribution", "detail", ["contributor"]],
            //
            //Get the current timestamp when the contribution was made
            yield [ref, "contribution", "ref", ["contributor"]],
            //
            //produce layout of intern/owner
            yield [owner!, "intern", "intern", ["owner"]],
            //
            //produce layout of intern/contributor
            yield [contributor, "intern", "intern", ["contributor"]],
            //
            //produce layout of minute
            yield [minute, "minute", "minute"],
            //
            //Get the presentation identifying the minute
            yield [this.pk, "presentation", "presentation", ["owner"]];
    }
    //
    //Return a  current timestamp as a string with the following pattern below:-
    // yyyy-mm-dd HH:mm:ss i.e. 2023-07-26 20:53:37
    //
    //Get the current time stamp as is given
    //Create a pattern of the desired timestamp
    //Use the defined pattern to format the current timestamp
    //Return the formatted timestamp as a string
    //
    //Get current time in a format acceptable by sql
    private get_time(): string {
        //
        //Create a new instance of the date
        const timestamp: Date = new Date();
        //
        //Format the date to a format acceptable by mysql
        //
        //Create the format with the help of the Int1
        const format = new Intl.DateTimeFormat("en-UK", {
            year: "numeric",
            month: "2-digit",
            day: "2-digit",
            hour: "2-digit",
            minute: "2-digit",
            second: "2-digit",
            hour12: false,
        });
        //
        //Get the date that is formatted (mm-dd-yyyy, HH:mm:ss)
        const date_time: String = format.format(timestamp);
        //
        //Separate the date and the time section
        const separated: Array<string> = date_time.split(",");
        //
        //Create a new date that matches the sql format by:-
        //
        //Store the date gotten from above
        let date: string = separated[0];
        //
        //Split the date to get the month day and year
        //Split the date using the /
        const separated_date: Array<string> = date.split("/");
        //
        //Compose a new date following the format yyyy-mm-dd
        date = `${separated_date[2]}-${separated_date[1]}-${separated_date[0]}`;
        //
        //Combine the new date with the time and return the resulting timestamp
        const current = date.concat(separated[1]);
        //
        return current;
    }
}
