with Cars; use Cars;
with Ada.Text_IO; use Ada.Text_IO;

procedure Main is

begin
   --  Insert code here.
   Put_Line("Key is:");
   Put_Line(BatMobile.CarKey'Image);
   Put_Line("Engine is:");
   Put_Line(BatMobile.Ignition'Image);
   Put_Line("Try starting car...");
   StartCar;
   Put_Line("Now engine is:");
   Put_Line(BatMobile.Ignition'Image);
end Main;
