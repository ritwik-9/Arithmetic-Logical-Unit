//MODULE THAT ENABLES THE CHECK OF EQUALITY BETWEEN 2 BIT NUMBERS A AND B

module eq
   (
    input wire[1:0] num0, num1,
    output wire eq
   );

   // signal declaration
   wire p0, p1;

   // body - includes the logical expressions used and the final SOP form to achieve the desired result
   assign eq = p0 & p1;                                                // eq = p0.p1 = (A0.B0 + ~A0.~B0).(A1.B1 + ~A1.~B1)
   assign p0 = ( num0[0] & num1[0] ) | ( ~num0[0] & ~num1[0] );        // p0 = A0.B0 + ~A0.~B0
   assign p1 = ( num0[1] & num1[1] ) | ( ~num0[1] & ~num1[1] );        // p1 = A1.B1 + ~A1.~B1

endmodule