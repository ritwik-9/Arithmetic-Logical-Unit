module negate_num(
    input wire [5:0] num,
    output wire [5:0] ans
);

    wire [5:0] temp_num;

    //2's complement
    
    //Step1
    //inverting each bit
    assign temp_num[0] = !num[0];
    assign temp_num[1] = !num[1];
    assign temp_num[2] = !num[2];
    assign temp_num[3] = !num[3];
    assign temp_num[4] = !num[4];
    assign temp_num[5] = !num[5];
    
    //Step2
    //addition of 1 to the LSB (least significant bit) and then addition of bits along with carry(s)
    wire carry0;
    FullAdder add0(temp_num[0],1,0,ans[0], carry0);
    wire carry1;
    FullAdder add1(temp_num[1],0,carry0,ans[1], carry1);
    wire carry2;
    FullAdder add2(temp_num[2],0,carry1,ans[2], carry2);
    wire carry3;
    FullAdder add3(temp_num[3],0,carry2,ans[3], carry3);
    wire carry4;
    FullAdder add4(temp_num[4],0,carry3,ans[4], carry4);
    wire carry5;
    FullAdder add5(temp_num[5],0,carry4,ans[5], carry5);

endmodule