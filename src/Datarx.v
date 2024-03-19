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
    reg [2:0] count;
    reg [7:0]data_reg;
    reg [7:0] data_out_reg;

    always @(posedge clk_400MHz or posedge reset) begin
        if (reset) begin
            count <= 7;
        end else begin
            if (count == 0) begin
                count <= 7;
            end else begin
                count <= count - 1;
            end
        end
    end

    always @(posedge clk_400MHz or posedge reset) begin
        if (reset) begin
            data_reg <= 8'b0;
        end else begin
            if (count > 0) begin
                data_reg[count] <= data_in;
            end
            else
                data_out_reg <= {data_reg[7:1],data_in};
        end
    end
    assign data_out = data_out_reg;
endmodule




