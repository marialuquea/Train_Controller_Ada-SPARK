package increm with SPARK_mode
is
   type Tens is range 1..10;

   function bad_incr (x : Tens) return Tens
     with
       Pre => x < Tens'Last - 1,
       Post => bad_incr'Result = x + 1;

   procedure bad_proc (x : in out Tens)
     with
       Pre => x < Tens'Last,
       Post => x = x'Old + 1;


   procedure P1 (x,y : in out Tens) with
   Depends => (y => (x,y), x => y);


end increm;
