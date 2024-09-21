module adder32 (
    input signed [31:0] a,
    input signed [31:0] b,

    output [31:0] sum_ab
);
    assign sum_ab = a + b;
endmodule