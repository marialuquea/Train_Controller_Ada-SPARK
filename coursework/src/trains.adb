with Ada.Text_IO; use Ada.Text_IO;

package body trains with SPARK_Mode
is

   procedure loadReactor is
   begin
      train.train_reactor.loaded := Loaded;
      Put_Line("Reactor state:"& train.train_reactor.loaded'Image);
   end loadReactor;

   procedure unloadReactor is
   begin
      if (train.train_reactor.loaded = Loaded and then train.speed = 0) then
         train.train_reactor.loaded := Unloaded;
         Put_Line("Reactor state:"& train.train_reactor.loaded'Image);
      end if;
   end unloadReactor;

   procedure addControlRod is
   begin
      if (train.train_reactor.c_rods < ControlRods'Last) then
         train.train_reactor.c_rods:= train.train_reactor.c_rods + 1;
         Put_Line("Control rod added:"& train.train_reactor.c_rods'Image);
      end if;
   end addControlRod;

   procedure removeControlRod is
   begin
      if (train.train_reactor.c_rods > ControlRods'First) then
         train.train_reactor.c_rods:= train.train_reactor.c_rods - 1;
         Put_Line("Control rod removed:"& train.train_reactor.c_rods'Image);
      end if;
   end removeControlRod;

   procedure addCarriage is
   begin
      if (train.speed = 0 and then train.carriages < Carriage'Last) then
         train.carriages := train.carriages + 1;
         Put_Line("Carriage added:"& train.carriages'Image);
      end if;
   end addCarriage;

   procedure removeCarriage is
   begin
      if (train.carriages > Carriage'First) then
         train.carriages := train.carriages - 1;
         Put_Line("Carriage removed:"& train.carriages'Image);
      end if;
   end removeCarriage;

   procedure produceElectricity is
   begin
      if (train.train_reactor.temp < ReactorTemperature'Last - 5) then
         if (train.train_reactor.c_rods = 1) then
            train.energy := Electricity'Last;
            train.train_reactor.temp := train.train_reactor.temp + 5;
         else if (train.train_reactor.c_rods = 2) then
               train.energy := (Electricity'Last * 80/100);
               train.train_reactor.temp := train.train_reactor.temp + 4;
            else if (train.train_reactor.c_rods = 3) then
                  train.energy := (Electricity'Last * 60/100);
                  train.train_reactor.temp := train.train_reactor.temp + 3;
               else if (train.train_reactor.c_rods = 4) then
                     train.energy := (Electricity'Last * 40/100);
                     train.train_reactor.temp := train.train_reactor.temp + 2;
                  else if (train.train_reactor.c_rods = 5) then
                        train.energy := (Electricity'Last * 20/100);
                        train.train_reactor.temp := train.train_reactor.temp + 1;
                     end if;
                  end if;
               end if;
            end if;
         end if;
      end if;
      Put_Line("Energy produced:"& train.energy'Image & " train's electricity: "&train.train_reactor.temp'Image);
   end produceElectricity;

   procedure startTrain is
   begin
      train.isMoving := True;
      Put_Line("TRAIN STARTED");
   end startTrain;

   procedure stopTrain is
   begin
      train.speed := 0;
      train.energy := 0;
      train.isMoving := False;
      Put_Line("Train was stopped.");
   end stopTrain;

   procedure increSpeed is
   begin
      if (train.speed < MAXSPEED) then
         train.speed := train.speed + 1;
         Put_Line("Train speed:"& train.speed'Image);
      end if;
   end increSpeed;

   procedure overHeat is
   begin
      if (train.train_reactor.temp >= 200) then
         train.train_reactor.overheat := Overheated;
         Put_Line("REACTOR OVERHEATED: "&train.train_reactor.overheat'Image);
      end if;
   end overHeat;

   procedure useWater is
   begin
      -- water supply starts at 100, can be used until 0
      --  1 water unit reduces heat by 10
      if (train.train_reactor.water > WaterSupply'First and then
         train.train_reactor.temp > 10) then
         train.train_reactor.water := train.train_reactor.water - 1;
         train.train_reactor.temp := train.train_reactor.temp - 10;
         Put_Line("Using water supply. Water left: "&train.train_reactor.water'Image
                 & " Reactor temp: "  & train.train_reactor.temp'Image);
      end if;
   end useWater;

   procedure rechargeWater is
   begin
      -- when water supply ends, if train is not moving you can recharge it
      if (train.speed = 0) then
         train.train_reactor.water := WaterSupply'Last;
         Put_Line("Water recharged: "&train.train_reactor.water'Image);
      end if;
   end rechargeWater;

end trains;
