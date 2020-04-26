with Ada.Text_IO; use Ada.Text_IO;

package trains with SPARK_Mode
is

   type ControlRods is range 1..5;
   type Electricity is range 0..100;
   type WaterSupply is range 0..10;
   type ReactorTemperature is range 0..300;
   type ReactorHeat is (Normal, Overheated);
   type Moving is (True, False);
   type IsLoaded is (Loaded, Unloaded); -- offline for maintenance
   type Carriage is range 0..5;
   type RadioActiveness is range 0..50;

   MAXSPEED : constant := 100;

   type Reactors is record
      c_rods      : ControlRods;
      water       : WaterSupply;
      temp        : ReactorTemperature;
      overheat    : ReactorHeat;
      loaded      : IsLoaded;
      radioActive : RadioActiveness;
   end record;

   type Trains is record
      train_reactor     : Reactors;
      carriages         : Carriage;
      energy            : Electricity;
      speed             : Integer;
      maxSpeedAvailable : Integer;
      isMoving          : Moving;
   end record;

   -- Initialising global variables
   reactor : Reactors := (c_rods => ControlRods'Last,
                         water => WaterSupply'Last,
                         temp => ReactorTemperature'First,
                         overheat => Normal,
                         loaded => Loaded,
                         radioActive => RadioActiveness'First);
   train : Trains := (train_reactor => reactor,
                      carriages => Carriage'First,
                      energy => Electricity'First,
                      speed => 0,
                      maxSpeedAvailable => 0,
                      isMoving => False);

   -- Invariants that must always be true
   function Invariant return Boolean is
     (train.train_reactor.c_rods >= ControlRods'First);

   -- Procedures and Functions
   procedure loadReactor with
     Global => (In_Out => (train, Ada.Text_IO.File_System)),
     Pre => train.train_reactor.loaded = Unloaded,
     Post => train.train_reactor.loaded = Loaded;

   procedure unloadReactor with
     Global => (In_Out => (train, Ada.Text_IO.File_System)),
     Pre => train.train_reactor.loaded = Loaded
       and then train.speed = 0,
     Post => train.train_reactor.loaded = Unloaded;

   procedure addControlRod with
     Global => (In_Out => (train, Ada.Text_IO.File_System)),
     Pre => Invariant
       and then train.train_reactor.c_rods < ControlRods'Last,
     Post => train.train_reactor.c_rods = train.train_reactor.c_rods'Old + 1;

   procedure removeControlRod with
     Global => (In_Out => (train, Ada.Text_IO.File_System)),
     Pre => train.train_reactor.c_rods > ControlRods'First,
     Post => train.train_reactor.c_rods = train.train_reactor.c_rods'Old - 1;

   procedure addCarriage with
     Global => (In_Out => (train, Ada.Text_IO.File_System)),
     Pre => train.speed = 0
       and then train.carriages < Carriage'Last
       and then train.isMoving = False,
     Post => train.carriages = train.carriages'Old + 1;

   procedure removeCarriage with
     Global => (In_Out => (train, Ada.Text_IO.File_System)),
     Pre => train.carriages > Carriage'First,
     Post => train.carriages = train.carriages'Old - 1;

   procedure setMaxSpeed with
     Global => (In_Out => (train, Ada.Text_IO.File_System)),
     Pre => train.isMoving = True,
     Post => train.isMoving = True or train.isMoving = False;

   procedure reactorOn with
     Global => (In_Out => train),
     Pre => train.train_reactor.temp < ReactorTemperature'Last - 5
       and then train.isMoving = True
       and then train.speed < MAXSPEED
       and then train.speed < train.maxSpeedAvailable
       and then train.train_reactor.loaded = Loaded
       and then Invariant
       and then train.train_reactor.radioActive < RadioActiveness'Last,
     Post => train.train_reactor.temp > train.train_reactor.temp'Old
       and then train.energy /= 0
       and then train.train_reactor.radioActive = train.train_reactor.radioActive'Old + 1;

   procedure startTrain with
     Global => (In_Out => train),
     Pre => train.isMoving = False
       and then Invariant
       and then train.train_reactor.loaded = Loaded,
     Post => train.isMoving = True;

   procedure stopTrain with
     Global => (In_Out => (train, Ada.Text_IO.File_System)),
     Pre => train.isMoving = True or train.isMoving = False,
     Post => train.speed = 0
       and then train.energy = 0
       and then train.isMoving = False
       and then train.train_reactor.temp = ReactorTemperature'First
       and then train.maxSpeedAvailable = 0;

   procedure increSpeed with
     Global => (In_Out => (train, Ada.Text_IO.File_System)),
     Pre => Invariant
       and then train.train_reactor.loaded = Loaded
       and then train.speed < MAXSPEED
       and then train.speed < train.maxSpeedAvailable
       and then train.isMoving = True,
     Post => train.speed = train.speed'Old + 1;

   procedure overHeat with
     Global => (In_Out => (train, Ada.Text_IO.File_System)),
     Pre => Invariant
       and then train.train_reactor.temp >= 200
       and then train.train_reactor.loaded = Loaded
       and then train.train_reactor.overheat = Normal,
     Post => train.train_reactor.overheat = Overheated;

   procedure useWater with
     Global => (In_Out => (train, Ada.Text_IO.File_System)),
     Pre => Invariant
       and then train.isMoving = True
       and then train.train_reactor.temp >= 200,
     Post => train.train_reactor.temp <= train.train_reactor.temp'Old;

   procedure rechargeWater with
     Global => (In_Out => (train, Ada.Text_IO.File_System)),
     Pre => train.speed = 0
       and then train.isMoving = False,
     Post => train.train_reactor.water = WaterSupply'Last;

   procedure radioActiveWaste with
     Global => (In_Out => (train, Ada.Text_IO.File_System)),
     Pre => train.train_reactor.radioActive = RadioActiveness'Last,
     Post => train.speed = 0
       and then train.energy = 0
       and then train.isMoving = False
       and then train.train_reactor.temp = ReactorTemperature'First
       and then train.maxSpeedAvailable = 0;

   procedure dischargeWaste with
     Global => (In_Out => (train, Ada.Text_IO.File_System)),
     Pre => train.speed = 0
       and then train.isMoving = False,
     Post => train.train_reactor.radioActive = RadioActiveness'First;

end trains;
