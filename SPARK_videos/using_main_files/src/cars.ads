package Cars with SPARK_Mode is

   type Key is (Present, Absent);

   type Engine is (On, Off);

   type Car is record
      CarKey : Key;
      Ignition : Engine;
   end record;

   BatMobile : Car := (CarKey => Absent, Ignition => Off);

   procedure StartCar with
     Global => (In_Out => BatMobile),
     Pre => BatMobile.CarKey = Present,
     Post => BatMobile.Ignition = On;


end Cars;
