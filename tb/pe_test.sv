module tb_pe;

    // Testbench signals
    logic clk;
    logic rst;
    logic [7:0] a;
    logic [7:0] b;
    
    logic [7:0] a_out;
    logic [7:0] b_out;
    logic [31:0] final_result;

    // Instantiate the PE module
    pe dut (
        .clk(clk),
        .rst(rst),
        .a(a),
        .b(b),
        .a_out(a_out),
        .b_out(b_out),
        .final_result(final_result)
    );

    // Clock generation
    always #5 clk = ~clk;

    task automatic reset();
    rst = 1;
    @(posedge clk);
    rst = 0;
    
        
    endtask //automatic
integer acc = 0;
    // Test procedure
    initial begin
        // Initialize signals
        clk = 0;
        rst = 0;
        a = 0;
        b = 0;

        // Apply reset
        // rst = 1;
        // @(posedge clk);
        // rst = 0;
        reset();

        // Test case 1: Multiply 10 * 20
        a = 8'd10;
        b = 8'd20;
        @(posedge clk);
        @(posedge clk);
        if (final_result !== 32'd200) begin
            $display("Test Case 1 Failed: a=%0d, b=%0d, final_result=%0d", a, b, final_result);
        end else begin
            $display("Test Case 1 Passed: a=%0d, b=%0d, final_result=%0d", a, b, final_result);
        end
        
        reset();
        // Test case 2: Multiply -10 * 20
        a = -8'd10;
        b = 8'd20;
        @(posedge clk);
        @(posedge clk);
        if (final_result !== -32'd200) begin
            $display("Test Case 2 Failed: a=%0d, b=%0d, final_result=%0d", a, b, final_result);
        end else begin
            $display("Test Case 2 Passed: a=%0d, b=%0d, final_result=%0d", a, b, final_result);
        end

        reset();
        // Test case 3: Multiply -5 * -4
        a = -8'd5;
        b = -8'd4;
        @(posedge clk);
        a = 8'd3;
        b = 8'd3;
        if (final_result !== 32'd20) begin
            $display("Test Case 3 Failed: a=%0d, b=%0d, final_result=%0d", a, b, final_result);
        end else begin
            $display("Test Case 3 Passed: a=%0d, b=%0d, final_result=%0d", a, b, final_result);
        end

        @(posedge clk);
        // reset();
        // Test case 4: Accumulation test
        if (final_result !== 32'd29) begin
            $display("Test Case 4 Failed: a=%0d, b=%0d, final_result=%0d", a, b, final_result);
        end
        else begin
            $display("Test Case 4 Passed: a=%0d, b=%0d, final_result=%0d", a, b, final_result);
        end

        reset();
        // Apply another input to test accumulation
        a = 8'd2;
        b = 8'd3;
        @(posedge clk);
        @(posedge clk);
        if (final_result !== 32'd6) begin
            $display("Accumulation Test Failed: a=%0d, b=%0d, final_result=%0d", a, b, final_result);
        end
        else begin
            $display("Accumulation Test Passed: a=%0d, b=%0d, final_result=%0d", a, b, final_result);
        end

        reset();

        //accumulation test
        
        a = 10;
        b = 4;
        acc = acc + a * b;
        @(posedge clk);
        // assert(final_result == acc) else $display("asser error 1 %d", );
        a = 7;
        b = 3;
        acc = acc + a * b;
        @(posedge clk);
        assert(final_result == acc) else $display("asser error 1 %d", final_result);
        a = 6;
        b = 8;
        acc = acc + a * b;
        @(posedge clk);
        assert(final_result == acc) else $display("asser error 1 %d", final_result);

        // Finish simulation
        $stop;
    end

endmodule
