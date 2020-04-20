package body Sols with SPARK_Mode
is

   procedure P1(s, n : in out Integer) is
   begin
      s := s + 2;
      n := n - 1;
   end P1;

   procedure P2 (x : in out Integer) is
   begin
      if x > 7 then x := x - 4;
      else x := x - 3;
      end if;
   end P2;


end Sols;
