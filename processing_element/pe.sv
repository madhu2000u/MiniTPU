//Processing Element
module pe(
    input clk, rst,
    input [7:0] a,
    input [7:0] b,

    output logic [7:0] a_out,
    output logic [7:0] b_out,

    output signed [31:0] final_result
);

    logic signed [31:0] result_reg;
    logic [15:0] product_ab;
    logic [31:0] acc_sum;

    // logic [7:0] propagate_a;
    // logic [7:0] propagate_b;

    always_ff @(posedge clk) begin
        if(rst) begin
            result_reg <= 0;
        end
        else begin
            result_reg <= acc_sum;
            a_out <= a;
            b_out <= b;
        end
    end

    mult_ab mult(a, b, product_ab);
    adder32 adder({{16{product_ab[15]}}, product_ab}, result_reg, acc_sum);

    assign final_result = result_reg;

endmodule