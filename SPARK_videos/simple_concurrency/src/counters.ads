package Counters is

   type Temp is range 0..20;
   type Guests is range 0..10;
   
   type Fire is (on,off);
   type Lights is (GREEN,AMBER,RED,FLASHING);
  
   currentTemp : Temp := Temp'First;
   guestsInRoom : Guests := Guests'First;
   stove : Fire := off;
   entryLight : Lights := GREEN;
   
   procedure AddGuest with
     Global => (In_Out => (guestsInRoom, entryLight));
   
   procedure FireOn with
     Global => (Input => currentTemp, In_Out => stove);
   
   procedure FireOff with
     Global => (Output => stove);
   
   procedure WarningLight with
     Global => (Input => currentTemp, Output => entryLight);
   
   procedure EmergencyStop with
     Global => (Input => currentTemp, Output => (entryLight, stove));
   
   procedure IncreaseTemp with
     Global => (In_Out => currentTemp);

end Counters;
