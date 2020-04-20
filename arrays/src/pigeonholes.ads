package PigeonHoles with SPARK_Mode
is
   type Box is (Pigeon, Dove);

   type PH_Index is range 1..20;

   type PigeonHole is array (PH_Index) of Box;

   procedure PigeonBeGone (d : in out PigeonHole);

   procedure DoveBeGone (d : in out PigeonHole);

end PigeonHoles;
