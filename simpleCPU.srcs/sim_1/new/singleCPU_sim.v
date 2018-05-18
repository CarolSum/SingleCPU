`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/16 11:02:30
// Design Name: 
// Module Name: singleCPU_sim
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


module singleCPU_sim();
    //  ‰»Î
    reg clk;
    reg Reset;
    //  ‰≥ˆ
    wire [5:0] opCode;
    wire [1:0] PCSrc;
    wire [4:0] rs, rt, rd;
    wire [5:0] sa;
    wire [15:0] immediate;
    wire [2:0] ALUOp;
    wire [31:0] ALUResult, ReadData1, ReadData2;
    
    SingleCPU uut(
        .clk(clk),
        .Reset(Reset),
        .opCode(opCode),
        .PCSrc(PCSrc),
        .rs(rs),
        .rt(rt),
        .rd(rd),
        .sa(sa),
        .immediate(immediate),
        .ALUOp(ALUOp),
        .ALUResult(ALUResult),
        .ReadData1(ReadData1),
        .ReadData2(ReadData2)
    );
    
    initial begin
        clk = 0;
        Reset = 1;
        #50;
            Reset = 0;
            clk = 1;
        #50;
            Reset = 1;
            clk = 0;
        #50;
            Reset = 1;
            clk = 1;
        #50;
            Reset = 1;
            clk = 0;
        #50;
            Reset = 1;
            clk = 1;
        #50;
            Reset = 1;
            clk = 0;
        #50;
            Reset = 1;
            clk = 1;
        #50;
            Reset = 1;
            clk = 0;
        #50;
            Reset = 1;
            clk = 1;
        #50;
            Reset = 1;
            clk = 0;
        #50;
            Reset = 0;
            clk=1;
        #50;
            Reset = 1;
            clk=0;
        forever #50 begin
            clk = !clk;
        end
    end
endmodule
