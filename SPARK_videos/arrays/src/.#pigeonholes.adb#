package body PigeonHoles with SPARK_Mode
is

   procedure PigeonBeGone(d : in out PigeonHole)
   is
      Pos : PH_Index := d'First;
   begin
      while Pos < d'Last loop
         d(Pos) := Dove;
         Pos := Pos + 1;
         pragma Loop_Invariant (for all J in d'First..(Pos-1) => d(J) /= Pigeon);
         pragma Loop_Variant (Increases => Pos);
      end loop;
      d(d'Last) := Dove;
      end PigeonBeGone;

   function CountBirds (d : PigeonHole; b : Box) return Integer
   is bs : Integer := 0;
      n : PH_Index := d'First;
      m : PH_Index := d'Last;
   begin
      for I in n..m loop
         -- if the thing in the box is a b, increment b's
         if d(I) = b then bs := bs + 1; else bs := bs; end if;
      end loop;
      return bs;
   end CountBirds;

   procedure SubstituteBird (d: in out PigeonHole; n: PH_Index; b: Box)
   is
   begin
      d(n) := b;
   end SubstituteBird;




   -- A while loop destroys information but are arguably more powerful
   -- A for loop doesn't destroy information

--     procedure PigeonBeGone (d : in out PigeonHole) is
--        Pos : PH_Index := d'First;
--     begin
--        while Pos <= d'Last loop
--           d(Pos) := Dove; -- change whatever was in d(Pos) for a Dove
--
--        -- Way 1: if <=
--           if Pos = d'Last then exit;
--           else Pos := Pos + 1;
--           end if;
--        end loop;
--
--        -- Way 2: if <
--        --   Pos := Pos + 1;
--        --end loop;
--        --d(d'Last) := Dove;

--     end PigeonBeGone;


--     procedure DoveBeGone (d: in out PigeonHole) is
--        a : PH_Index := d'First;
--        b : PH_Index := d'Last;
--     begin
--        for I in a..b loop
--           -- Everything will be a Pigeon
--           d(I) := Pigeon;
--        end loop;
--     end DoveBeGone;




end PigeonHoles;
