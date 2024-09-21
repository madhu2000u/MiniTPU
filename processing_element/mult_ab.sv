module mult_ab (
    input signed [7:0] a,
    input signed [7:0] b,

    output [15:0] product_ab
);
    assign product_ab = a * b;
endmodule