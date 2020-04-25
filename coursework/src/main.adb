with trains; use trains;
with Ada.Text_IO; use Ada.Text_IO;

procedure Main is

   Str : String (1..2);
   Last : Natural;

   task Maria;
   task moooove;

   task body Maria is
   begin
      loop
         Put_Line("Enter what you want to do:");
         Get_Line(Str,Last);
         case Str(1) is
         when '1' => addCarriage;
         when '2' => removeCarriage;
         when '3' => loadReactor;
         when '4' => unloadReactor;
         when '5' => addControlRod;
         when '6' => removeControlRod;
         when others => abort moooove; abort produceEnergy; exit;
         end case;
      end loop;
      delay 0.1;
   end Maria;

   task body moooove is
   begin
      loop
         startTrain;
         delay 3.0;
      end loop;
   end moooove;

begin
   --  Insert code here.
   null;
end Main;
