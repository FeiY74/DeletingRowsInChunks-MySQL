# MySQL-Deleting Rows In Chunks
MySQL Stored Procedure for using in deleting rows without killing your DB. <br/>
Referred: <http://mysql.rjweb.org/doc.php/deletebig#deleting_in_chunks>


If you want to execute the SP at a specific time, you can create an Event Scheduler to call it.

## An Event Scheduler example for calling the SP at 2 am everyday.
```sql:EventSchedulerExample.sql
delimiter $$
create event CleaningupLog
on schedule every 1 day
starts '2019-10-01 02:00:00'
do
begin
 call DBname.DeletingRowsInChunks();
end$$
delimiter ;
```


