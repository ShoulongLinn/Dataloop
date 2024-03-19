`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/03/19 14:15:22
// Design Name: 
// Module Name: data_tx
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


module Datatx(
input wire clk_50MHz,
input wire clk_400MHz,
input wire [7:0] data_in,
input wire reset,
output wire data_out);

reg [7:0] shift_reg;
reg [2:0] shift_count;
reg shift_enable;

always @(posedge clk_50MHz or posedge reset) begin
    if (reset)
        shift_reg <= 8'b0;
    else begin
        shift_reg <= data_in;
        shift_count <= 0;
        shift_enable <= 1;
    end
end

always @(posedge clk_400MHz) begin
    if (shift_enable) begin
        shift_reg <= {shift_reg[6:0],shift_reg[7]};
        shift_count <= shift_count + 1;
        if (shift_count == 7)
            shift_enable <= 0;
    end
end

assign data_out = shift_reg[7];

endmodule
