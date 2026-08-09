`timescale 1ns/1ps

module fifo_tb;

    parameter DATA_WIDTH = 8;
    parameter DEPTH      = 8;

    reg clk;
    reg rst;

    reg wr_en;
    reg [DATA_WIDTH-1:0] din;

    reg rd_en;
    wire [DATA_WIDTH-1:0] dout;

    wire full;
    wire empty;

    fifo #(
        .DATA_WIDTH(DATA_WIDTH),
        .DEPTH(DEPTH),
        .ADDR_WIDTH(3)
    ) dut (
        .clk(clk),
        .rst(rst),
        .wr_en(wr_en),
        .din(din),
        .rd_en(rd_en),
        .dout(dout),
        .full(full),
        .empty(empty)
    );

    // Clock: 10 ns period
    always #5 clk = ~clk;

    initial begin
        clk   = 0;
        rst   = 1;
        wr_en = 0;
        rd_en = 0;
        din   = 0;

        // Reset
        #10;
        rst = 0;

        // Write 10
        @(negedge clk);
        wr_en = 1;
        din = 8'h10;

        // Write 20
        @(negedge clk);
        din = 8'h20;

        // Write 30
        @(negedge clk);
        din = 8'h30;

        // Stop writing
        @(negedge clk);
        wr_en = 0;

        // Read
        @(negedge clk);
        rd_en = 1;

        @(negedge clk);
        rd_en = 1;

        @(negedge clk);
        rd_en = 1;

        @(negedge clk);
        rd_en = 0;

        #20;
        $finish;
    end

    always @(posedge clk) begin
        $display(
            "Time=%0t | WR=%b | RD=%b | DIN=%h | DOUT=%h | FULL=%b | EMPTY=%b | COUNT=%0d",
            $time,
            wr_en,
            rd_en,
            din,
            dout,
            full,
            empty,
            dut.count
        );
    end

endmodule