/*
The Data that is retrieved from this query is structrured as follows:-
    
    client: string,
    room: string,
    rent: number

Expected results:-
  client        room                rent
-------------------------------------------------------------
1 chicjoint     4th Generation      9500
2 kinyozi       Kinyozi/new         11,250
3 deekos        Kentagon Ent        140,000
4 naikuni       Naikuni Ngaah ...   22,000
5
*/
WITH
client as(
    SELECT
        client.*
    FROM
        client
),
agreement as(
    SELECT
        client.name as client,
        room.title as room,
        agreement.amount as rent
    FROM
        agreement
        INNER JOIN client ON agreement.client = client.client
        INNER JOIN room ON agreement.room = room.room
)

select * from agreement



 

