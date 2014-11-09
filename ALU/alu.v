module alu(

  input [31:0] port_A,
  input [31:0] port_B,
  input [3:0] opcode,
  input clk,
  output reg [31:0] result,
  output reg negative,
  output reg zero,
  output reg carry

  // Opcodes:
  // 0000 - Logical Shift Left A
  // 0001 - Logical Shift Right A
  // 0010 - Logical Shift Left B
  // 0011 - Logical Shift Right B
  // 0100 - AND
  // 0101 - OR
  // 0110 - XOR
  // 0111 - NOR
  // 1000 - Signed Add
  // 1001 - Signed Subtract
  //
  // Overflow flag not yet implemented!

  );

  reg [32:0] out;

  always @ (posedge clk)
  begin

    case(opcode)

      0: out = port_A << 1;

      1: out = port_A >> 1;

      2: out = port_B << 1;

      3: out = port_B >> 1;

      4: out = port_A & port_B;

      5: out = port_A | port_B;

      6: out = port_A ~^ port_B;

      7: out = ~(port_A | port_B);

      8: out = port_A + port_B;

      9: out = port_A - port_B;

      default: out = 32'h0000;

    endcase

    result <= out[31:0];
    negative <= out[31];
    zero <= ~|out[31:0];
    carry <= out[32];

  end

  endmodule
