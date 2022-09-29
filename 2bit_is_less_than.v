//MAIN MODULE THAT ENABLES THE "AND" OPERATION OF BOTH EQUALITY AND GREATER A CHECK BETWEEN 2 BIT NUMBERS A AND B

module bit2_less_than
   (
    input  wire[1:0] a, b,			// a and b are the two 2-bit numbers to compare
    output wire alessb				
   );

   wire aeqb;
   wire agrb;

   // body
   // instantiate the result from the SOP of both 
   // 2 bit greater than comparator and
   // 2 bit equality comparator
   // and OR them to get the final result that is 
   // 2 bit greater than AND equals circuit
   eq eq_calc (.num0(a), .num1(b), .eq(aeqb));          // 2 bit equality comparator
   gr gr_calc (.num0(a), .num1(b), .gr(agrb));          // 2 bit greater than comparator

   wire agreqb = aeqb | agrb;

   //negating the result to get the less than result
   assign alessb = !agreqb;

endmodule