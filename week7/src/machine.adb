package body Machine
with SPARK_Mode
is

   procedure takeTicket is
   begin
      next := next + 1;
   end takeTicket;

   procedure serveCustomer is
   begin
      serving := serving + 1;
   end serveCustomer;

   procedure returnTicket (k : Tickets) is
   begin
      -- if k is the next ticket floating around
      -- i.e. k is one less than the ticket that is currently in the end
      if k = next - 1 then next := next - 1;
         -- replace k back into the front
      else next := next;
      end if;
   end returnTicket;

  end Machine;
