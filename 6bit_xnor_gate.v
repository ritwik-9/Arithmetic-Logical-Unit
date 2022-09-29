module bit6_xnor_gate
   (
    input  wire[5:0] a, b,			// a and b are the two 6-bit numbers to XNOR
    output wire [5:0] result				
   );
   
   //xnor-ing each corresponding bit of the 6 bit numbers A and B to get the result
   xnor_gate op0(a[0],b[0],result[0]);
   xnor_gate op1(a[1],b[1],result[1]);
   xnor_gate op2(a[2],b[2],result[2]);
   xnor_gate op3(a[3],b[3],result[3]);
   xnor_gate op4(a[4],b[4],result[4]);
   xnor_gate op5(a[5],b[5],result[5]);

endmodule 