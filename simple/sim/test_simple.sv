module test_simple();

   localparam WIDTH = 32;
   logic[WIDTH-1:0] in;
   logic            clk;
   logic            reset_in;
   logic            load;
   wire [WIDTH-1:0] out;                    // From u_dut of simple.v
   /*AUTOREG*/
   /*AUTOWIRE*/
   
   simple #(.WIDTH(WIDTH)) u_dut
     (/*AUTOINST*/
      // Outputs
      .out                   (out[WIDTH-1:0]),
      // Inputs
      .clk                   (clk),
      .reset_in              (reset_in),
      .load                  (load),
      .in                    (in[WIDTH-1:0])
      );
   

   initial forever #5 clk = ~clk;
   initial begin
      clk = 0;
      reset_in = 0;
      load = 0;
      in = 69;
      #5 reset_in = 1;
      #20 reset_in = 0;
      #100 load = 1;
      #110 load = 0;
      #1000 ;
      $display("out: %d", out);
      $finish();
   end
   
endmodule // test_simple
// Local Variables:
// verilog-library-directories:("../rtl/")
// End:
