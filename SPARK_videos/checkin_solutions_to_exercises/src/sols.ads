package Sols with SPARK_Mode
is

   procedure P1 (s, n : in out Integer) with
     Pre => n > Integer'First + 3 and then s <= n - 3,
     Post => s <= n;

   procedure P2 (x : in out Integer) with
     Pre => x > 16,
     Post => x > 12;



end Sols;
