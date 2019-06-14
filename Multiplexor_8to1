`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ELO 212
// Engineer: Nicolas Canales Aravena
// 
// Create Date: 13.06.2019 20:37:20
// Module Name: Multiplexor_8to1
// Description: Este modulo permite elegir entre 8 variables
//////////////////////////////////////////////////////////////////////////////////


module Multiplexor_8to1(
    input logic [3:0]  In_mux_0, 
    input logic [3:0]  In_mux_1,
    input logic [3:0]  In_mux_2,
    input logic [3:0]  In_mux_3,
    input logic [3:0]  In_mux_4,
    input logic [3:0]  In_mux_5,
    input logic [3:0]  In_mux_6,
    input logic [3:0]  In_mux_7,
    input logic [3:0]  select,
    output logic [3:0] Out_mux
    );
       
    always_comb begin
        case(select) 
            4'd0: Out_mux = In_mux_0;
            4'd1: Out_mux = In_mux_1;
            4'd2: Out_mux = In_mux_2;
            4'd3: Out_mux = In_mux_3;
            4'd4: Out_mux = In_mux_4;
            4'd5: Out_mux = In_mux_5;
            4'd6: Out_mux = In_mux_6;
            4'd7: Out_mux = In_mux_7;
            default: Out_mux = 4'b0000;
         endcase
    end
endmodule
