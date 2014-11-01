module counter(
  input clock,
  input reset,
  input enable,
  output reg [3:0] count
);

always @ (posedge clock) begin
  if(reset == 1'b1) begin
    count <= 4'b0000;
  end

  else if(enable == 1'b1) begin
    count <= count + 1;
  end
end

endmodule
