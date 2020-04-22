package Batter with SPARK_Mode is

   type GF is (GlutenFree, Normal);
   type Eggs is (Duck, Chicken);

   type Mixture is record
      Flour : GF;
      Egg : Eggs;
   end record;

   procedure EveryDay (m: out Mixture) with
     Post => m.Flour = Normal and m.Egg = Chicken;

   procedure MakeSafe (m: in out Mixture) with
     Post => m.Flour = GlutenFree;



end Batter;
