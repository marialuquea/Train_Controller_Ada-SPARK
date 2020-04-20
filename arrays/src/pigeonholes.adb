package body PigeonHoles with SPARK_Mode
is

   procedure PigeonBeGone (d : in out PigeonHole) is
      a : PH_Index := d'First;
      b : PH_Index := d'Last;
      c : Integer := d'Length;

      d'Range
   begin
   end PigeonBeGone;


end PigeonHoles;
