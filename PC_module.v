`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: -
// Engineer: Arnav Roy
// 
// Create Date: 02.06.2024 07:36:47
// Design Name: RISC-V
// Module Name: PC_module
// Project Name: RISC-V
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


module PC_module(
    input wire clk,
    input wire rst,
    input wire [31:0] PC_Next,
    output reg [31:0] PC
    );
    
    always@(posedge clk)
    begin 
        if(~rst)
            PC <= {32{1'b0}}; 
        else
            PC <= PC_Next;
     end
endmodule

