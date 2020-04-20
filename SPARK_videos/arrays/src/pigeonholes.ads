package PigeonHoles with SPARK_Mode
is
   type Box is (Pigeon, Dove);

   type PH_Index is range 1..20;

   type PigeonHole is array (PH_Index) of Box;

   procedure PigeonBeGone (d : in out PigeonHole) with
     Post => (for all J in d'Range => d(J) /= Pigeon);


   procedure DoveBeGone (d : in out PigeonHole) with
     -- d'Range gives the values of the indeces that were actually used in d
     -- We want all d(J) to not be a Dove
     -- Can also use for some instead of for all
     Post => (for all J in d'Range => d(J) /= Dove);


end PigeonHoles;
