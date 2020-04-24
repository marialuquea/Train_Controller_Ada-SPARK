with Ada.Text_IO; use Ada.Text_IO;

package body trains with SPARK_Mode
is

   procedure loadReactor is
   begin
      train.train_reactor.loaded := Online;
      Put_Line("Reactor state is:"& train.train_reactor.loaded'Image);
   end loadReactor;

   procedure unloadReactor is
   begin
      if (train.train_reactor.loaded = Online and then train.speed = 0) then
         train.train_reactor.loaded := Offline;
         Put_Line("Reactor state is:"& train.train_reactor.loaded'Image);
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
      if (train.train_reactor.c_rods = 1) then
         train.train_reactor.energy := Electricity'Last;
      else if (train.train_reactor.c_rods = 2) then
            train.train_reactor.energy := (Electricity'Last * 80/100);
         else if (train.train_reactor.c_rods = 3) then
               train.train_reactor.energy := (Electricity'Last * 60/100);
            else if (train.train_reactor.c_rods = 4) then
                  train.train_reactor.energy := (Electricity'Last * 40/100);
               else if (train.train_reactor.c_rods = 5) then
                     train.train_reactor.energy := (Electricity'Last * 20/100);
                  end if;
               end if;
            end if;
         end if;
      end if;
      Put_Line("Energy produced:"& train.train_reactor.energy'Image);
   end produceElectricity;

end trains;
