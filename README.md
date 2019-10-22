# DeletingRowsInChunks-MySQL
MySQL Stored Procedure for using in deleting rows without killing your DB.
Referred: http://mysql.rjweb.org/doc.php/deletebig#deleting_in_chunks

If you want to execute the SP at a specific time, you can create an Event Scheduler to call it.
'EventSchedulerExample.sql' is an Event Scheduler example for calling the SP at 2 am everyday.
