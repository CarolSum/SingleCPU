`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/16 00:22:40
// Design Name: 
// Module Name: instructionMemory
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

// 可以加入RW信号
module instructionMemory(
    input [31:0] pc,
    output [5:0] op,
    output [4:0] rs,
    output [4:0] rt,
    output [4:0] rd,
    output [10:0] reserved,
    output [15:0] immediate,
    output [25:0] addr,
    output [5:0] sa
    );
    
    reg [7:0] mem[0:127];
    reg [31:0] address;
    reg [31:0] instruction;

    // 读取指令    
    initial begin
        $readmemb("D:/Xilinx/Vivado/projects/simpleCPU/test.txt", mem);
        instruction = 0;
    end
    
    always @(pc) begin
        address = pc;
        instruction = (mem[address] << 24) + (mem[address+1] << 16) + (mem[address+2] << 8) + mem[address+3];
    end
    
    assign op = instruction[31:26];
    assign rs = instruction[25:21];
    assign rt = instruction[20:16];
    assign rd = instruction[15:11];
    assign reserved = instruction[10:0];
    assign immediate = instruction[15:0];
    assign addr = instruction[25:0];
    assign sa = instruction[10:6];
endmodule
