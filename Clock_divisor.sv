`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ELO 212 
// Engineer: Nicolas Canales Aravena
// 
// Create Date: 15.05.2019 
// Design Name: Archivos Generales
// Module Name: Clock Divisor
// Description: Este modulo me permite mediante el parametro counter_max, obtener una frecuencia deseada.
//////////////////////////////////////////////////////////////////////////////////


module Clock_divisor #(
    parameter COUNTER_MAX_0 = 120000) // Parametro dado por la ecuacion f_out= f_in/2*Counter_max
   (input logic In_clok,        // Frecuencia de Entrada
    input logic reset,          // Reset necesario
    output logic Out_clock);    // Frecuencia de Salida
  
    localparam DELAY_WIDTH_0 = $clog2(COUNTER_MAX_0);   // Determina un numero asociado al largo del parametro
    logic [DELAY_WIDTH_0-1:0] counter_0 = 'd0;          // Asocia un contador con el largo establecido anteriormente
  
    always_ff @(posedge In_clok) begin
        if (reset == 1'b1) begin                        // Si el reset esta en alto, mi contador y mi reloj de salida se van a cero                    
            counter_0 <= 'd0;
            Out_clock <= 0;
        end 
        else if (counter_0 == COUNTER_MAX_0-1)begin     // Si mi contador alcanza el maximo, crea el cambio en la salida de reloj
            counter_0 <= 'd0;
            Out_clock = ~Out_clock;
        end 
        else begin
            counter_0 <= counter_0 + 'd1;               // Si no ocurre nada de lo anterior, el reloj de salida sigue igual y mi contador aumenta en uno
            Out_clock <= Out_clock;
        end      
    end
 
endmodule
        
        
  
    
    
    

