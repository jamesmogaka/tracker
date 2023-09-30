SELECT
        'number', minute.number, 
        'summary', minute.summary, 
        'detail', minute.detail
FROM minute
    INNER JOIN project ON minute.project = project.project
    INNER JOIN presentation ON minute.presentation = presentation.presentation 
    INNER JOIN intern ON presentation.intern = intern.intern
    INNER JOIN contribution ON minute.minute = contribution.minute
WHERE presentation.date = '2023-06-12' AND intern.surname = 'kangara'

