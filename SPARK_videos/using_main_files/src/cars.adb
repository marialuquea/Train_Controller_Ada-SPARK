package body Cars with SPARK_Mode is

   procedure StartCar is
   begin
      if (BatMobile.CarKey = Present) then
         BatMobile.Ignition := On;
      end if;
   end StartCar;


end Cars;
