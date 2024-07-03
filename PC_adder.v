`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: -
// Engineer: Arnav Roy
// 
// Create Date: 03.06.2024 13:46:06
// Design Name: RISC-V
// Module Name: PC_adder
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


module PC_adder(
    input wire [31:0] a,
    input wire [31:0] b,
    output wire [31:0] c
    );
    assign c = a+b;
endmodule

