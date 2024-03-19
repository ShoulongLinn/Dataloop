`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/03/19 16:25:16
// Design Name: 
// Module Name: Datarx
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


module Datarx(
    input wire clk_50MHz,
    input wire clk_400MHz,
    input wire data_in,
    input wire reset,
    output wire [7:0] data_out
); 
    reg [7:0] data_reg;
    reg [7:0] data_out_reg;
    reg [2:0] count;
    reg done_flag;

    always @(posedge clk_400MHz or posedge reset) begin
        if (reset)
            data_reg <= 8'b0;
        else begin
            if (count <= 7) begin
                data_reg[count] <= data_in;
            end
        end
    end
    
    always @(posedge clk_400MHz or posedge reset) begin
        if (reset) begin
            count <= 3'b111;
            done_flag <= 1'b0;
        end
        else begin
            if (count == 3'b0) begin
                count <= 3'b111;
                done_flag <= 1'b1;
            end
            else begin
                count <= count - 3'b1;
            end
        end
    end
    always @(posedge clk_50MHz or posedge reset) begin
        if (reset)
            data_out_reg <= 8'b0;
        else if (done_flag)
            data_out_reg <= data_reg;
    end
    assign data_out = data_out_reg;
endmodule




