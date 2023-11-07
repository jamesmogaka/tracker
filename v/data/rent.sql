# Calculate the rent infomation of aparticular client 
# The structure of data expected at the end of this process:-
/* 
type rent = {
    client: number,
    quaterly:boolean,
    details: Array<{room_id: number, area_ft: number, amount: number, rent_due: number}>,
    total_rent_due: number
}
*/

# Define the reporting period, i.e., month and year
set @report_month = 10;
set @report_year = 2023;
set @review_rate = 1.1;

with
    # Perfom a date calculation to establish the date of the previous period using
    # the specified current period month and year. First using the month and year
    # formulate a date for the current period then subtract a month from it to get
    # the date of the previous period.
    previous_period_date as (
        select date_sub(CONCAT(@report_year, '-', LPAD(@report_month, 2, '0'), '-01'), interval 1 month) as `value`
    ),
    #
    # Retrive the start date of a given period 
    # Get the date of the previous period from the cte above and use the year and month
    # to get the cutoff of the previous period as the start date of the current period
    initial_date as(
        select 
            cutoff as start_date
        from 
            `period` join previous_period_date
        where 
            year = year(`value`) and month = month(`value`)
    ),
    #
    # Read the reporting date from the period table
    # The start date of the report is gotten from the cutoff of the immediate period before
    # the reporting period and the end date is the cutoff of the period specified by a matching
    # year and month as the report_year and report_month specified 
    # The end date is simply fetched directly as it is from the period table but the start_date
    # we must calculate the month and even the year of the period just before the reporting period
    report as (
        select  
            initial_date.start_date as genesis,
            (select cutoff from `period` where year = @report_year and month = @report_month)as last_date
        from
            initial_date
    ),
    #
    # Get the client infomation as it from the database
    # This is helpful in calculation of the current rent e.g establishing the method
    # in which the client pays the rent either quaterly or monthly 
    # The infomation of the client is also useful in reporting
    client as (
        select
            client,
            `name`,
            quarterly
        from
            client
    ),
    #
    # Get all valid agreement details that will be help in calculation of rent, i.e.,
    # all valid contracts that have not reached termination
    # Here we will get the start date of the contract the end date the acctual room 
    # that is rented and based on this infomation we can calculate the correct amount
    # of rent before or after the review
    agreement as (
        select 
            agreement,
            client,
            room,
            amount,
            start_date,
            `terminated`,
            duration,
            review
        from
            agreement
        where
            valid = 1 and `terminated` is null
    ),
    #
    # Calculate the date of termination and review of each contract that was retrived. 
    # This is to check if a client's ammount should be raised due to contract extension or review. 
    # Both the termination and review dates are crucial in calculation of the unit amount of a room
    termination as (
        select
            agreement,
            client,
            room,
            amount,
            start_date,
            `terminated`,
            review,
            DATE_ADD(start_date, interval duration year) as `termination_date`,
            DATE_ADD(start_date, interval review year) as review_date
        from
            agreement
    ),
    #
    # Perfom the review based on termination
    # get all the agreements whoes termination date is elapsed by the report last date
    # and apply the termination review ratio to the ammount to get a more upto date 
    # rent ammount
    termination_review as (
        select
            agreement,
            client,
            room,
            start_date,
            `terminated`,
            review,
            amount as initial_amount,
            genesis, 
            last_date,
            case 
                when `termination_date` < last_date then amount * @review_rate
                else amount
            end as amount
        from
            termination join report
    ),
    #
    # We need also to calculate the new amount after the review period has elapsed


    #
    # After all reviews are alredy taken care of we now need to use the calculated
    # amount to figure out the rent of the curent reporting period
    # There are two types of clients those who pay on a monthly basis and a quarterly basis
    # For the clients who pay on a monthly basis their rent will always remain
    # the same as the amount while for the clients who pay on a quarterly basis
    # the rent is charged after every 3 months and it will be thrice the amount once
    # it is charged
    rent as (
        select
            client.client,
            client.`name`,
            client.quarterly,
            termination_review.room,
            termination_review.start_date,
            termination_review.amount,
            case
                when client.quarterly = 0 then amount
                else if(timestampdiff(month, termination_review.last_date,termination_review.start_date) mod 3 = 0, termination_review.amount * 3, 0)
            end as rent_due
        from
            termination_review
            inner join client on termination_review.client = client.client
    ),
    #
    # Using the above claculations generate the appropriate monthly report
    # The reporting output is of the following type :-
    /*
        type report = {
            client: number,
            quterly: boolean,
            details: Array<{room: number, area_ft: number, amount: number, rent_due: number}>,
            total_rent_due: number
        }
    */
    rent_report as(
        select
            rent.client,
            rent.quarterly,
            json_arrayagg(
                json_object(
                    'room', rent.room, 
                    'area_ft', room.width_ft * room.breadth_ft,
                    'amount', rent.amount,
                    'rent_due', rent.rent_due
                )
            ) as details,
            sum(rent.rent_due) as total_rent_due
        from
            rent
            inner join room on rent.room = room.room
        group by rent.client,rent.quarterly
    )



select * from rent_report;
