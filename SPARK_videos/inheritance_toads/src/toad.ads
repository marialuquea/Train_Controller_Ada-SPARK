with Sausages; use Sausages;
with Batter; use Batter;

package Toad with SPARK_Mode is

   type ToadInTheHole is record
      Banger : Sausage;
      YorkShire : Mixture;
   end record;

   procedure SellToKebabShop (t: in out ToadInTheHole) with
     Pre => t.Banger.Filling = Veg,
     Post => t.Banger.Filling = Meat and t.Banger.Rating = Spicy;

   procedure MakeFitForNursingHome (t: in out ToadInTheHole) with
     Pre => t.YorkShire.Flour = Normal,
     Post => t.Banger.Rating = Mild and t.YorkShire.Flour = GlutenFree;


end Toad;
