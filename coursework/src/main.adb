with trains; use trains;
with Ada.Text_IO; use Ada.Text_IO;

procedure Main is

--     Str : String (1..2);
--     Last : Natural;
   inp : String (1..1);
   last : Integer := 80;

   procedure printTrain is
   begin
      Put_Line("");
      Put_Line("-----TRAIN INFO-----");
      Put_Line("    carriages:     "& train.carriages'Image);
      Put_Line("    electricity:   "& train.energy'Image);
      Put_Line("    speed:         "& train.speed'Image);
      Put_Line("    max speed:     "& train.maxSpeedAvailable'Image);
      Put_Line("----REACTOR INFO-----");
      Put_Line("    control rods:  "& train.train_reactor.c_rods'Image);
      Put_Line("    water:         "& train.train_reactor.water'Image);
      Put_Line("    temperature:   "& train.train_reactor.temp'Image);
      Put_Line("    overheated:    "&train.train_reactor.overheat'Image);
      Put_Line("    reactor state: "&train.train_reactor.loaded'Image);
      Put_Line("");
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
      Put_Line("  ---------------------------");
      Put_Line("  |         Options:        |");
      Put_Line("  | 1 - See train info      |");
      Put_Line("  | 2 - Manage carriages    |");
      Put_Line("  | 3 - Load/Unload reactor |");
      Put_Line("  | 4 - Manage control rods |");
      Put_Line("  | 5 - Start/Stop Train    |");
      Put_Line("  | 6 - Recharge water      |");
      Put_Line("  | 7 - Open this pannel    |");
      Put_Line("  | 8 - Exit                |");
      Put_Line("  ---------------------------");
   end printOptions;

   task Maria;
   task Electric;
   task CheckHeat;

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
            Get(inp);
            if(inp = "a") then
               if (train.speed = 0) then addCarriage;
               else Put_Line("You can only add carriages if train is not moving.");
               end if;
            elsif (inp = "r") then removeCarriage;
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
            if (train.isMoving = True) then stopTrain;
            else startTrain;
            end if;
         elsif (inp = "6") then
            if (train.isMoving = true) then
               Put_Line("Can't recharge water while train is moving. Enter 5 to stop train.");
            else rechargeWater;
            end if;
         elsif (inp = "7") then printOptions;
         else abort Electric; abort CheckHeat; exit;
         end if;
         delay 0.1;
      end loop;
   end Maria;

   task body Electric is
   begin
      loop
         if (train.isMoving = True) then
            produceElectricity;
            setMaxSpeed;
            increSpeed;
         end if;
         delay 1.0;
      end loop;
   end Electric;

   task body CheckHeat is
   begin
      loop
         if (train.train_reactor.temp >= 200) then
            overHeat;
            useWater;
         end if;
         delay 1.0;
      end loop;
   end CheckHeat;


begin
   --  Insert code here.
   null;
end Main;
