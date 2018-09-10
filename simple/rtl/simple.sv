module simple #(WIDTH=64)
  (
   input         clk,
   input         reset_in,
   input         load,
   input  [WIDTH-1:0]  in,
   output [WIDTH-1:0] out
   );

   logic [1:0]   reset_sync;
   logic         reset;
   always @(posedge clk or posedge reset_in)
     if( reset_in )
       reset_sync <= 2'b11;
     else
       reset_sync <= {reset_sync, 1'b0};

   assign reset = reset_sync[1];

   logic [WIDTH-1:0] in_reg;
   always @(posedge clk)
     in_reg <= in;
   
   logic [WIDTH-1:0]  counter;
   always @(posedge clk)
     if( reset )
       counter <= {WIDTH{1'b0}};
     else begin
        if( load )
          counter <= in_reg;
        else
          counter <= counter + 1'b1;
     end

   assign out = counter;
       
endmodule // simple
