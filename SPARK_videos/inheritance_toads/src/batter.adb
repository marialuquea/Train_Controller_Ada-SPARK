package body Batter with SPARK_Mode is

   procedure EveryDay (m: out Mixture) is
   begin
      m.Flour := Normal;
      m.Egg := Chicken;
   end EveryDay;

   procedure MakeSafe (m: in out Mixture) is
   begin
      m.Flour := GlutenFree;
   end MakeSafe;


end Batter;
