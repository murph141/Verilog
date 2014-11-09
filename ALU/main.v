`include "alu.v"

module main();

reg [31:0] A;
reg [31:0] B; 
reg [3:0] opcode;

wire [31:0] result;
wire negative, zero, carry;
reg clk;

initial
begin
  $dumpfile("test.vcd");
  $dumpvars(0, main);

  clk <= 1'b0;

  A <= 32'h5555AAAA;
  B <= 32'h44442222;
  opcode <= 4'h4;

  #10
  A <= 32'hFFFFFFFF;
  B <= 32'h00000001;
  opcode <= 4'h8;

  #10
  opcode = 4'h5;

  #10
  opcode = 4'h6;

  #10
  opcode = 4'h7;

  #100 $finish;
end

alu ALU(
  .port_A(A),
  .port_B(B),
  .opcode(opcode),
  .result(result),
  .negative(negative),
  .zero(zero),
  .carry(carry),
  .clk(clk)
);

always #5 clk <= ~clk;

endmodule
