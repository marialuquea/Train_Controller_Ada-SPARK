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
      Put_Line("-----Train Info-----");
      Put_Line("carriages: "& train.carriages'Image);
      Put_Line("electricity: "& train.energy'Image);
      Put_Line("speed: "& train.speed'Image);
      Put_Line("----Reactor Info-----");
      Put_Line("control rods: "& train.train_reactor.c_rods'Image);
      Put_Line("water: "& train.train_reactor.water'Image);
      Put_Line("temperature: "& train.train_reactor.temp'Image);
      Put_Line("overheated: "&train.train_reactor.overheat'Image);
      Put_Line("state: "&train.train_reactor.loaded'Image);
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

   procedure manageCarriages is
   begin
      Put_Line("Options");
      Put_Line("1 - Add carriage");
      Put_Line("2 - Remove carriage");
   end manageCarriages;

   task Maria;

   task body Maria is
   begin
      printTitle;
      Put_Line("  ---------------------------");
      Put_Line("  |         Options:        |");
      Put_Line("  | 1 - See train info      |");
      Put_Line("  | 2 - Manage carriages    |");
      Put_Line("  | 3 - Load/Unload reactor |");
      Put_Line("  | 4 - Manage control rods |");
      Put_Line("  | 5 - Start/Stop Train    |");
      Put_Line("  | 6 - Recharge water      |");
      Put_Line("  | 7 - Exit                |");
      Put_Line("  ---------------------------");
      loop

--           Get_Line(Str,Last);

         Put_Line("");
         Put("Enter a command: ");
         Get(inp);

         if (inp = "1") then
            printTrain;

         elsif (inp = "2") then
            addCarriage;

         else exit;
         end if;

--           case Str(1) is
--           when '1' => printTrain;
--           when '2' => addCarriage;
--           when '3' => removeCarriage;
--           when '4' => loadReactor;
--           when '5' => unloadReactor;
--           when '6' => addControlRod;
--           when others => exit;
--           end case;
      end loop;
      delay 0.1;
   end Maria;


begin
   --  Insert code here.
   null;
end Main;
