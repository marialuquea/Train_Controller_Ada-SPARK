with Ada.Text_IO; use Ada.Text_IO;

package trains with SPARK_Mode
is

   type ControlRods is range 1..5;
   type Electricity is range 0..100;
   type WaterSupply is range 1..10;
   type ReactorTemperature is range 0..10;
   type ReactorHeat is (Normal, Overheated);
   type Moving is (True, False);
   type IsLoaded is (Online, Offline); -- offline for maintenance
   type Carriage is range 0..10;

   MAXSPEED : constant := 100;

   type Reactors is record
      c_rods : ControlRods;
      water : WaterSupply;
      temp : ReactorTemperature;
      overheat : ReactorHeat;
      loaded : IsLoaded;
      energy : Electricity;
   end record;

   type Trains is record
      train_reactor : Reactors;
      carriages : Carriage;
      electricity : Integer;
      speed: Integer;
      maxAbsoluteSpeed: Integer;
      isMoving : Moving;
   end record;

   -- Initialising global variables
   reactor : Reactors := (c_rods => 5,
                         water => 1,
                         temp => 0,
                         overheat => Normal,
                         loaded => Online,
                         energy => 0);
   train : Trains := (train_reactor => reactor,
                       carriages => 0,
                       electricity => 0,
                       speed => 0,
                       maxAbsoluteSpeed => MAXSPEED,
                       isMoving => False);

   -- Invariants that must always be true
   function Invariant return Boolean is
     (train.train_reactor.c_rods >= ControlRods'First);

   -- Procedures and Functions
   procedure loadReactor with
     Global => (In_Out => (train, Ada.Text_IO.File_System)),
     Pre => train.train_reactor.loaded = Offline,
     Post => train.train_reactor.loaded = Online;

   procedure unloadReactor with
     Global => (In_Out => (train, Ada.Text_IO.File_System)),
     Pre => train.train_reactor.loaded = Online and then train.speed = 0,
     Post => train.train_reactor.loaded = Offline;

   procedure addControlRod with
     Global => (In_Out => (train, Ada.Text_IO.File_System)),
     Pre => Invariant and then train.train_reactor.c_rods < ControlRods'Last,
     Post => train.train_reactor.c_rods = train.train_reactor.c_rods'Old + 1;

   procedure removeControlRod with
     Global => (In_Out => (train, Ada.Text_IO.File_System)),
     Pre => Invariant and then train.train_reactor.c_rods > ControlRods'First,
     Post => train.train_reactor.c_rods = train.train_reactor.c_rods'Old - 1;

   procedure addCarriage with
     Global => (In_Out => (train, Ada.Text_IO.File_System)),
     Pre => train.speed = 0 and then train.carriages < Carriage'Last,
     Post => train.carriages = train.carriages'Old + 1;

   procedure removeCarriage with
     Global => (In_Out => (train, Ada.Text_IO.File_System)),
     Pre => train.carriages > Carriage'First,
     Post => train.carriages = train.carriages'Old - 1;

   procedure produceElectricity with
     Global => (In_Out => (train, Ada.Text_IO.File_System));



end trains;
