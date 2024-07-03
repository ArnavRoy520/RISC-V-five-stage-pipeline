`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: -
// Engineer: Arnav Roy
// 
// Create Date: 02.06.2024 07:58:22
// Design Name: RISC-V
// Module Name: Instruction_Memory
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


module Instruction_Memory(
    input rst,
    input [31:0] A,
    output [31:0] RD
    );
    reg [31:0] mem[1023:0];
    
   assign RD = (rst == 1'b0) ? {32{1'b0}} : mem[A[31:2]];

  initial 
  begin
    $readmemh("Memory_log.mem",mem);
  end

endmodule

