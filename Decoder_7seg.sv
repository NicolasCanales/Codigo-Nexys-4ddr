`timescale 1ns / 1ps
///////////////////////////////////////////////////////////////////////////////////
// Company: ELO 212
// Engineer: Nicolas Canales Aravena
// 
// Create Date: 13.06.2019 20:15:46
// Module Name: Decoder_7seg
// Description: Este modulo permite obtener las expresiones en hexadecimal, ademas de seleccionar la posicion y que display de los 8 posibles se encendera.
//////////////////////////////////////////////////////////////////////////////////


module Decoder_7seg(
    input clk,
    input reset,
    input logic [3:0] In_display,   //Numero del display a elegir, donde 0 es el de mas a la izquierda y 7 el de mas a la derecha
    input logic [3:0] In_decoder,   //0123
    input logic position,           //Si esta en cero, se encenderan los display de operadores. Si esta en uno se encenderan los display de resultado.
    output logic [7:0] Out_display, // Eleccion del display a encender
    output logic [6:0] Out_7_seg);  //abcdefg, ojazo en los constraints 
            
    always_ff @(posedge clk) begin
        if (reset) begin
            Out_7_seg <= 7'b1111111;
            Out_display <= 8'b11111111;
            end
        else begin
        case(In_decoder)
            4'd0:   Out_7_seg = 7'b0000001;     // CERO
            4'd1:   Out_7_seg = 7'b1001111;     // UNO
            4'd2:   Out_7_seg = 7'b0010010;     // DOS
            4'd3:   Out_7_seg = 7'b0000110;     // TRES
            4'd4:   Out_7_seg = 7'b1001100;     // CUATRO
            4'd5:   Out_7_seg = 7'b0100100;     // CINCO
            4'd6:   Out_7_seg = 7'b0100000;     // SEIS
            4'd7:   Out_7_seg = 7'b0001111;     // SIETE
            4'd8:   Out_7_seg = 7'b0000000;     // OCHO
            4'd9:   Out_7_seg = 7'b0000100;     // NUEVE
            4'd10:  Out_7_seg = 7'b0001000;     // A
            4'd11:  Out_7_seg = 7'b1100000;     // B
            4'd12:  Out_7_seg = 7'b0110001;     // C
            4'd13:  Out_7_seg = 7'b1000010;     // D
            4'd14:  Out_7_seg = 7'b0110000;     // E
            4'd15:  Out_7_seg = 7'b0111000;     // F
         endcase
         if (position == 0)begin
         case(In_display)
            4'd0:   Out_display = 8'b01111111;  // Display 0 ON
            4'd1:   Out_display = 8'b10111111;  // Display 1 ON
            4'd2:   Out_display = 8'b11111111;  // Display 2 OFF
            4'd3:   Out_display = 8'b11111111;  // Display 3 OFF
            4'd4:   Out_display = 8'b11110111;  // Display 4 ON
            4'd5:   Out_display = 8'b11111011;  // Display 5 ON
            4'd6:   Out_display = 8'b11111111;  // Display 6 OFF
            4'd7:   Out_display = 8'b11111111;  // Display 7 OFF
            default: Out_display = 8'b11111111; // Display OFF
         endcase
         end
         if (position == 1)begin
         case(In_display)
            4'd0:   Out_display = 8'b11111111;  // Display 0 ON
            4'd1:   Out_display = 8'b11111111;  // Display 1 ON
            4'd2:   Out_display = 8'b11111111;  // Display 2 OFF
            4'd3:   Out_display = 8'b11111111;  // Display 3 OFF
            4'd4:   Out_display = 8'b11111111;  // Display 4 ON
            4'd5:   Out_display = 8'b11111111;  // Display 5 ON
            4'd6:   Out_display = 8'b11111101;  // Display 6 OFF
            4'd7:   Out_display = 8'b11111110;  // Display 7 OFF
            default: Out_display = 8'b11111111; // Display OFF
         endcase
         end
         end
    end  
    
endmodule
