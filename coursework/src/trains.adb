package body trains with SPARK_Mode
is

   procedure loadReactor is
   begin
      reactor.loaded := Online;
   end loadReactor;

   procedure addControlRod is
   begin
      if (train.train_reactor.c_rods < ControlRods'Last) then
         train.train_reactor.c_rods:= train.train_reactor.c_rods + 1;
      end if;
   end addControlRod;

   procedure removeControlRod is
   begin
      if (train.train_reactor.c_rods > ControlRods'First) then
         train.train_reactor.c_rods:= train.train_reactor.c_rods - 1;
      end if;
   end removeControlRod;

   procedure addCarriage is
   begin
      if (train.speed = 0 and then train.carriages < Carriage'Last) then
         train.carriages := train.carriages + 1;
      end if;
   end addCarriage;




end trains;
