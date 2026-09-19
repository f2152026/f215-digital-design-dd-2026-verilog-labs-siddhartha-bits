// tb.v
// Starter testbench template -- YOU complete this file.

module tb;
  parameter WIDTH = 8;
  parameter DEPTH = 8;
  integer i;
  // TODO: declare the inputs and outputs
  reg [$clog2(DEPTH) - 1 : 0] sel;
  wire [WIDTH - 1 : 0] dout;
  // TODO: instantiate DUT here
  lut #(.WIDTH(WIDTH), .DEPTH(DEPTH)) DUT (
    .sel(sel),
    .dout(dout)
  );
  // Waveform dump configuration (DO NOT CHANGE)
  string vcd_file;
  initial begin
    if ($value$plusargs("vcd=%s", vcd_file)) begin
      $dumpfile(vcd_file);
      $dumpvars(0, DUT);
    end
  end

  initial begin
    // TODO: apply different input combinations
    for(i = 0; i < DEPTH; i = i + 1) begin
      sel = i;
      #5
      if(dout != i*i)
        $display("FAIL");
      else  
        $display("PASS");
    end
    $finish; 
  end

  initial
    $monitor($time, " sel = %d | dout = %d", sel, dout); // change as required

endmodule
