# Calculate the rent infomation of aparticular client 
# The structure of data expected at the end of this process:-
/* 
type rent = {
    client: number,
    quaterly:boolean,
    details: Array<{room_id: number, amount: number, rent_due: number}>,
    total_rent_due: number
}
*/

# Define the reporting period, i.e., month and year
SET @report_month = 10;
SET @report_year = 2023;
set @review_rate = 1.1;

# Calculate the start and end dates of the reporting period based on the variables
# @report_start_date-first day of the specified reporting month
# calculate the @report_end_date as one month after the start date
# SET @report_start_date()-gives this output YYYY-MM-01

WITH
   # current_report_date-This CTE creates a single-row result 
   # containing the start date of the reporting period
    current_report_date AS (
        SELECT CONCAT(@report_year, '-', LPAD(@report_month, 2, '0'), '-01') AS value
    ),
#
# report-this CTE calculates current_date: The start date of the reporting period
# and last_date: One month before the start date
#
# Read the reporting date from the period table ????????
    report AS (
        SELECT  
            current_report_date.value AS `current_date`, 
            date_sub(current_report_date.value, interval 1 month) AS last_date
        FROM current_report_date   
    ),
#
# Get the client infomation as it from the database
# This is helpful in calculation of the current rent e.g establishing the method
# in which the client pays the rent either quaterly or monthly 
# The infomation of the client is also useful in reporting
    client AS (
        SELECT
            client,
            name,
            quarterly
        FROM
            client
    ),
#
# Get all valid agreement details that will be help in calculation of rent, i.e.,
# all valid contracts that have not reached termination
# Here we will get the start date of the contract the end date the acctual room 
# that is rented and based on this infomation we can calculate the correct amount
# of rent before and after the review
    agreement AS (
        SELECT 
            agreement,
            client,
            room,
            amount,
            start_date,
            `terminated`,
            duration,
            review
        FROM
            agreement
        WHERE
            valid = 1 AND `terminated` IS NULL
    ),
#
# Calculate the date of termination and review of each contract that was retrived. 
# This is to check if a client's ammount should be raised due to contract extension or review. 
# Both the termination and review dates are crucial in calculation of the unit amount of a room
    termination AS (
        SELECT
            agreement,
            client,
            room,
            amount,
            start_date,
            DATE_ADD(start_date, INTERVAL duration YEAR) AS `terminated`,
            DATE_ADD(start_date, INTERVAL review YEAR) AS review
        FROM
            agreement
    ),
#
# Perfom the review based on termination
# get all the agreements whoes termination date is elapsed by the report last date
# and apply the termination review ratio to the ammount to get a more upto date 
# rent ammount
    termination_review AS (
        SELECT
            agreement,
            client,
            room,
            start_date,
            `terminated`,
            review,
            amount as initial_amount,
            CASE 
                WHEN `terminated` < last_date THEN amount * @review_rate
                ELSE amount
            END AS amount
        FROM
            termination join report
    ),
#
# We need also to calculate the new unit rent after the review period has elapsed

#
# For clients with quaterly rent we need to calculate based on their contract
# start date when does their quater end inorder to invoice them 3 times the monthly
# amount to get the rent for the quater
    RECURSIVE quarter AS(
        SELECT 
            termination_review.client,
            1 AS quarter, 
            DATE_ADD(termination_review.start_date, INTERVAL 3 MONTH) AS quarter_date
        FROM
            termination_review
            INNER JOIN client ON termination_review.client = client.client
        WHERE
            client.quaterly = 1 
        UNION ALL
        SELECT 
            quarter.client,
            quarter.quarter + 1, 
            DATE_ADD(quarter.quarter_date, INTERVAL 3 MONTH)
        FROM 
            quarter 
        WHERE quarter.quarter < 4
    ),
#
# After all reviews are alredy taken care of we now need to use the calculated
# amount to figure out the rent of the curent reporting period
    rent AS (
        SELECT
            client.*,
            termination_review.room,
            termination_review.start_date,
            termination_review.amount,
            CASE
                WHEN client.quaterly = 0 THEN amount
                ELSE quaterly_rent.rent_due
            END AS rent_due
        FROM
            termination_review
            INNER JOIN client on termination_review.client = client.client
            # join the quaterly_rent cte !!!!
    )



select * from quarter;
