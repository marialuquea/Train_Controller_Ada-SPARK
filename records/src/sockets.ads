package Sockets with SPARK_Mode
is

   type PresentAbsent is (Present, Absent);
   type OnOff is (On, Off);

   type Socket is record
      plug : PresentAbsent;
      switch : OnOff;
   end record;

   S1 : Socket := (plug => Absent, switch => Off);

   procedure plugIn with
     Global => (In_Out => S1),
     Pre => S1.switch = Off,
     Post => S1.switch = Off;


end Sockets;
