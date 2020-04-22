package Sausages with SPARK_Mode is

   type Matter is (Meat, Veg);
   type Spice is (Spicy, Mild);

   type Sausage is record
      Filling: Matter;
      Rating: Spice;
   end record;

   procedure Contaminate (s: in out Sausage) with
     Pre => s.Filling = Veg,
     Post => s.Filling = Meat;

   procedure Valmere (s: in out Sausage) with
     Post => s.Rating = Spicy and s.Filling = s.Filling'Old;

   procedure Kaldere (s: in out Sausage) with
     Post => s.Rating = Mild;

end Sausages;
