with Counters; use Counters;
with Ada.Text_IO; use Ada.Text_IO;

procedure Main is
   Str : String (1..2);
   Last : Natural;

   task Heat;
   task EntryGuard;
   task Safety;
   task Emergency is
      pragma Priority (10);
   end Emergency;




   task body EntryGuard is
   begin
      loop
         Put_Line("Enter what you want to do:");
         Get_Line(Str,Last);
         case Str(1) is
         when '1' => AddGuest;
         when '2' => FireOn;
         when '3' => FireOff;
         when others => abort Safety; abort Heat; abort Emergency; exit;
         end case;
      end loop;
      delay 0.1;
   end EntryGuard;


   task body Heat is
   begin
      loop
         if stove = on then IncreaseTemp; end if;
         delay 1.0;
      end loop;
   end Heat;

   task body Safety is
   begin
      loop
         WarningLight;
         delay 0.2;
      end loop;
   end Safety;

   task body Emergency is
   begin
      loop
         EmergencyStop;
         delay 0.5;
      end loop;
   end Emergency;


begin
   null;
end Main;
