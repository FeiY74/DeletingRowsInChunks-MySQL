# MySQL-Deleting Rows In Chunks
MySQL Stored Procedure for using in deleting rows without killing your DB. <br/>
Referred: <http://mysql.rjweb.org/doc.php/deletebig#deleting_in_chunks>

You can use an Event Scheduler to call this SP at a specific time.

## An Event Scheduler example for calling the SP at 2 am everyday
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

