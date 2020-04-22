package PigeonHoles with SPARK_Mode
is
   type Box is (Pigeon, Dove);

   type PH_Index is range 1..5;

   type PigeonHole is array (PH_Index) of Box;

   procedure PigeonBeGone (d : in out PigeonHole) with
     Post => (for all J in d'Range => d(J) /= Pigeon);

   function CountBirds (d : PigeonHole; b : Box) return Integer
     with
       Post => CountBirds'Result >= 0 and CountBirds'Result <= d'Length;

   procedure SubstituteBird(d : in out PigeonHole; n : PH_Index; b : Box) with
     Post => d(n) = b and (for all I in d'Range => (if I /= n then d(I) = d'Old(I)));
   -- after the substitution, location n should be of type b
   -- Make sure post condition is specifying exactly the implementation


   function birdExists (d : PigeonHole; b: Box) return Boolean is
     (for some I in d'Range => d(I) = b);
   -- although we've just given the specification, we don't actually need to implement that

   function birdIndex (d: PigeonHole; b : Box) return PH_Index with
     Pre => birdExists(d, b),
     Post => d(birdIndex'Result) = b,
     Contract_Cases =>
       (d(1) = b => birdIndex'Result = 1,
       d(1) /= b => birdIndex'Result > 1);
   -- contract cases need to cover all eventualities
   -- allow us to write mini pre and post conditions
   -- need to cover all available options - complete coverage


--     procedure DoveBeGone (d : in out PigeonHole) with
--       -- d'Range gives the values of the indeces that were actually used in d
--       -- We want all d(J) to not be a Dove
--       -- Can also use for some instead of for all
--       Post => (for all J in d'Range => d(J) /= Dove);


end PigeonHoles;
