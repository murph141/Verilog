module main();

initial
begin
  $dumpfile("main.vcd");
  $dumpvars(0, main);
  $display("Hello world!");
  #60 $finish;
end

reg clk = 0;
always #5 clk = !clk;
endmodule
