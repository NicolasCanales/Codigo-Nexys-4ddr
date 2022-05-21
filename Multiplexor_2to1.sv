`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ELO 212
// Engineer: Nicolas Canales Aravena
// 
// Create Date: 13.06.2019 20:33:00
// Module Name: Multiplexor_2to1
// Description: Este modulo permite elegir entre 2 variables
//////////////////////////////////////////////////////////////////////////////////


module Multiplexor_2to1(
    input logic [3:0] In_mux_0,
    input logic [3:0] In_mux_1,
    input logic select,
    output logic [3:0] Out_mux
    );
    
    always_comb begin
        case(select)
            1'b0: Out_mux = In_mux_0;
            1'b1: Out_mux = In_mux_1;
        endcase
    end
    
endmodule
