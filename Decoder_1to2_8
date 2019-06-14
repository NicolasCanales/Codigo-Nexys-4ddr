`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ELO 212
// Engineer: Nicolas Canales Aravena
// 
// Create Date: 13.06.2019 20:02:50
// Module Name: Decoder_1to2_8
// Description: Este modulo permite separar en 2 un numero de 8 bits.
//////////////////////////////////////////////////////////////////////////////////


module Decoder_1to2_8(
    input logic [7:0] In_number,
    output logic [3:0] Out_number_1,
    output logic [3:0] Out_number_2
    );
    
    logic [7:0] Out_number;
    assign Out_number = In_number;
    
    always_comb begin
        Out_number_1 = Out_number[7:4];
        Out_number_2 = Out_number[3:0];
    end  
    
endmodule
