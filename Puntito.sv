`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ELO 212
// Engineer: Nicolas Canales Aravena
// 
// Create Date: 13.06.2019 20:55:38
// Module Name: Puntito
// Description: Este modulo enciende el puntito del display cuando hay overflow
//////////////////////////////////////////////////////////////////////////////////


module Puntito(
    input logic Condition_1,
    input logic Condition_2,
    output logic Out_condiciones
    );
    
    always_comb begin
        if (Condition_1 == 1 && Condition_2 == 1) begin
            Out_condiciones = 0;
        end
        else begin
            Out_condiciones = 1;
        end
    end
     
endmodule
