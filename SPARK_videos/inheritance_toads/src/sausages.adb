package body Sausages with SPARK_Mode is

   procedure Contaminate (s: in out Sausage) is
   begin
      s.Filling := Meat;
   end Contaminate;

   procedure Valmere (s: in out Sausage) is
   begin
      s.Rating := Spicy;
   end Valmere;

   procedure Kaldere (s: in out Sausage) is
   begin
      s.Rating := Mild;
   end Kaldere;

end Sausages;
