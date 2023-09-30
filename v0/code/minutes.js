//Display the given minutes. The minute has the stucture
/*
<div>
<p>name: Shule</p>
<p>number: 1.1</p>
<p>summary: Remove the color(Green)</p>
<p>detail: significant color are pink, sky blue</p>
</div>

<div>
<p>name: Shule</p>
<p>number: 1.2</p>
<p>summary: Ranking of students</p>
<p>detail: (by subject, alphabetical, summaries)</p>
</div>
*/
export function display(minute) {
    //
    //Group each minute in a container.Structure of a minute
    /*
     {
        name: Shule,
        number: 1.2,
        summary: Ranking of students,
        detail: (by subject, alphabetical, summaries)
    }
    */
    const minuteContainer = document.createElement('div');
    //
    //Within the container display the minutes content
    //1.Create the elements
    //Minutes name paragraph
    const minuteName = document.createElement('p');
    //
    //Minutes number paragraph
    const minuteNumber = document.createElement('p');
    //
    //Minutes summery paragraph
    const minuteSummery = document.createElement('p');
    //
    //Minutes Detail
    const minuteDetail = document.createElement('p');
    //
    //2.Create the textnods to be represented in the elements
    //Create a text representaion of the minute name 
    const name = document.createTextNode(`Name: ${minute.name}`);
    //
    //Create a text representation of the minute number
    const number = document.createTextNode(`\n Number: ${minute.number}`);
    //
    //Create a text representation of the minute summery
    const summery = document.createTextNode(`Summery: ${minute.summery}`);
    //
    //Create a text representation of the minute detail
    const detail = document.createTextNode(`Detail: ${minute.detail}`);
    //
    //3.Add the textnodes to the elements
    //Adding the text representations to the respective elements element
    //Name 
    minuteName.appendChild(name);
    //
    //Number
    minuteNumber.appendChild(number);
    //
    //Summery
    minuteSummery.appendChild(summery);
    //
    //Detail
    minuteDetail.appendChild(detail);
    //
    //Adding the elements to the minute container
    minuteContainer.appendChild(minuteName);
    //
    //3.Display the elements in the container
    //Adding minuteNumber to the container
    minuteContainer.appendChild(minuteNumber);
    //
    //Adding minuteSummery to the container
    minuteContainer.appendChild(minuteSummery);
    //
    //Adding minuteDetail to the container
    minuteContainer.appendChild(minuteDetail);
    //
    //4.Finaly display the minute container in the body
    document.body.appendChild(minuteContainer);
}
;
