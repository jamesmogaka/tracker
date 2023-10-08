//
// Importmutall error from the library
import { mutall_error } from "./../../../../schema/v/code/schema.js";
//Import the page and view class from outtlook
import { page } from "./../../../../outlook/v/code/view.js";
//The project interface was delevopled by mogaka; hence the namespace
import * as mogaka from "./../mogaka/presentation.js";
//Execute PHP methods from javascript
import { exec } from "./../../../../schema/v/code/server.js";
//
// The class or displaying the timetable 
export class timetable extends page {
    //
    //The data that drives the tmetable
    model;
    // 
    constructor() {
        super();
    }
    //See the dummy.html file for the view
    async show_panels() {
        //
        //1.Run the query to get the timetable (data)
        this.model = await this.get_timetable();
        //
        //2. Attach the timetable to the navigation at the header
        this.show_nav('mobile');
        //
        //3. Attach the timetable to the right navigation panel
        this.show_nav('left');
    }
    //Retrieve the data that drives this time table
    async get_timetable() {
        //
        //Get the file that has the sql to run
        const str = '/tracker/v/code/sharon/timetable.sql';
        //
        //Execute the sql and get the database rows
        const rows = await exec('database', ['tracker_mogaka'], 'get_sql_data', [str, 'file']);
        //
        //Decode the intern string to an Iitern structure
        const Itimetables = rows.map(row => ({
            day_code: row.day_code,
            day_name: row.day_name,
            intern: JSON.parse(row.intern)
        }));
        //
        // Return the time table data
        return Itimetables;
    }
    // 
    //Show the navigation contents in the identifed (panel) anchor
    async show_nav(id) {
        //
        //1. Get the named anchor element
        const anchor = this.get_element(id);
        //
        //2. Read the dummy html fragment; it represents one day of the timetable.
        //Read about the fetch command
        const html = await this.get_dummy_html();
        //
        //3.Use the dummy fragment to show as many daya as there are in the 
        //curren othegiven anchor
        this.model?.forEach(day => this.show_day(day, anchor, html));
    }
    //
    //2. Read the dummy html fragment; it represents one day of the timetable.
    //Read about the fetch command
    async get_dummy_html() {
        //
        // Get a server response using the dummy file
        const response = await fetch('./dummy.html');
        // 
        // Check whether there was an error in server-client communication 
        // If there is an error report it to the user and stop the processing
        if (!response.ok)
            throw new mutall_error("Something went wrong with the fetch");
        //
        // Use the response to get the requested text
        const text = await response.text();
        //
        //Return the dummy text as requested 
        return text;
    }
    /*
     <details class="day" open="">
        <summary data-day_name>Monday</summary>
        $fragment
        $fragment
        ...
    </details>
    */
    show_day(day, anchor, fragment) {
        //
        //3.1 Create a details day element attached to the anchor
        const day_element = this.create_element("details", anchor, { className: "day" });
        //
        // Create a summary tag and attach the day_name
        this.create_element("summary", day_element, { textContent: day.day_name });
        //
        //Display each intern's personal details, by populating a htm fragment
        day.intern.forEach(intern => this.show_intern(day_element, fragment, intern));
    }
    //Display each intern's personal details, by populating the following html 
    //fragment
    /*
     <details style="margin-left:10px">
        <summary>
            <img data-image src="http://drive.google.com/uc?export=view&id=10KYtxL82ANblZbwrAgMc_R7WoHTu8KKD"
                alt=""
                style="height:50px"/>
            <span data-name>George Kanga'ra(GK)</span>
        </summary>
        <p>
            <span data-qualification>Bsc. Computer Technology</span>:&nbsp;
            <span data-year>2019</span>
        </p>
        <p data-university>Meru University</p>
        <a data-workplan href="https://dev.mutall.co.ke/tracker/portfolio/2023/kangara.html">
            Workplan 2023
        </a>
        <details data-presentatations>
            <summary>Presentations</summary>
            <!--
            <div onclick="this.mogaka.show_presentation(23)">2/5/2023</div>
            <div onclick="this.mogaka.show_presentation(43)">9/5/2023</div>
            -->
        </details>
    </details>
     */
    //All tags marked ith the data-* attribute needs to be completed from the 
    //given Iitern data whose structure is:-
    //
    //{
    //Direct mappings..
    // fullname, surname, year, qualification, university, 
    //
    //special mappings
    // image, workplan, presentations
    //}
    //Start by populating the direct mappings, followed by the special cases
    show_intern(anchor, fragment, intern) {
        //
        //Show the details tag(indirectly, i.e., using outerHTML)
        const details = this.show_details(anchor, fragment);
        //
        //Show summary associated with the details
        this.show_summary(details, intern.image, intern.name);
        //
        //Show  the personal data for the intern (presenter). (using same direct mapping)
        this.show_personal_details(details, intern.qualification, intern.year, intern.university);
        //
        //Show workplan as hyperlikk (that opens a opendeto a new page in the old 
        //version) that populates the content panel with the inern's workplan
        this.show_workplan(details, intern);
        //
        //Show all presetations for this intern sorted by the most recent first
        this.show_presentations(details, intern.presentations);
    }
    //Show the details tag(indirectly, i.e., using outerHTML)
    show_details(anchor, fragment) {
        //
        //Create the details elemenet and attach to the achor elenent
        const details = this.create_element('details', anchor);
        //
        //Replace the element with the fragment
        details.innerHTML = fragment;
        //
        return details;
    }
    //Show summary associated with the details
    /*
     <summary>
            <img data-image src="http://drive.google.com/uc?export=view&id=10KYtxL82ANblZbwrAgMc_R7WoHTu8KKD"
                alt=""
                style="height:50px"/>
            <span data-name>George Kanga'ra(GK)</span>
        </summary>
     */
    show_summary(fragment, image, name) {
        //
        //1. Show Image
        //1.1 Look image tag with the data-image attribute
        const image_tag = fragment.querySelector("[data-image]");
        //
        // 1.2 If the image is null throw an error
        if (image_tag === null)
            throw new mutall_error(`No image found in your fragment`);
        //
        // 1.3 If there is no instance of image throw anerror
        if (!(image_tag instanceof HTMLImageElement))
            throw new mutall_error('Image Element expected');
        //
        //1.3Set its source to the image value
        image_tag.src = image;
        //
        //2.Show the interns name
        this.show_key('name', name, fragment);
    }
    //
    //Show  the personal data for the intern (presenter). (using same direct mappi                                 <span data-qualification>Bsc. Computer Technology</span>:&nbs                <span data-year>2019</sp            <            <p data-university>Meru University<         */
    show_personal_details(fragment, qualification, year, university) {
        //
        // Show the qualification of an intern
        this.show_key('qualification', qualification, fragment);
        //
        // Show the year of completion of an intern
        this.show_key('year', year, fragment);
        //
        // Show the university an inern attended
        this.show_key('university', university, fragment);
    }
    //Showing the value of a key
    show_key(key, value, fragment) {
        //
        // 1. Find an element described by a key in a fragment
        const elem = fragment.querySelector(`[data-${key}]`);
        //
        // 2. If the element is null throw an error
        if (elem === null)
            throw new mutall_error(`No ${key} found in your fragment`);
        //
        // 3. Populate the element of the given key with the intern details
        elem.textContent = value;
    }
    /*
     * The is expected to look as below
            <div onclick="this.mogaka.show_presentation(23)">2/5/2023</div>
            <div onclick="this.mogaka.show_presentation(43)">9/5/2023</div>
     */
    show_presentations(fragment, presentation) {
        //
        // Get the presentations element
        const presentations = fragment.querySelector("[data-presentations]");
        //
        // if the presentations element is null, throw an error
        if (presentations === null) {
            throw new mutall_error("No presentation element found");
        }
        //
        //Display each presentation
        if (presentations && presentation !== null)
            presentation.forEach(p => {
                // create the div tag 
                const div = this.create_element("div", presentations, { className: "presentations" });
                //
                //Attach the text content which is the date
                div.textContent = p.date;
                //
                // Add the onclick
                // get the content anchor tag
                const content = this.get_element("content");
                //
                //Get mogakas project
                const presentation = new mogaka.presentation(p.presentation, content);
                //
                //Attach the mokaga'sevent
                div.onclick = async () => await presentation.show_panels();
            });
    }
    //
    //Show workplan as hyperlink(that opende to a new page in the old 
    //version) that populates the content panel with the inern's workplan
    /*
     <a data-workplan onclick = ()=>new workplan().show(Iintern)">
        Workplan 2023
    </a>
     */
    show_workplan(fragment, intern) {
        //
        //
        // Find the element with data-workplan attribute
        const elem = fragment.querySelector(`[data-workplan]`);
        //
        // Report to the user if the element cannot be found
        if (elem === null)
            throw new mutall_error(`No workplan found in your fragment`);
        //
        //Add the listener for listing the inerrens 'workplan in the content pane
        elem.onclick = () => new workplan(elem, intern).show();
    }
}
//
// The class workplan is for displaying a workplan of an intern
class workplan extends page {
    fragment;
    intern;
    constructor(fragment, intern) {
        super();
        this.fragment = fragment;
        this.intern = intern;
    }
    //
    //  The show method is supposed to show the workplan of an intern on the 
    //  content panel as shown below
    /*
    <details>
        <summary data-name><h1 style="display:inline">Chat</h1></summary>
        <h2>Problem</h2>
        <p data-problem>
            Real-time communication between users has been a problem with the Mutall
            Outlook/Schema Library.With WebSockets, as a compliment to the existing
            messaging system .i.e, the Mutall Messaging and Emailing System.The
            development of the Chat System will enable real time communication and
            an application that will Rival WhatsApp.
        </p>
        <h2>Plan</h2>
        <p data-plan>
            Develop a Chat System so well established that it will compete with
            WhatsApp and our users will instead use the Mutall Chat(For lack of a
            better naming) instead.
        </p>
        <h2>Outcome</h2>
        <p data-outcome>system</p>
    </details>
    ....
     */
    async show() {
        //
        // Clear the content panel when showing the workplan
        this.get_element('content').innerHTML = "";
        // 
        //
        //Attach the workplan to the content panel 
        const content = await this.get_workplan_dummy_html();
        //
        // If there is no workplan return
        if (this.intern.workplan.length === 0)
            return;
        //
        //1.Use the dummy fragment to show the workplan for each intern 
        this.intern.workplan.forEach(project => {
            //
            // Use the dummy fragment to show the workplan for each intern
            const details = this.show_details(content);
            //
            // Populate Each interns details
            this.populate_project(details, project);
        });
    }
    //
    // Fetch the dummy to display the workplan and is the one that will be used 
    // in populating the workplan:-
    async get_workplan_dummy_html() {
        //
        // Get a server response using the dummy file
        const response = await fetch('./workplan_dummy.html');
        // 
        // Check whether there was an error in server-client communication 
        // If there is an error report it to the user and stop the processing
        if (!response.ok)
            throw new mutall_error("Something went wrong with the fetch");
        //
        // Use the response to get the requested text
        const text = await response.text();
        //
        //Return the dummy text as requested 
        return text;
    }
    //
    // Show the workplan as shown below      
    /*
        <details>
        <summary data-name><h1 style="display:inline">Chat</h1></summary>
        <h2>Problem</h2>
        <p data-problem>
            Real-time communication between users has been a problem with the Mutall
            Outlook/Schema Library.With WebSockets, as a compliment to the existing
            messaging system .i.e, the Mutall Messaging and Emailing System.The
            development of the Chat System will enable real time communication and
            an application that will Rival WhatsApp.
        </p>
        <h2>Plan</h2>
        <p data-plan>
            Develop a Chat System so well established that it will compete with
            WhatsApp and our users will instead use the Mutall Chat(For lack of a
            better naming) instead.
        </p>
        <h2>Outcome</h2>
        <p data-outcome>system</p>
        </details>
     */
    //
    // This is a function for populating the keys
    populate_key(key, fragment, projects) {
        //
        // 1. Find an element described by a key in a fragment
        const elem = fragment.querySelector(`[data-${key}]`);
        //
        // 2. If the element is null throw an error
        if (elem === null)
            throw new mutall_error(`No ${key} found in your fragment`);
        //
        // 3. Populate the element of the given key with the intern details
        elem.textContent = String(projects[key]);
        //
        // 4. Return the element
        console.log(elem);
        return elem;
    }
    //
    // Populate each project of an intern which includes the name,problem,plan 
    // and outcome 
    populate_project(details, project) {
        //
        // Get the keys of the data
        const keys = ['name', 'problem', 'plan', 'outcome'];
        //
        //Loop through each identifier of a project
        keys.forEach(key => this.populate_key(key, details, project));
    }
    //
    //Show the details tag(indirectly, i.e., using outerHTML)
    show_details(fragment) {
        //1.Get the content panel id
        const content = this.get_element('content');
        //
        //Create the details elemenet and attach to the anchor elenent which is
        // the content panel
        const div = this.create_element('div', content);
        //
        //Replace the element with the fragment
        div.innerHTML = fragment;
        //
        //Return the fragmment
        return div;
    }
}
