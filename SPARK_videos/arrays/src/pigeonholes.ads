package PigeonHoles with SPARK_Mode
is
   type Box is (Pigeon, Dove);

   type PH_Index is range 1..20;

   type PigeonHole is array (PH_Index) of Box;

   procedure PigeonBeGone (d : in out PigeonHole) with
     Post => (for all J in d'Range => d(J) /= Pigeon);

   function CountBirds (d : PigeonHole; b : Box) return Integer
     with
       Post => CountBirds'Result >= 0 and CountBirds'Result <= d'Length;

   procedure SubstituteBird(d : in out PigeonHole; n : PH_Index; b : Box) with
     Post => d(n) = b and (for all I in d'Range => if (I /= n then d(I) = d'Old(I)));
   -- after the substitution, location n should be of type b
   -- Make sure post condition is specifying exactly the implementation






--     procedure DoveBeGone (d : in out PigeonHole) with
--       -- d'Range gives the values of the indeces that were actually used in d
--       -- We want all d(J) to not be a Dove
--       -- Can also use for some instead of for all
--       Post => (for all J in d'Range => d(J) /= Dove);


end PigeonHoles;
