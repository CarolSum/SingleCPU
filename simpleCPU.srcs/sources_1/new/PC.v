`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/15 21:45:54
// Design Name: 
// Module Name: PC
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

// 有待改善
module PC(
    input clk,
    input Reset,
    input PCWre,
    input [1:0] PCSrc,
    input [15:0] immediate,
    input [25:0] addr,
    output reg [31:0] Address
    );
    
    // 临时变量，保存addr + 4
    reg [31:0] addressPlus4;
    
    always @(posedge clk or negedge Reset)
        begin
            if (Reset == 0) begin
                Address = 0;
            end
            else if(PCWre) begin
                case(PCSrc)
                    2'b00: begin
                        Address = Address + 4;
                    end
                    2'b01: begin
                        Address = Address + 4 + immediate << 2;
                    end
                    2'b10: begin
                        addressPlus4 = addr + 4;
                        Address = {addressPlus4[31:28], addr, 0, 0};
                    end
                endcase
            end
        end
endmodule
