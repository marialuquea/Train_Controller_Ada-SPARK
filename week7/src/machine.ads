package Machine
with SPARK_Mode
is

   type Tickets is range 0..1000;

   -- initialising Global variables so everything can refer to them
   serving : Tickets := 0;
   next : Tickets := 1;

   -- if you want something to be true for global variables at all times, use invariants
   -- regardless of what is going on in the program
   -- basically a dummy function
   function Invariant return Boolean is
     (serving <= next);

   procedure takeTicket with
     Global => (In_Out => next, Input => serving),
     -- 'and then' because the definition of serving requires next to have been decided beforehand
     Pre => next < Tickets'Last and then Invariant,
     Post => Invariant and next = next'Old + 1;

   procedure serveCustomer with
     Global => (In_Out => serving, Input => next),
     Pre => serving < next and then Invariant,
     Post => Invariant and serving = serving'Old + 1;

   -- if its just an input type, no need to specify input type
   procedure returnTicket (k : Tickets) with
     -- serving is an input because we need to know what serving is,even if its not going to be changed
     Global => (In_Out => next, Input => serving),
     -- if serving a customer that has the last ticket, you can't put ticket back in the front
     Pre => serving < next and then Invariant,
     Post => Invariant;

   end Machine;
