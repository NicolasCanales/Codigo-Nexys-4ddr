`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ELO 212
// Engineer: Nicolas Canales Aravena
// 
// Create Date: 13.06.2019 20:55:38
// Module Name: Counter
// Description: Este modulo permite mediante el parametro Counter_max decidir hasta que numero contar, iniciando desde el cero.
//////////////////////////////////////////////////////////////////////////////////


module Counter #(parameter 
    Counter_max = 7) // Introducimos hasta que numero queremos que cuente
    (
    input logic In_clock, // Señal de reloj de Entrada
    input logic reset,      // El buen reset
    output logic [3:0] Out_counter  // Contador
    );
    
    always_ff @(posedge In_clock) begin
        if (reset == 1'b1)begin
            Out_counter <= 4'b0000;
        end 
        else if(Out_counter == Counter_max) begin
            Out_counter <= 4'b0000;
        end
        else begin
            Out_counter <= Out_counter + 1;
        end
    end
endmodule
