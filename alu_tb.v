`timescale 1 ns/1 ps

module alu_tb(
    output wire [5:0] X
);
    
   reg signed [5:0] A, B;
   reg unsigned [2:0] choice;
//   wire signed [5:0] X; 
   
   alu_unit uut(.a(A), .b(B), .fxn(choice), .alu_ans(X));
   //  test vector generator
   initial
   begin
      A = 6'b00_0000;
      B = 6'b00_0001;   
      choice = 3'b000;
      # 100;
      A = 6'b00_0010;   
      B = 6'b00_0101;   
      choice = 3'b001;
      # 100;
      A = 6'b00_1000;
      B = 6'b00_1010;
      choice = 3'b010;
      # 100;
      A = - 6'b01_0101;
      B = - 6'b00_1101;
      choice = 3'b011;
      # 100;
      A = - 6'b10_0000;
      B = - 6'b00_1111;
      choice = 3'b100;
      # 100;
      A = 6'b01_0111;
      B = 6'b01_0001;
      choice = 3'b101;
      # 100;
      A = - 6'b00_0110;
      B = 6'b00_1010;
      choice = 3'b110;
      # 100
      A = 6'b00_1010;
      B = 6'b00_1100;
      choice = 3'b111;
      # 100
      $stop;
   end
   
   // to display a table showcasing the test vectors in the tcl console just like in previous labs
   initial
   begin
        $display ("\t\t\t\t time \t A \t\t\t B \t\t\t X  \t\t fxn");
        $display("\t\t\t\t==================================================");
        $monitor (" %d \t %b \t %b \t %b \t %b",$time, A , B , X, choice );      
   end
   
endmodule