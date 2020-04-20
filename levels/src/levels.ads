package Levels with SPARK_Mode
is

   procedure P1 (s, n : in out Integer) with
   Depends => (s => s, n => n);

end Levels;
