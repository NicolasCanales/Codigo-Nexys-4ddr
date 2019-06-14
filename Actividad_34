`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ELO 212
// Engineer: Nicolas Canales Aravena
// 
// Create Date: 13.06.2019 20:55:38
// Module Name: Actividad_34
// Description: Creacion de una ALU basica de 8 bits
//////////////////////////////////////////////////////////////////////////////////


module Actividad_34(
///////////// Inputs //////////////
    input logic CLK100HZ,           // TIEMPO   -   Reloj propio de la fpga
    input logic CPU_RESETN,         // TIEMPO   -   Reset de la fpga
    input logic BTNU,               // BOTONES  -   Boton arriba
    input logic BTNL,               // BOTONES  -   Boton izquierda
    input logic BTNR,               // BOTONES  -   Boton derecha
    input logic BTND,               // BOTONES  -   Boton abajo
    input logic [15:0] SW,          // Switchs  -   15 es izquierda, 0 es derecha
///////////////////////////////////

///////////// Outputs //////////////
    output logic [6:0] Seven_seg,   // DISPLAY  -   Segmentos
    output logic [7:0] Display,     // DISPLAY  -   Catodo
    output logic Out_dp,            // DISPLAY  -   Puntito
    output logic [15:0] LED         // LEDS     -   15 es Izquierda, o es derecha   
///////////////////////////////////
    );
    
///////////// Variables Auxiliares //////////////
    logic reset;                    // Reset interno
    logic FPS_400;                  // 400 FPS para que se vean bien los numeros en los display
    logic [3:0] Contador;           // Variable global del contador
    logic [3:0] Number_part_11;     // Parte 1 de 16 bits  -   Para el divisor en caso de NO haber operaciones         
    logic [3:0] Number_part_12;     // Parte 2 de 16 bits  -   Para el divisor en caso de NO haber operaciones   
    logic [3:0] Number_part_13;     // Parte 3 de 16 bits  -   Para el divisor en caso de NO haber operaciones   
    logic [3:0] Number_part_14;     // Parte 4 de 16 bits  -   Para el divisor en caso de NO haber operaciones   
    logic [3:0] Cero_auxiliar;      // Un cero de 4 bits
    logic [3:0] In_7_seg_1;         // Opcion 1 de entrada al 7 seg (Cuando NO hay operaciones)
    logic [3:0] In_7_seg_2;         // Opcion 2 de entrada al 7 seg (Cuando SI hay operaciones)   
    logic [3:0] In_7_seg;           // ENTRADA AL 7 SEG
    logic [3:0] ALU_Select;         // Selector de la operacion de la ALU
    logic [7:0] Number_part_21;     // Parte 1 de 16 bits  -   Para el divisor en caso de SI haber operaciones  
    logic [7:0] Number_part_22;     // Parte 2 de 16 bits  -   Para el divisor en caso de SI haber operaciones  
    logic [7:0] ALU_result;         // Resultado de la operacion de la ALU
    logic Overflow;                 // Marca si hay o no overflow en la operacion hecha
    logic [3:0] Out_number_alu_1;   // Parte 1 de 8 bits  -   Para el divisor en caso de SI haber operaciones 
    logic [3:0] Out_number_alu_2;   // Parte 2 de 8 bits  -   Para el divisor en caso de SI haber operaciones 
    logic Out_operation;            // Marca si hay o no operaciones
    logic [15:0] switch;            // Variable swtich auxiliar 
/////////////////////////////////////////////////////

///////////// Asignaciones //////////////
    assign reset = ~CPU_RESETN;     // Niego el reset de la fpga para que quede correctamente
    assign Cero_auxiliar = 4'b0000; // Asigno mi cero axuliar
    assign switch = SW;             // Assigno una variable aux para la conexion interna
    assign LED = switch;            // Asocio cada switch a su respectivo led
/////////////////////////////////////////
    
///////////// Conexiones ////////////// 
    Clock_divisor CLOCK(.In_clok(CLK100HZ), .reset(reset), .Out_clock(FPS_400));
    Counter COUNTER(.In_clock(FPS_400), .reset(reset), .Out_counter(Contador));
    
    Decoder_1to4_16 DECODER_1(.In_number(SW), .Out_number_1(Number_part_11), .Out_number_2(Number_part_12), .Out_number_3(Number_part_13), .Out_number_4(Number_part_14));
    Multiplexor_8to1 MUX_1(.In_mux_0(Number_part_11), .In_mux_1(Number_part_12), .In_mux_2(Cero_auxiliar), .In_mux_3(Cero_auxiliar), .In_mux_4(Number_part_13), .In_mux_5(Number_part_14), .In_mux_6(Cero_auxiliar), .In_mux_7(Cero_auxiliar), .select(Contador), .Out_mux(In_7_seg_1));
    
    Decoder_1to2_16 DECODER_2(.In_number(SW), .Out_number_1(Number_part_21), .Out_number_2(Number_part_22));
    Combination_4to1 SELECTOR_ALU(.clk(FPS_400), .reset(reset), .Boton_0(BTNU), .Boton_1(BTND), .Boton_2(BTNL), .Boton_3(BTNR), .Boton_select(ALU_Select), .Out_operation(Out_operation));
    Alu_8bits ALU_8BITS(.Operand_1(Number_part_21), .Operand_2(Number_part_22), .Op_code(ALU_Select), .Status(Overflow), .Result(ALU_result));
    Decoder_1to2_8 DECODER_3(.In_number(ALU_result), .Out_number_1(Out_number_alu_1), .Out_number_2(Out_number_alu_2));
    Multiplexor_8to1x2 MUX_2(.In_mux_0(Cero_auxiliar), .In_mux_1(Cero_auxiliar), .In_mux_2(Cero_auxiliar), .In_mux_3(Cero_auxiliar), .In_mux_4(Cero_auxiliar), .In_mux_5(Cero_auxiliar), .In_mux_6(Out_number_alu_1), .In_mux_7(Out_number_alu_2), .select(Contador), .Out_mux(In_7_seg_2));
    
    Multiplexor_2to1 MUX_3(.In_mux_0(In_7_seg_1), .In_mux_1(In_7_seg_2), .select(Out_operation), .Out_mux(In_7_seg));
    Puntito PUNTITO(.Condition_1(Out_operation), .Condition_2(Overflow), .Out_condiciones(Out_dp));
    Decoder_7seg DECODER_7SEG(.clk(FPS_400), .reset(reset), .In_display(Contador), .In_decoder(In_7_seg), .position(Out_operation), .Out_display(Display), .Out_7_seg(Seven_seg));
/////////////////////////////////////////
endmodule
