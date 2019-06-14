`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ELO 212
// Engineer: Nicolas Canales Aravena
// 
// Create Date: 13.06.2019 20:08:35
// Module Name: Decoder_1to2_16
// Description: Este modulo permite separar en 2 partes un numero de 16 bits
//////////////////////////////////////////////////////////////////////////////////


module Decoder_1to2_16(
    input logic [15:0] In_number,
    output logic [7:0] Out_number_1,
    output logic [7:0] Out_number_2
    );
    
    logic [15:0] Out_number;
    assign Out_number = In_number;
    
    always_comb begin
        Out_number_1 = Out_number[15:8];
        Out_number_2 = Out_number[7:0];
    end  
    
endmodule
