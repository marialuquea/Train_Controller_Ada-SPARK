with Sausages; use Sausages;
with Batter; use Batter;

package body Toad with SPARK_Mode is

   procedure SellToKebabShop (t: in out ToadIntheHole) is
   begin
      Contaminate(t.Banger);
      Valmere(t.Banger);
   end SellToKebabShop;

   procedure MakeFitForNursingHome (t: in out ToadInTheHole) is
   begin
      Kaldere(t.Banger);
      MakeSafe(t.YorkShire);
   end MakeFitForNursingHome;

end Toad;
