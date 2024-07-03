`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: -
// Engineer: Arnav Roy
// 
// Create Date: 02.06.2024 07:21:22
// Design Name: RISC-V
// Module Name: MUX
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


module MUX(
    input wire [31:0] a,
    input wire [31:0] b,
    input wire sel,
    output wire [31:0] c
    );
    
    assign c = sel ? b : a;
endmodule

