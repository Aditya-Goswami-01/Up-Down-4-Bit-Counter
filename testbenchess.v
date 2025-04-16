module testbenchess;
 reg clk, rst, updown;
 wire [3:0] count;
 up_down_counter uut (clk, rst, count, updown);
 
 initial begin
  clk = 0;
   forever #5 clk = ~clk;
end
initial begin
        // Initialize signals
        rst = 1;
        updown = 1;

        // Hold reset for a few cycles
        #10;
        rst = 0;

        // Count up for a few cycles
        #50;

        // Change direction to down
        updown = 0;
        #50;

        // Assert reset again
        rst = 1;
        #10;
        rst = 0;

        // Count up again
        updown = 1;
        #50;

        // Finish simulation
        $finish;
    end
endmodule
