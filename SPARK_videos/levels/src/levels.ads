package Levels with SPARK_Mode
is

   procedure P1 (s, n : in out Integer) with
     Depends => (s => s, n => n),
     Pre => n < Integer'Last and then s < Integer'Last and then s <= n,
     Post => s <= n;

   procedure P2 (n : in out Integer) with
     Pre => n > 1,
     Post => n > 0;

end Levels;
