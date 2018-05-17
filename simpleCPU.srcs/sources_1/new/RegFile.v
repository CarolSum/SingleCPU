`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/16 09:45:10
// Design Name: 
// Module Name: RegFile
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


module RegFile(
    input clk,
    input RegDst,
    input RegWre,
    input DBDataSrc,
    input [5:0] opCode,
    input [4:0] rs,
    input [4:0] rt,
    input [4:0] rd,
    input [10:0] reserved,
    input [31:0] dataFromALU,
    input [31:0] dataFromDM,
    output [31:0] Data1,
    output [31:0] Date2
    );
    
    reg [31:0] register[1:31];
    integer i;
    initial begin
        for(i = 0; i < 32; i = i + 1) register[i] <= 0;
    end
    
    wire [4:0] writeReg;
    wire [31:0] writeData;
    
    assign writeReg = RegDst ? rd : rt;
    assign writeDate = DBDataSrc ? dataFromDM : dataFromALU;
    
    assign Data1 = (opCode == 6'b011000) ? reserved[10:6] : register[rs];
    assign Data2 = register[rt];
    
    always @(negedge clk) begin
        if(RegWre && writeReg) register[writeReg] = writeData;
    end
    
endmodule
