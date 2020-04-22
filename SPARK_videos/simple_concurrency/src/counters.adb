with Ada.Text_IO; use Ada.Text_IO;

package body Counters is
   
   procedure AddGuest is
   begin
      if (guestsInRoom < 5 and entryLight = GREEN)
      then guestsInRoom := guestsInRoom + 1;
      else
         if (guestsInRoom >= 5 and guestsInRoom < 8 and entryLight = GREEN)
         then guestsInRoom := guestsInRoom + 1; entryLight := AMBER;
         else
            if ((guestsInRoom = 8 or guestsInRoom = 9) and entryLight = GREEN)
            then guestsInRoom := guestsInRoom + 1; entryLight := RED;
            else 
               if entryLight = RED then entryLight := RED; end if;
            end if;
         end if;
      end if;
      Put_Line("Number of guests is"& guestsInRoom'Image & ", entry light is " & entryLight'Image);
   end AddGuest;
   
   procedure FireOn is
   begin
      if (currentTemp < Temp'Last and stove = off) then stove := on; Put_Line("Stove is "& stove'Image); end if;     
   end FireOn;
   
   procedure FireOff is
   begin
      stove := off;
      Put_Line("Stove is "& stove'Image);
   end FireOff;
   
   procedure WarningLight is
   begin
      if (currentTemp > 10 and currentTemp < 15) 
      then entryLight := AMBER; Put_Line("Entry light is " & entryLight'Image);
      else if (currentTemp >= 15 and currentTemp <=18) 
         then entryLight := RED; Put_Line("No more entry!");
         end if;
      end if;
   end WarningLight;
   
   procedure EmergencyStop is
   begin
      if currentTemp > 18 then entryLight := FLASHING; stove := off; 
         Put_Line("EMERGENCY! Entry Light is " & entryLight'Image & " STOVE SHUT DOWN!");
      end if;
   end EmergencyStop;
   
   procedure IncreaseTemp is
   begin
      currentTemp := currentTemp + 1;
      Put_Line("Current temperature is "&currentTemp'Image);
   end IncreaseTemp;
   

               
   
end Counters;
