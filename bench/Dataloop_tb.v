`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/03/19 15:51:17
// Design Name: 
// Module Name: Dataloop_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Dataloop_tb();

reg main_clk_signal;
wire [7:0] data_source_signal;
wire txdata_out_signal; 
wire refclk;
wire [7:0]recovered_data;

always #5 main_clk_signal = ~main_clk_signal;
initial begin
    main_clk_signal = 0;
end

// Instantiate your module here
DataloopTop inst_DataloopTop (
    .main_clk(main_clk_signal),
    .datasource(data_source_signal),
    .txdata(txdata_out_signal),
    .clk_400MHz(refclk),
    .recovered_data(recovered_data)
);
endmodule
