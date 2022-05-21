`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ELO 212
// Engineer: Nicolas Canales Aravena
// 
// Create Date: 13.06.2019 20:55:38
// Module Name: Decoder_1to4_16
// Description: Este modulo permite separar en 4 partes un numero de 16 bits.
//////////////////////////////////////////////////////////////////////////////////


module Decoder_1to4_16(
    input logic [15:0] In_number,
    output logic [3:0] Out_number_1,
    output logic [3:0] Out_number_2,
    output logic [3:0] Out_number_3,
    output logic [3:0] Out_number_4
    );
    
    logic [15:0] Out_number;
    assign Out_number = In_number;
    
    always_comb begin
        Out_number_1 = Out_number[15:12];
        Out_number_2 = Out_number[11:8];
        Out_number_3 = Out_number[7:4];
        Out_number_4 = Out_number[3:0];
    end  
    
endmodule
