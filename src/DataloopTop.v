`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/03/19 14:38:34
// Design Name: 
// Module Name: DataloopTop
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


module DataloopTop(
    input  main_clk,
    output [7:0] datasource,
    output txdata,
    output clk_400MHz,
    output [7:0]recovered_data
);

wire clk_50MHz;
wire clk_400MHz;
wire reset;
wire locked;
assign reset = !locked;

wire [7:0]test_data;
wire data_out;
assign datasource = test_data;
assign txdata = data_out;

wire [7:0]rx_dataout;
assign recovered_data = rx_dataout;

//inst
DataSource inst_DataSource (
    .clk(clk_50MHz),
    .reset(reset),
    .data_out(test_data)
);
Datatx inst_Datatx (
    .clk_50MHz(clk_50MHz),
    .clk_400MHz(clk_400MHz),
    .data_in(test_data),
    .reset(reset),
    .data_out(data_out)
);
Pll inst_Pll (
    // Clock out ports
    .clk_out1(clk_50MHz),     // output clk_out1
    .clk_out2(clk_400MHz),     // output clk_out2
    // Status and control signals
    .reset(1'b0), // input reset
    .locked(locked),       // output locked
   // Clock in ports
    .clk_in1(main_clk)      // input clk_in1
);
Datarx datarx_inst (
    .clk_50MHz(clk_50MHz),
    .clk_400MHz(clk_400MHz),
    .data_in(data_out),
    .reset(reset),
    .data_out(rx_dataout)
);
endmodule
