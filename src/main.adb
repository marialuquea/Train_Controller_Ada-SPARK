with trains; use trains;
with Ada.Text_IO; use Ada.Text_IO;

procedure Main is

   inp : String (1..1);
   last : Integer := 80;

   procedure printTrain is
   begin
      Put_Line("");
      Put_Line("  ----------------------------------------");
      Put_Line("  |        TRAIN           |");
      Put_Line("  |    carriages:          |"& train.carriages'Image);
      Put_Line("  |    occupied carriages: |"& train.occupiedCarriages'Image);
      Put_Line("  |    electricity:        |"& train.energy'Image);
      Put_Line("  |    speed:              |"& train.speed'Image);
      Put_Line("  |    max speed:          |"& train.maxSpeedAvailable'Image);
      Put_Line("  |    passengers:         |"& train.passengers'Image);
      Put_Line("  |---------------------------------------");
      Put_Line("  |       REACTOR          |");
      Put_Line("  |    control rods:       |"& train.train_reactor.c_rods'Image);
      Put_Line("  |    water:              |"& train.train_reactor.water'Image);
      Put_Line("  |    temperature:        |"& train.train_reactor.temp'Image);
      Put_Line("  |    overheated:         |"& train.train_reactor.overheat'Image);
      Put_Line("  |    reactor state:      |"& train.train_reactor.loaded'Image);
      Put_Line("  |    radioactive waste:  |"& train.train_reactor.radioActive'Image);
      Put_Line("  ----------------------------------------");
   end printTrain;

   procedure printTitle is
   begin
   Put_Line(" ________   ______       ____      _____      __      _    _____  _______");
   Put_Line("(___  ___) (   __ \     (    )    (_   _)    /  \    / )  / ____\ \     /");
   Put_Line("    ) )     ) (__) )    / /\ \      | |     / /\ \  / /  ( (___    \   /");
   Put_Line("   ( (     (    __/    ( (__) )     | |     ) ) ) ) ) )   \___ \    ) (");
   Put_Line("    ) )     ) \ \  _    )    (      | |    ( ( ( ( ( (        ) )   \_/");
   Put_Line("   ( (     ( ( \ \_))  /  /\  \    _| |__  / /  \ \/ /    ___/ /     _ ");
   Put_Line("   /__\     )_) \__/  /__(  )__\  /_____( (_/    \__/    /____/     (_) ");
   Put_Line("");
   end printTitle;

   procedure printOptions is
   begin
      Put_Line("  ------------------------------------------");
      Put_Line("  |         Options:                       |");
      Put_Line("  | 1 - See train info                     |");
      Put_Line("  | 2 - Manage carriages and passengers    |");
      Put_Line("  | 3 - Load/Unload reactor                |");
      Put_Line("  | 4 - Manage control rods                |");
      Put_Line("  | 5 - Start/Stop Train                   |");
      Put_Line("  | 6 - Manage water and radioactive waste |");
      Put_Line("  | 7 - Open this pannel                   |");
      Put_Line("  | 8 - Exit                               |");
      Put_Line("  ------------------------------------------");
   end printOptions;

   task Maria;
   task Electric;
   task CheckHeat;
   task checkRadioactiveWaste;

   task body Maria is
   begin
      printTitle;
      printOptions;
      loop

         Put_Line("");
         Put("Enter a command (7 to view options): ");
         Get(inp);

         if (inp = "1") then printTrain;
         elsif (inp = "2") then
            Put_Line("a - add Carriage");
            Put_Line("r - remove Carriage");
            Put_Line("p - add Passenger");
            Put_Line("g - remove Passenger");
            Get(inp);
            if(inp = "a") then
               if (train.speed = 0) then addCarriage;
               else Put_Line("You can only add carriages if train is not moving.");
               end if;
            elsif (inp = "r") then
               if (train.carriages > Carriage'First
                   and then train.carriages > train.occupiedCarriages) then
                  removeCarriage;
               else Put_Line("Cannot remove carriages occupied by passengers.");
               end if;
            elsif (inp = "p" and then train.speed = 0) then
               if (train.carriages > 0 and then Integer(train.passengers) / Integer(train.carriages) < 10)
               then addPassenger;
               else Put_Line("No space - add carriage to add more passengers");
               end if;
            elsif (inp = "g" and then train.speed = 0) then removePassenger;
            end if;
         elsif (inp = "3") then
            if (train.train_reactor.loaded = Loaded and then train.speed = 0) then
               unloadReactor;
            else loadReactor;
            end if;
         elsif (inp = "4") then
            Put_Line("a - add Control Rod");
            Put_Line("r - remove Control Rod");
            Get(inp);
            if(inp = "a") then addControlRod;
            elsif (inp = "r") then removeControlRod;
            end if;
         elsif (inp = "5") then
            if train.speed > 0 then stopTrain;
            elsif (train.train_reactor.loaded = Loaded) then
               startTrain;
            else Put_Line("Load reactor to start train.");
            end if;
         elsif (inp = "6") then
            Put_Line("w - recharge water supply");
            Put_Line("y - discharge readioactive waste");
            Get(inp);
            if(inp = "w") then
               if (train.speed = 0) then rechargeWater;
               else Put_Line("Can't recharge water while train is moving. Enter 5 to stop train.");
               end if;
            elsif (inp = "y") then dischargeWaste;
            end if;


         elsif (inp = "7") then printOptions;
         elsif (inp = "8") then abort Electric; abort CheckHeat; abort checkRadioactiveWaste; exit;
         else abort Electric; abort CheckHeat; abort checkRadioactiveWaste; exit;
         end if;
      end loop;
   end Maria;

   task body Electric is
   begin
      loop
         if (train.speed > 0) then
            reactorOn;
            setMaxSpeed;
            increSpeed;
            Put_Line("Max train speed:" & train.maxSpeedAvailable'Image
                     & "  | Actual speed: " & train.speed'Image
                     & "  | Reactor temperature: " & train.train_reactor.temp'Image
                     & "  | Radioactive waste: " & train.train_reactor.radioActive'Image);
         end if;
         delay 0.5;
      end loop;
   end Electric;

   task body CheckHeat is
   begin
      loop
         if (train.speed = 0 and then train.train_reactor.temp >= 200) then
            overHeat;
            useWater;
         end if;
         delay 0.5;
      end loop;
   end CheckHeat;

   task body checkRadioactiveWaste is
   begin
      loop
         if (train.speed > 0) then
            radioActiveWaste;
         end if;
         delay 0.5;
      end loop;
   end checkRadioactiveWaste;

begin
   --  Insert code here.
   null;
end Main;
