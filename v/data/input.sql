with
    interns as(
        select
            name,
            surname,
            initials,
            qualification,
            university,
            image,
            start_date,
            end_date,
            user,
            year
        from
            intern
    ),
    workplans as(
        select
            workplan.year,
            intern.surname
        from 
            workplan
            inner join intern on workplan.intern = intern.intern
    ),
    projects as (
        select
            project.name,
            project.problem,
            project.outcome,
            project.comment,
            project.activities,
            project.termination,
            project.theme,
            workplan.year,
            intern.surname   
        from
            project
            inner join workplan on project.workplan = workplan.workplan
            inner join intern on workplan.intern = intern.intern
    )


select * from projects