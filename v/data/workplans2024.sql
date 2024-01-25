with 
    #
    # Get all the projects from the database and for each of the project
    # Get the owner of the project
    projects as(
        select
            intern.surname,
            project.`name`,
            project.problem,
            project.plan,
            project.outcome,
            intern.end_date
        from
            workplan
            inner join intern on workplan.intern = intern.intern
            inner join project on project.workplan = workplan.workplan
    ),
    #
    #Filter out to get projects for all the interns with us currently
    ongoing as(
        select
            *
        from
            projects
        where
            end_date = '9999-12-31'
    ),
    #
    # This is a list of projects for interns who are not with us
    past as(
        select
            *
        from
            projects
        where
            end_date != '9999-12-31'
    ),
    #
    #
    minutes as (
        select
            project.name,
            minute.summary,
            minute.detail,
            presentation.date,
            minute.done
        from
            minute
            left join project on minute.project = project.project
            inner join presentation on minute.presentation = presentation.presentation
            inner join intern on presentation.intern = intern.intern
        where 
            intern.surname = 'mungai'
        order by project.name asc, presentation.date desc
    )

select * from minutes;
    