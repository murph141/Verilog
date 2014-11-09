`include "alu.v"

module main();

reg [31:0] A;
reg [31:0] B; 
reg [3:0] opcode;

wire [31:0] result;
wire negative, zero, overflow;

initial
begin
  $dumpfile("test.vcd");
  $dumpvars(0, main);

  A = 32'h5555AAAA;
  B = 32'h44442222;
  opcode = 4'h4;

  #5 $finish;
end

alu ALU(
  .port_A(A),
  .port_B(B),
  .opcode(opcode),
  .out(result),
  .negative(negative),
  .zero(zero),
  .overflow(overflow)
);

endmodule
