package body increm with SPARK_mode
is

   function bad_incr (x : Tens) return Tens
   is
   begin
      return x + 1;
   end bad_incr;

   procedure bad_proc (x : in out Tens)
   is
   begin
      x := x+1;
   end bad_proc;

   procedure P1 (x, y : in out Tens)
   is
   begin
      x := x + y;
      y := y - x;
   end P1;



end increm;
