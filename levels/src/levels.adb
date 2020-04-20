package body Levels with SPARK_Mode
is

   procedure P1 (s, n : in out Integer)
   is
   begin
      n := n + 1;
      s := s + 1;
   end P1;


end Levels;
