//MODULE THAT ENABLES THE CHECK OF GREATER NUMBER A BETWEEN 2 BIT NUMBERS A AND B

module gr
   (
    input wire[1:0] num0, num1,
    output wire gr
   );

   // signal declaration
   wire p0, p1, p2;

   // body - includes the logical expressions used and the final SOP form to achieve the desired result
   assign gr = p0 | p1 | p2;                             // gr = p0 + p1 + p2
                                                         //    = (A1.~B1) + (A0.~B1.~B0) + (A1.A0.~B0)
   assign p0 = ( num0[1] & ~num1[1] );                   // p0 = A1.~B1
   assign p1 = ( num0[0] & ~num1[1] & ~num1[0] );        // p1 = A0.~B1.~B0
   assign p2 = ( num0[1] & num0[0] & ~num1[0] );         // p2 = A1.A0.~B0

endmodule