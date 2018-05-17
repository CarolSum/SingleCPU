`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/16 10:10:12
// Design Name: 
// Module Name: SingleCPU
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


module SingleCPU(
    input clk,
    input Reset,
    output wire [5:0] opCode,
    output wire [1:0] PCSrc,
    output wire [4:0] rs, rt, rd,
    output wire [5:0] sa,
    output wire [15:0] immediate,
    output wire [2:0] ALUOp,
    output wire [31:0] ALUResult, ReadData1, ReadData2
    );
    
    wire zero, PCWre, ALUSrcA, ALUSrcB, DBDataSrc, RegWre, InsMemRW, mRD, mWR, RegDst, ExtSel;
    wire [10:0] reserved;
    wire [25:0] addr;
    wire [31:0] ExtOut, DMOut, curPC;
    
    controlUnit cu(opCode, zero, PCWre, ALUSrcA, ALUSrcB, DBDataSrc, RegWre, InsMemRW, mRD, mWR, RegDst, ExtSel, PCSrc, ALUOp);
    ALU alu(ReadData1, ReadData2, ExtOut, sa, ALUSrcA, ALUSrcB, ALUOp, zero, ALUResult);
    DataMemory dm(ALUResult, ReadData2, mRD, mWR, DMOut);
    PC pc(clk, Reset, PCWre, PCSrc, immediate, addr, curPC);
    RegFile rf(clk, RegDst, RegWre, DBDataSrc, opCode, rs, rt, rd, reserved, ALUResult, DMOut, ReadData1, ReadData2);
    instructionMemory im(curPC, opCode, rs, rt, rd, reserved, immediate, addr, sa);
    signZeroExtend sze(immediate, ExtSel, ExtOut);
endmodule
