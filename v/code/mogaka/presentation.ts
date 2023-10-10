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
import {dialog, raw} from '../../../../mashamba/v/code/dialog.js';
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
    //This is a user input
    type:'contribution';
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
    
};
//
//Create presentation as an extension of the page class
export class presentation extends page {
    //
    //Instance that will help in login and logout operations
    public register: registration;
    //
    //The html element that repesers our presntation
    public visual?:HTMLDivElement;
    //
    //The native form of a presentation is completed before a presentation can
    //be displayed
    public native?:Ipresentation;
    //
    constructor(
        //
        //The primary key of the presentation
        public pk: number,
        //
        //The element where to hook the presentation; if not provided, the body
        //will be used
        public anchor: HTMLElement
    ) {
        //Parent class constructor
        super();
        //
        //Create an instance of the registration class in order to access
        //the services it offers
        this.register = new registration();
    }

    //
    //Initiallize the presentation, ie., all the server related operations
    //Fetch all the data from the database using the provided query and initiate the 
    //process to display the data on the web page
    async init():Promise<HTMLDivElement>{
        //
        //Show the presentation in the presentation element
        //
        //Read the sql statement from a file /tracker/v/code/minutes.sql
        let projectsql: string = await server.exec(
            "path",
            ["/tracker/v/code/mogaka/presentation.sql", true],
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
        //Create the element for holding the presentation visual
        const presentation: HTMLDivElement = this.document.createElement('div'); 
        //
        //Present the query data in the webpage by decomposition(from presentation to contribution)
        await this.show_presentation(presentations[0],presentation);
        //
        // Out of the process return the visual representation of the current presentation
        return presentation;
    }
    //
    //Here we determine if we need to fetch the presentation details from the database 
    //by checking the visual if the visual representation is empty.Immedietly after
    //population of the visual we show the visual at the provided anchor 
    public async show_panels(): Promise<void> {
        //
        //Clear the achor tag for this presentation
        this.anchor.innerHTML = "";
        //
        //Determine if we need to fetch the presentation detaild from the db
        if (this.visual===undefined) {
            //
            //Fetch and present the presntation infomation in the visual
            this.visual = await this.init();
        }
        //
        //Finally display the presentation at the desired section, i.e., the anchor
        this.anchor.appendChild(this.visual as Node);
    }
    //
    /*
      The expected html structure looks like this  :-
        <$anchor>
            <h1>Minute for $surname on $date</h1>
            <details>
                <summary>$project.name</summary>
                <details>
                    $minutes
                    $contribution
                </details>
            </details>
            
            ...
            
        </$anchor> 
      */
    private async show_presentation(presentation: Ipresentation,visual:HTMLElement): Promise<void> {
        //
        //Save teh native presentation for future reference
        this.native= presentation;
        //
        //Destructure the only presentation
        const {surname, date, projects} = presentation;
        //
        //Show the data following the sample in template.html
        this.visual = this.create_element('div', this.visual!);
        //
        //Create the title of the presentation minutes
        this.create_element("h2", visual, {textContent: `MINUTES FOR ${surname.toUpperCase()} ON ${date}`});
        //
        //Decode and display the projects under the presentation
        JSON.parse(projects).forEach((project: Iproject) => this.show_project(project,visual));
        
    }
    //
    //Show a single project with the following structure
    /*<$anchor>
          <details class="project">
            <summary><h2>$project</h2></summary>
            $minutes
          <details>
     </$anchor>     
      */
    private show_project(data: Iproject, visual:HTMLElement): void {
        //
        //Destructure the project
        const {name, minutes} = data;
        //
        //Show the project tag that envelops the summary and the minutes
        const details: HTMLDetailsElement = this.create_element("details", visual, {className: "project"});
        //Show the summary tag under the project
        this.create_element("summary", details, {textContent: name});
        //
        //Show the minutes under the project
        minutes.forEach((minute: Iminute) => this.show_minute(minute, details));
    }
    //
    //Display a single minute with the following structure
    /*<$project>
          <details class="minute">
            <summary>$minute.summary</summary>
            <div>$ minute.detail</div>
            $minute.contribution
          </details>
      </$project>    
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
        //Create a new contribution only with the anchor then edit it to add the actual
        //native contribution and once successful show the contribution
        //
        //Add a listener for creating a contribution
        button.onclick = async () => new contribution(anchor, this, minute_pk).edit();
        //
        //Display the individual contributions if any
        if (Icontributions) Icontributions.forEach((Icontribution) => new contribution(anchor,this,Icontribution.minute, Icontribution).show());
    }
    //
    //Method that handles signing in the system
    public async sign_in(): Promise<void> {
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
    //
    //Imlplement the logout functionality to enable logging out using the instance 
    //of the registration class
    public sign_out():void{
        //
        //Get the name of the user to customise the log out message
        const user: string = this.register.get_current_user()!.name
        //
        //Log out
        this.register.logout();
        //
        //Bid farewell to the user
        alert(`Bye ${user}.Feel free to log in again. `);
    }
}
//
//Class responsible for the coontribution
class contribution extends dialog<Icontribution>{
    //
    //
    constructor(
        //
        //The section in the page where to show the created contribution
        public anchor: HTMLElement,
        //
        //The reference to the presentation object that holds this contribution
        public presentation:presentation,
        //
        //The minute for which we are contributing
        public minute:number,
        //
        //The contribution incase it is fetched from the database
        public native?: Icontribution,
    ){
        //
        //Parent class initialization
        super({url:"/tracker/v/code/mogaka/contribution.html",anchor},native);    
    }
    //
    //Opposite of get_value
    //Look at the keys of the the data and assume that the form was designed with input element
    //ids that match the keys of the data.go through all the keys of your data and for each key
    //populate the value to the value or textContent attribute of the corresponding element in the 
    //form
    public populate(data:Icontribution):void{
        //
        //Extract the keys of the data gotten
        const keys: Array<keyof Icontribution> = Object.keys(data) as Array<keyof Icontribution>;
        //
        //Filter to get keys which have elements with corresponding id in the form
        const key_elements = keys.filter(key => document.getElementById(key));
        //
        //look for the elements with simmilar id and populate the data values to the 
        //value attribute of the elements
        key_elements.forEach(key=>{
            //
            //Get element and extract all the children
            const elements:Array<any> = Array.from(this.get_element(key).children);
            //
            //From the list of elements extract the elements with the view attribute
            const element: Array<any> = elements.filter(element=> 'value' in element);
            //
            //Take care of the anomalies
            //
            //If no element with the attribute value exist within the envelope
            if (element.length === 0) 
                throw new mutall_error('Check your envelop labels and make sure they are correct');
            //
            //When there are more than one record with the value attribute 
            if(element.length > 1) 
                throw new mutall_error('Check your envelop labels and make sure they are correct');
            //
            //Finally set the value attribute to the value of the specified key
            element[0].value = data[key] 
        });
    }
    
    //
    //Display a single contribution with the following structure:-
    /*
      <details onclick='this.select(); this.show_crud()'>
          <summary>$contribution.summary</summary>
          <p>$contribution.details</p>
          <div hidden>
              <button onclick = "contribution.edit()">Edit</button>
              <button onclick = "contribution.delete()">Delete</button>
          </div>
      </details>
      */
    public show(): void {
        //
        //Ensure all the contribution infomation is present before 
        //initiating the display. If native is not provided report to the user and 
        //continue 
        if (this.native === undefined) alert("There is no contribution to be displayed")
        //
        //Create a paragraph to display a contribution item
        const anchor = this.create_element("details", this.anchor, {className: "contribution", });
        //
        //Show the summary of the contribution 
        this.create_element("summary", anchor, {textContent: `${this.native?.summary} (${this.native?.surname})`});
        //
        //Show the details of the contribution
        this.create_element("p", anchor, {textContent: this.native?.detail});
        //
        //Add the edit button
        this.create_element("button", anchor, {textContent: "Edit", }).onclick = () => this.edit();
        //
        //Add the delete button
        this.create_element("button", anchor, {textContent: "Delete", }).onclick = () => {
            alert("Delete a contribution");
        };
    }
    //
    //This method is used for creating new and editing existing contributions
    //When creating a new contribution the parent must be provided. 
    /*
      <details onclick='this.select(); this.show_crud()'>
          <summary>$contribution.summary</summary>
          <p>$contribution.details</p>
          <div hidden>
              <button onclick = "contribution.edit()">Edit</button>
              <button onclick = "contribution.delete()">Delete</button>
          </div>
      </details>
    */
    //If the display above is not rendered then assume that the contribution
    //was not created. In case of errors the user should be informed of where there
    //was a problem 
    public async edit(): Promise<void> {
        //
        //Wait for the user to enter the required data and operation
        const data:Icontribution| undefined = await this.administer();
        //
        //Upon succesful completion of the saving operation update the contributions
        if(data) this.update_this_page(data);
    }
    //
    //Update the contributions page to include the just saved contribution
    private update_this_page(data:Icontribution):void {
        //
        //Set the data that was saved as the native contribution
        this.native = data
        //
        //Using the native show the contribution
        this.show();
    }
    //
    //Get the contribution as raw as it is from, the input
    //We expect to get the detail, summary, contributor, etc from from the user
    //The rest of the information is not supplied by the user explicitly
    async read(): Promise<raw<Icontribution>> {
        //
        //Get the summary of the minute. This is mandatory. So, any empty string is a
        //missing data error
        const summary: string | Error | null = this.get_value("summary");
        //
        //A null value that is not nullable should be flagged as a case
        //of a poorly designed form
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
        return {type:'contribution', summary, detail, contributor, minute:this.minute, ref};
    }
    //
    //Get the primary key of the contributor who is currently logged in. If there is
    //nobody logged in, start the registration system. Link this work to Joshua's
    //Using a promise that will only resolve once the user is logged in
    private async get_intern_pk(): Promise<number | Error> {
        //
        //Get currently logged in intern
        let user: user | undefined = this.presentation.register.get_current_user();
        //
        //Initialte the registration system when no user is found
        if (!user) user = await this.presentation.register.administer();
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
    //Use the questionnaire class to write the contribution to the database
    public async save(
        contribution: Icontribution
    ): Promise<'ok'|Error> {
        //
        //1. Collect the layouts of corresponding data
        const layouts: Array<quest.layout> =[...this.collect_layouts(contribution)];
        //
        //2. Using the layouts save the write to the database
        //
        //Save the data collected in layouts to the tracker database, returning ok if
        //successful or a an error as a HTML: string
        const results: "ok" | string = await server.exec(
            "questionnaire", //Name of the PHP class to use
            ["tracker_mogaka"], //Constructor arguments
            "load_common", //The method to run
            [layouts] //Method arguments
        );
        //
        //
        return results === "ok" ? "ok" : new Error(results);
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
        const {summary, detail, contributor, minute, ref} = data;
        //
        //Check to see if we are modifying an existing contribution or we are
        //creating a new one. In cases of modification the data_original property 
        //holds an original contribution from the database. otherwise the 
        //data_original is undefined
        //Generate different layouts depending on the situation 
        if(this.data_original){
            //
            //The primary key of the contribution
            yield[this.data_original.contribution!, "contribution", "contribution" ], 
            //
            //The Summary of the contribution
            yield[summary, "contribution", "summary"],
            //
            //The detail of the contribution
            yield[detail, "contribution", "detail"];
        } else{
            //
            //The owner of a presentation must be known
            const owner = this.presentation.native?.intern;
            if (!owner) throw new mutall_error('The owner of a presenttain must be known');
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
                yield [owner, "intern", "intern", ["owner"]],
                //
                //produce layout of intern/contributor
                yield [contributor, "intern", "intern", ["contributor"]],
                //
                //produce layout of minute
                yield [minute, "minute", "minute"],
                //
                //Get the presentation identifying the minute
                yield [this.presentation.pk, "presentation", "presentation", ["owner"]];
        }
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
