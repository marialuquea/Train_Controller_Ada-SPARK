package body trains with SPARK_Mode
is

   procedure addCarriage is
   begin
      if (train.speed = 0 and then train.carriages < Carriage'Last) then
         train.carriages := train.carriages + 1;
         end if;
   end addCarriage;




end trains;
