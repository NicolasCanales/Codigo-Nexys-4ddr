`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ELO 212
// Engineer: Nicolas Canales Aravena
// 
// Create Date: 13.06.2019 20:20:35
// Module Name: Alu_8bits
// Description: Este modulo permite hacer operaciones entre numero de 8 bits
//////////////////////////////////////////////////////////////////////////////////


module Alu_8bits(
    input logic [7:0] Operand_1,
    input logic [7:0] Operand_2,
    input logic [3:0] Op_code,
    output logic Status,
    output logic [7:0] Result
    );
    wire [8:0] tmp;
    assign tmp = {1'b0,Operand_1}+{1'b0,Operand_2};
    assign Status = tmp[8];
    always_comb begin
        case(Op_code)
            4'b1000: Result = Operand_1 + Operand_2;
            4'b0100: Result = Operand_1 - Operand_2;
            4'b0010: Result = Operand_1 & Operand_2;
            4'b0001: Result = Operand_1 | Operand_2;
            default: Result = 8'b11111111;
        endcase    
    end
endmodule
