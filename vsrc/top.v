module top (
  input  [3:0] a,
  input  [3:0] b,
  output [3:0] c
);

  assign c[3:0] = a + b;

endmodule