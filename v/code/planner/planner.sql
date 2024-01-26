select
    intern.surname,
    project.`name`,
    project.comment as keywords,
    project.problem,
    project.theme
from
    project
    inner join workplan on project.workplan = workplan.workplan
    inner join intern on workplan.intern = intern.intern
where
    workplan.`year` = '2024'

