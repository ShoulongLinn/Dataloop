`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/03/19 13:53:58
// Design Name: 
// Module Name: DataSource
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


module DataSource(
    input wire clk,
    input wire reset,
    output wire [7:0]data_out
    );
    
    reg [7:0] data;
    
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            data <= 8'b0;
        end else begin
            // Generate test data here
            // Example: Increment data by 1 every clock cycle
            if (data == 8'b11111111) begin
                data <= 8'b0;
            end else begin
                data <= data + 8'b1;
            end
        end
    end
    
    assign data_out = data;    
endmodule
