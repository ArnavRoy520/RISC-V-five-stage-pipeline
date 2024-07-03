`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: -
// Engineer: Arnav Roy
// 
// Create Date: 02.06.2024 07:27:24
// Design Name: RISC-V
// Module Name: Fetch_cycle
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


module Fetch_cycle(
    input clk,
    input rst,
    input PCSrcE,
    input [31:0] PCTargetE,
    output [31:0] InstrD,
    output [31:0] PCD,
    output [31:0] PCPlus4D
    );
    
    // wires between the different modules
    wire[31:0] PC_F, PCF, PCPlus4F, InstrF;
    
    // The final fetch cycle registers where all the obtained values are going to be stored
    // these registers will directly transfer the values from them to InstrD, PCD, PCPlus4D
    reg [31:0] Instr_F_reg, PC_F_reg, PCPlus4D_F_reg;  
    
    // Fetch_cycle initialization
    // Declare MUX to take input from PCPlus4F and PCTargetE. PCSrcE as Select line.
    MUX PC_MUX(.a(PCPlus4F),
                .b(PCTargetE),
                .sel(PCSrcE),
                .c(PC_F)
                );
                
    // Declare PC_Module to take input as PC_F and give output as PCF
         PC_module Program_counter(
                                    .clk(clk),
                                    .rst(rst),
                                    .PC_Next(PC_F),
                                    .PC(PCF)
                                    );

    // Declare the Instruction Memory to take input as A and give output as RD
        Instruction_Memory I_M_inst(
                                    .rst(rst),
                                    .A(PCF),
                                    .RD(InstrF)
                                    );
                                    
    // Declare the PC Adder to add 4 to the PCF value
    PC_adder Add_4(
                    .a(PCF),
                    .b(32'h00000004),
                    .c(PCPlus4F)
                    );  
    
    //Now as we have instantiated all the modules its time to assign those values to the registers
    
    // Fetch Cycle Register Logic
    always @(posedge clk or negedge rst) begin
        if(rst == 1'b0) begin
            Instr_F_reg <= 32'h00000000;
            PC_F_reg <= 32'h00000000;
            PCPlus4D_F_reg <= 32'h00000000;
        end
        else begin
            Instr_F_reg <= InstrF;
            PC_F_reg <= PCF;
            PCPlus4D_F_reg <= PCPlus4F;
        end
    end


    // Assigning Registers Value to the Output port
    assign  InstrD = (rst == 1'b0) ? 32'h00000000 : Instr_F_reg;
    assign  PCD = (rst == 1'b0) ? 32'h00000000 : PC_F_reg;
    assign  PCPlus4D = (rst == 1'b0) ? 32'h00000000 : PCPlus4D_F_reg;
                                        
endmodule

