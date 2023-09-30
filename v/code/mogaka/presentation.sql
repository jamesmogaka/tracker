# 
# Explain the strategy for formulating the query???

WITH 
    # Get the contributions from the contributions table
    /*
    type Icontribution = {
        contribution:number,
        summary: string,
        detail:string,
        intern: number,
        surname:string,
        minute:number,
        ref: string // A timestamp for identification purpouses
    }
    */
    contribution as (
        SELECT
            contribution.minute,
            json_arrayagg(
                json_object(
                    'contribution', contribution,
                    'summary', contribution.summary,
                    'detail', contribution.detail,
                    'intern', contribution.intern,
                    'surname',intern.surname,
                    'minute', contribution.minute,
                    'ref', contribution.ref
                )
            ) AS contributions
        FROM
            contribution
            INNER JOIN intern ON contribution.intern = intern.intern
        GROUP BY
            contribution.minute
            
    ),
    #
    #Get the raw minutes alongside the contributions
    /*
    type Iminute = {
        minute: number,
        detail: string,
        numeral: number,
        summary: string,
        contributions: Array<Icontribution> 
    }
     */
    minute as (
        SELECT
            minute.project,
            minute.presentation,
            json_arrayagg(
                json_object(
                    'minute', minute.minute,
                    'detail', minute.detail,
                    'numeral', minute.number,
                    'summary', minute.summary,
                    'contributions', contribution.contributions,
                    'owner', presentation.intern
                )
            ) AS minutes
        FROM
            minute
            LEFT JOIN contribution ON contribution.minute = minute.minute
            INNER JOIN presentation on minute.presentation = presentation.presentation
        WHERE minute.presentation = :presentation
        GROUP BY
            minute.project,
            minute.presentation
    ),
    #
    # Get the project data in the following json structure
    /*
    type Iproject = {
        project: number, // The primary key
        name: string,
        problem: string,
        plan: string, // Guided by some strategy
        outcome: string, // Expectation
        minutes: Array<Iminute> // For monitoring and evaluation
    }
    */
    project as (
        SELECT
            minute.presentation,
            json_arrayagg(
                json_object(
                    'project', project.project,
                    'name', project.name,
                    'problem', project.problem,
                    'plan', project.plan,
                    'outcome', project.outcome,
                    'minutes', minute.minutes
                )
            ) AS data
        FROM 
            project
            RIGHT JOIN minute ON minute.project = project.project
        GROUP BY 
            minute.presentation
    )
/*
Ipresentation = {
    presentation: number,
    intern:number,
    surname:string,
    date:string,
    projects:Array<Iproject>,
}
*/
SELECT
    presentation.presentation,
    presentation.intern,
    intern.surname,
    presentation.date,
    project.data as projects
FROM
    presentation
    INNER JOIN intern ON presentation.intern = intern.intern
    RIGHT JOIN project ON project.presentation = presentation.presentation

