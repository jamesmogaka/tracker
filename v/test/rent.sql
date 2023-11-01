# Define the reporting period, i.e., month and year
SET @report_month = 1;
SET @report_year = 2020;
set @testing = false;

# Calculate the start and end dates of the reporting period based on the variables
# @report_start_date-first day of the specified reporting month
# calculate the @report_end_date as one month after the start date
# SET @report_start_date()-gives this output YYYY-MM-01

with
   # current_report_date-This CTE creates a single-row result 
   # containing the start date of the reporting period
    current_report_date as (
        SELECT CONCAT(@report_year, '-', LPAD(@report_month, 2, '0'), '-01') as value
    ),
#
# report-this CTE calculates current_date: The start date of the reporting period
# and last_date: One month before the start date
    report as (
        SELECT  
            current_report_date.value as `current_date`, 
            date_sub(current_report_date.value, interval 1 month) as last_date
        from current_report_date   
    ),
 #  
    debits as (
        SELECT
            client,
            invoice,
            reason,
            'debit' as type,
            date,
            -amount as amount
        FROM
            debit
    ),
    credits as (
        SELECT
            client,
            invoice,
            reason,
            'credit' as type,
            date,
            amount
        FROM
            credit
    ),
#
# doc-This CTE combines the data from the debits and credits CTEs using a union operation
    doc as (
       table debits union table credits
    ),
 #
#notes-this CTE joins data from the doc CTE and the report CTE   
    notes as(
        select 
            report.last_date,
            doc.date as doc_date,
            report.`current_date`,
            doc.*
        from 
            doc join report
        where 
            #
            #Limit the notes to the reporting period
            @testing and doc.date>=last_date and doc.date<`current_date`
            #
            #Include any notes that have note been posted, irrespective of the date
           or doc.invoice is null
   ),
    # payments due for the reporting period
    payment as(
        select 
              *
             from payment
             join report
             where payment.date>=last_date and payment.date<`current_date`

        )

select * from notes;
