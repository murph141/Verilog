`include "counter.v"

module main();

reg clock, reset, enable;
wire [3:0] count;

initial
begin
  $dumpfile("test.vcd");
  $dumpvars(0, main);

  clock = 1;
  reset = 0;
  enable = 0;
  #5 reset = 1;
  #10 reset = 0;
  #10 enable = 1;
  #100 enable = 0;
  #20 enable = 1;
  #50 $finish;
end

always #5 clock = ~clock;

counter Up_Counter
(
  .clock(clock),
  .reset(reset),
  .enable(enable),
  .count(count)
);

endmodule
