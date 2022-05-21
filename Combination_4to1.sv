`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ELO 212
// Engineer: Nicolas Canales Aravena
// 
// Create Date: 13.06.2019 20:27:33
// Module Name: Combination_4to1
// Description: Este modulo permite obtener un codigo asociado a la combinacion de 4 entradas
//////////////////////////////////////////////////////////////////////////////////


module Combination_4to1(
    input clk,
    input reset,
    input logic Boton_0, //Boton_0 = suma,Boton_1 = resta,Boton_2 = and,Boton_3 = or
    input logic Boton_1,
    input logic Boton_2,
    input logic Boton_3,
    output logic [3:0] Boton_select,
    output logic Out_operation // SI es un uno, significa que se esta haciendo una combinacion. Si es un cero, no se esta haciendo ninguna combinacion.
    );
    
    
always_ff @(posedge clk) begin
    if (reset) begin
        Boton_select <= 4'd0;
        Out_operation <= 1'b0;
        end
    else begin
    if (Boton_0 == 1 && Boton_1==0 && Boton_2==0 && Boton_3==0) begin
        Boton_select = 4'b1000;
        Out_operation = 1'b1;
        end
        
    if(Boton_0 == 0 && Boton_1==1 && Boton_2==0 && Boton_3==0) begin
        Boton_select = 4'b0100;
        Out_operation = 1'b1;
        end
        
    if(Boton_0 == 0 && Boton_1==0 && Boton_2==1 && Boton_3==0) begin
        Boton_select = 4'b0010;
        Out_operation = 1'b1;
        end
    if(Boton_0 == 0 && Boton_1==0 && Boton_2==0 && Boton_3==1) begin
        Boton_select = 4'b0001;
        Out_operation = 1'b1;
        end
        
    if(Boton_0 == 0 && Boton_1==0 && Boton_2==0 && Boton_3==0)  begin
        Out_operation = 1'b0; // envía un 4 , para llevar al estado por defecto
        end
       
    end
    end

endmodule
