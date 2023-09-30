/*
 The data that will be retrieved should satisfy the following types:- 
 
 *Intern presentation which has the presentation pk and an agenda
 Ipresentation = {
    presentation: number,
    intern:number,
    surname:string,
    date:string,
    projects:Array<Iproject>,
 }
 
 *Project which are composed of intern project alongside the 
 presentation minutes
 Iproject = {
    name: string,
    plan: string,
    minutes: Array<Iminute>,
    outcome: string,
    problem: string,
    project: number
 }
 
 *Minutes which are all minutes from a particular project
 Iminute = {
    detail: string,
    numeral: number,
    summary: string,
    contributions: Array<Icontribution>,
    minute: number,
 }
 
 *Finally Contribution from other interns
 Icontribution = {
    contribution:number,
    summary: string,
    detail:string,
    intern: string,
    minute:number,
    ref: string
 }
 */
WITH 
    # Get the contributions from the contributions table
    /*
     {
        contribution:number,
        summary: string,
        detail:string,
        intern: string,
        minute:number,
        ref: string
     }
    */
    contribution as (
        SELECT
            minute,
            json_arrayagg(
                json_object(
                    'contribution', contribution,
                    'summary', summary,
                    'detail', detail,
                    'intern', intern,
                    'minute', minute,
                    'ref', ref
                )
            ) AS contributions
        FROM
            contribution
        GROUP BY
            minute
    ),
    #
    #Get the raw minutes alongside the contributions
    /*
     {
        minute: number,
        detail: string,
        numeral: number,
        summary: string,
        contributions: Array<Icontribution>,
        
     }
     */
    minute as (
        SELECT
            minute.project,
            minute.presentation,
            json_object(
                'minute', minute.minute,
                'detail', minute.detail,
                'numeral', minute.number,
                'summary', minute.summary,
                'contributions', contribution.contributions
            ) AS minute
        FROM
            minute
            LEFT JOIN contribution ON contribution.minute = minute.minute
        WHERE minute.presentation = 39
        GROUP BY minute.presentation, minute.project
    ),
    # 
    # Combine all the minutes of a given project in the following structure
    /*
        {
            project: number,
            minutes: Array<minutes>
        }
    */
    project_minute as (
        SELECT
            project,
            json_arrayagg(minute) AS minutes
        FROM
            minute
        GROUP BY project
    ),
    #
    # Get the project data in the following json structure
    /*
    {
        project: number,
        name: string,
        plan: string,
        outcome: string,
        problem: string,
        minutes: Array<Iminute>
     }
    */
    project as (
        SELECT
            project.project,
            json_arrayagg(
                json_object(
                    'project', project.project,
                    'name', project.name,
                    'problem', project.problem,
                    'plan', project.plan,
                    'outcome', project.outcome,
                    'minutes', project_minute.minutes
                )
            ) AS data
        FROM 
            project
            RIGHT JOIN project_minute ON project_minute.project = project.project
        GROUP BY 
            project.project
    ),

    presentation_project as(
        SELECT
            presentation,
            json_arrayagg(data) as projects
        FROM
            project
        GROUP BY
            presentation
    ),
    /*
        {
            presentation: number,
            intern:number,
            surname:string,
            date:string,
            projects:Array<Iproject>,
        }
    */
    presentation as (
        SELECT
            presentation.presentation,
            presentation.intern,
            intern.surname,
            presentation.date,
            presentation_project.projects
        FROM
            presentation
            INNER JOIN intern ON presentation.intern = intern.intern
            RIGHT JOIN presentation_project ON presentation_project.presentation = presentation.presentation
    )

SELECT
    *
FROM
    project
