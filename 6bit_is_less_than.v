module bit6_is_less_than (
    input [5:0] a,b,
    output reg [5:0] result
);

    wire result0;
    wire result1;
    wire result2;

    // calling the 2 bit less than operation 3 times for the 3 pairs of bits (because total=6 bits)
    bit2_less_than op0(a[1:0], b[1:0], result0); //LSB pair
    bit2_less_than op1(a[3:2], b[3:2], result1);
    bit2_less_than op2(a[5:4], b[5:4], result2); //MSB pair

    //start checking from the result of MSB side of the 6bit for less than comparison
    always @*
        if(result2)
            result = 6'b00_0001;
        else if(result1) 
            result = 6'b00_0001;
        else if(result0)
            result = 6'b00_0001;
        else
            result = 6'b00_0000;
    
endmodule