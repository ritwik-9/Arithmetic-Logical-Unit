module ripple_adder_6bit(x, y, sel, overflow, c_out, sum);
    
    input wire [5:0]x,y;            // the two 6 bit numbers between whom operation has to be done
    input wire sel;                 // functionality for add/subtract
    output wire overflow, c_out;    // flag for overflow and MSB carry out from the sum 
    output wire [5:0]sum;           // the result from the two 6bit numbers
    
    wire c0;
    wire c1;
    wire c2;
    wire c3;
    wire c4;
    wire [5:0]temp_y;
    
    wire choice;
    assign choice = sel;
    
    //this convert the second number to its negative counterpart in case the module is required to do subtraction 
    assign temp_y = choice==1? y: -y;

    //doing the addition of the corresponding bits
    FullAdder fa1(x[0],temp_y[0],0,sum[0],c0);
    FullAdder fa2(x[1],temp_y[1],c0,sum[1],c1);
    FullAdder fa3(x[2],temp_y[2],c1,sum[2],c2);
    FullAdder fa4(x[3],temp_y[3],c2,sum[3],c3);
    FullAdder fa5(x[4],temp_y[4],c3,sum[4],c4);
    FullAdder fa6(x[5],temp_y[5],c4,sum[5],c_out);
    
endmodule
