//Import the page class from outlook
import { page } from "../../../../outlook/v/code/view.js";
//
//Import server library
import * as server from "../../../../schema/v/code/server.js";
//
//To support error reporting
import { mutall_error } from "../../../../schema/v/code/schema.js";
//
//Access the registration services from the registration class
import { registration } from "../../../../registration/v/code/registration.js";
//
import { dialog } from '../../../../mashamba/v/code/dialog.js';
//
//Create presentation as an extension of the page class
export class presentation extends page {
    pk;
    anchor;
    //
    //Instance that will help in login and logout operations
    register;
    //
    //The html element that repesers our presntation
    visual;
    //
    //The native form of a presentation is completed before a presentation can
    //be displayed
    native;
    //
    constructor(
    //
    //The primary key of the presentation
    pk, 
    //
    //The element where to hook the presentation; if not provided, the body
    //will be used
    anchor) {
        //Parent class constructor
        super();
        this.pk = pk;
        this.anchor = anchor;
        //
        //Create an instance of the registration class in order to access
        //the services it offers
        this.register = new registration();
    }
    //
    //Initiallize the presentation, ie., all the server related operations
    //Fetch all the data from the database using the provided query and initiate the 
    //process to display the data on the web page
    async init() {
        //
        //Show the presentation in the presentation element
        //
        //Read the sql statement from a file /tracker/v/code/minutes.sql
        let projectsql = await server.exec("path", ["/tracker/v/code/mogaka/presentation.sql", true], "get_file_contents", []);
        //
        //Replace the date and name parameters in the sql with actual values
        const minute2sql = projectsql.replace(":presentation", this.pk.toString());
        //
        //Get the data specified in minutes.sql
        const presentations = await server.exec("database", ["tracker_mogaka", false], "get_sql_data", [minute2sql]);
        //
        //It is an error if there is no presentation retrieved
        if (presentations.length === 0)
            throw new mutall_error(`No presentation found with pk '${this.pk}'`);
        //
        // If the presentation is more than one query is not valid
        if (presentations.length > 1)
            throw new mutall_error(`Not more than one record is expected. '${presentations.length}' were found for the given pk${this.pk}`);
        //
        //Create the element for holding the presentation visual
        const presentation = this.document.createElement('div');
        //
        //Present the query data in the webpage by decomposition(from presentation to contribution)
        await this.show_presentation(presentations[0], presentation);
        //
        // Out of the process return the visual representation of the current presentation
        return presentation;
    }
    //
    //Here we determine if we need to fetch the presentation details from the database 
    //by checking the visual if the visual representation is empty.Immedietly after
    //population of the visual we show the visual at the provided anchor 
    async show_panels() {
        //
        //Clear the achor tag for this presentation
        this.anchor.innerHTML = "";
        //
        //Determine if we need to fetch the presentation detaild from the db
        if (this.visual === undefined) {
            //
            //Fetch and present the presntation infomation in the visual
            this.visual = await this.init();
        }
        //
        //Finally display the presentation at the desired section, i.e., the anchor
        this.anchor.appendChild(this.visual);
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
    async show_presentation(presentation, visual) {
        //
        //Save teh native presentation for future reference
        this.native = presentation;
        //
        //Destructure the only presentation
        const { surname, date, projects } = presentation;
        //
        //Show the data following the sample in template.html
        this.visual = this.create_element('div', this.visual);
        //
        //Create the title of the presentation minutes
        this.create_element("h2", visual, { textContent: `MINUTES FOR ${surname.toUpperCase()} ON ${date}` });
        //
        //Decode and display the projects under the presentation
        JSON.parse(projects).forEach((project) => this.show_project(project, visual));
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
    show_project(data, visual) {
        //
        //Destructure the project
        const { name, minutes } = data;
        //
        //Show the project tag that envelops the summary and the minutes
        const details = this.create_element("details", visual, { className: "project" });
        //Show the summary tag under the project
        this.create_element("summary", details, { textContent: name });
        //
        //Show the minutes under the project
        minutes.forEach((minute) => this.show_minute(minute, details));
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
    show_minute(data, project_details) {
        //
        //Destructure the minute
        const { detail, numeral, summary, contributions, minute, owner } = data;
        //
        //Create a minute detail tag that envelops the summary minute details and
        //the contributions
        const details = this.create_element("details", project_details, { className: "minute" });
        //
        //Create an element to hold the number and summary
        this.create_element("summary", details, { textContent: `${numeral}: ${summary}` });
        //
        //create a content container to hold the minute detail
        this.create_element("p", details, { className: "content", textContent: detail });
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
    show_contributions(anchor, Icontributions, minute_pk, owner) {
        //
        //Create a heading for the contribution
        this.create_element("h3", anchor, { textContent: "Contributions", });
        //
        //Create a button for creating contributions
        const button = this.create_element("button", anchor, { textContent: "Create", });
        //
        //Create a new contribution only with the anchor then edit it to add the actual
        //native contribution and once successful show the contribution
        //
        //Add a listener for creating a contribution
        button.onclick = async () => new contribution(anchor, this, minute_pk).edit();
        //
        //Display the individual contributions if any
        if (Icontributions)
            Icontributions.forEach((Icontribution) => new contribution(anchor, this, Icontribution.minute, Icontribution).show());
    }
    //
    //Method that handles signing in the system
    async sign_in() {
        //
        //Get the user that has logged in/registered
        const User = await this.register.administer();
        //
        //If the registration was aborted, do not continue with sign procedure
        if (User === undefined)
            return;
        //
        //Welcome the user
        alert(`Welcome ${User.name}`);
    }
    //
    //Imlplement the logout functionality to enable logging out using the instance 
    //of the registration class
    sign_out() {
        //
        //Get the name of the user to customise the log out message
        const user = this.register.get_current_user().name;
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
class contribution extends dialog {
    anchor;
    presentation;
    minute;
    native;
    //
    //
    constructor(
    //
    //The section in the page where to show the created contribution
    anchor, 
    //
    //The reference to the presentation object that holds this contribution
    presentation, 
    //
    //The minute for which we are contributing
    minute, 
    //
    //The contribution incase it is fetched from the database
    native) {
        //
        //Parent class initialization
        super({ url: "./contribution.html", anchor }, native);
        this.anchor = anchor;
        this.presentation = presentation;
        this.minute = minute;
        this.native = native;
    }
    //
    //Opposite of get_value
    //Look at the keys of the the data and assume that the form was designed with input element
    //ids that match the keys of the data.go through all the keys of your data and for each key
    //populate the value to the value or textContent attribute of the corresponding element in the 
    //form
    populate(data) {
        //
        //Extract the keys of the data gotten
        const keys = Object.keys(data);
        //
        //Filter to get keys which have elements with corresponding id in the form
        const key_elements = keys.filter(key => document.getElementById(key));
        //
        //look for the elements with simmilar id and populate the data values to the 
        //value attribute of the elements
        key_elements.forEach(key => {
            //
            //Get element and extract all the children
            const elements = Array.from(this.get_element(key).children);
            //
            //From the list of elements extract the elements with the view attribute
            const element = elements.filter(element => 'value' in element);
            //
            //Take care of the anomalies
            //
            //If no element with the attribute value exist within the envelope
            if (element.length === 0)
                throw new mutall_error('Check your envelop labels and make sure they are correct');
            //
            //When there are more than one record with the value attribute 
            if (element.length > 1)
                throw new mutall_error('Check your envelop labels and make sure they are correct');
            //
            //Finally set the value attribute to the value of the specified key
            element[0].value = data[key];
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
    show() {
        //
        //Ensure all the contribution infomation is present before 
        //initiating the display. If native is not provided report to the user and 
        //continue 
        if (this.native === undefined)
            alert("There is no contribution to be displayed");
        //
        //Create a paragraph to display a contribution item
        const anchor = this.create_element("details", this.anchor, { className: "contribution", });
        //
        //Show the summary of the contribution 
        this.create_element("summary", anchor, { textContent: `${this.native?.summary} (${this.native?.surname})` });
        //
        //Show the details of the contribution
        this.create_element("p", anchor, { textContent: this.native?.detail });
        //
        //Add the edit button
        this.create_element("button", anchor, { textContent: "Edit", }).onclick = () => this.edit();
        //
        //Add the delete button
        this.create_element("button", anchor, { textContent: "Delete", }).onclick = () => {
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
    async edit() {
        //
        //Wait for the user to enter the required data and operation
        const data = await this.administer();
        //
        //Upon succesful completion of the saving operation update the contributions
        if (data)
            this.update_this_page(data);
    }
    //
    //Update the contributions page to include the just saved contribution
    update_this_page(data) {
        //
        //Set the data that was saved as the native contribution
        this.native = data;
        //
        //Using the native show the contribution
        this.show();
    }
    //
    //Get the contribution as raw as it is from, the input
    //We expect to get the detail, summary, contributor, etc from from the user
    //The rest of the information is not supplied by the user explicitly
    async read() {
        //
        //Get the summary of the minute. This is mandatory. So, any empty string is a
        //missing data error
        const summary = this.get_value("summary");
        //
        //A null value that is not nullable should be flagged as a case
        //of a poorly designed form
        if (summary === null)
            throw new mutall_error("Summary should be marked as a required attribute");
        //
        //Get the detail of the minute. An empty string should be interpret as a null
        const detail = this.get_value("detail");
        //
        //Get the primary key of the contributor who is currently logged in. If there is
        //nobody logged in, start the registration system. Link this work to Joshua's
        //This refers to the contributor
        const contributor = await this.get_intern_pk();
        //
        //Add information on ref, minute_pk
        const ref = this.get_time();
        //
        //Return the information gathered in an Icontribution structure
        return { type: 'contribution', summary, detail, contributor, minute: this.minute, ref };
    }
    //
    //Get the primary key of the contributor who is currently logged in. If there is
    //nobody logged in, start the registration system. Link this work to Joshua's
    //Using a promise that will only resolve once the user is logged in
    async get_intern_pk() {
        //
        //Get currently logged in intern
        let user = this.presentation.register.get_current_user();
        //
        //Initialte the registration system when no user is found
        if (!user)
            user = await this.presentation.register.administer();
        //
        //Look for corresponding intern incase the registartion was succesful
        if (user)
            return this.get_intern(user.pk);
        //
        //And return an error
        return new Error("You cannot proceed without logging in");
    }
    //
    //Associate a given user to an intern
    //Using the user primary key retrieved from the registration system
    //Formulate a query to retrieve details of a given intern
    //Execute the query returning the primary key of the intern that was fetched from the database
    async get_intern(user) {
        //
        //Formulate the sql for retrieving the user information
        const sql = `SELECT * FROM intern WHERE user = ${user}`;
        //
        //Fetch the intern information using the query
        const results = await server.exec("database", ["tracker_mogaka", false], "get_sql_data", [sql]);
        //
        //Check the results of the query to ensure that only one record was retrieved
        if (results.length === 0)
            return new Error("This user is not registered as an intern");
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
    async save(contribution) {
        //
        //1. Collect the layouts of corresponding data
        const layouts = [
            ...this.collect_layouts(contribution),
        ];
        //
        //2. Using the layouts save the write to the database
        //
        //Save the data collected in layouts to the tracker database, returning ok if
        //successful or a an error as a HTML: string
        const results = await server.exec("questionnaire", //Name of the PHP class to use
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
    *collect_layouts(data) {
        //
        //Destructure the contribution data
        const { summary, detail, contributor, minute, ref } = data;
        //
        //The owner of a presentation must be known
        const owner = this.presentation.native?.intern;
        if (!owner)
            throw new mutall_error('The owner of a presenttain must be known');
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
    get_time() {
        //
        //Create a new instance of the date
        const timestamp = new Date();
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
        const date_time = format.format(timestamp);
        //
        //Separate the date and the time section
        const separated = date_time.split(",");
        //
        //Create a new date that matches the sql format by:-
        //
        //Store the date gotten from above
        let date = separated[0];
        //
        //Split the date to get the month day and year
        //Split the date using the /
        const separated_date = date.split("/");
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
