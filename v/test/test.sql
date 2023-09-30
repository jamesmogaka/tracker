/*
The Data that is retrieved from this query is structrured as follows:-
    
    client: string,
    room: string,
    rent: number
*/

SELECT
    client.name as client,
    room.title as room,
    agreement.amount as rent
FROM
    agreement
    INNER JOIN client ON agreement.client = client.client
    INNER JOIN room ON agreement.room = room.room  
WHERE period.month = 9 AND period.year = 2023

 

