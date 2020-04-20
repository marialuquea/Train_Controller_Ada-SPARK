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
      if k = next - 1 then next := next - 1;
      else next := next;
   end returnTicket;

  end Machine;
