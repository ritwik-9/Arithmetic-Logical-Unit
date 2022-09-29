module alu_unit ( 
    input [5:0] a,b, [2:0] fxn, 
    output reg [5:0] alu_ans
);
    
    wire [2:0] choice;
    assign choice = fxn;
    
    wire [5:0]ans1;
    assign ans1 = a;                                        // if fxn = 0, this is the result
    wire [5:0]ans2;
    assign ans2 = b;                                        // if fxn = 1, this is the result
    wire [5:0]ans3;
    negate_num op1(a,ans3);                                 // if fxn = 2, this is the result
    wire [5:0]ans4;
    negate_num op2(b,ans4);                                 // if fxn = 3, this is the result
    wire [5:0]ans5;
    bit6_is_less_than op3(a,b,ans5);                        // if fxn = 4, this is the result
    wire [5:0]ans6;
    bit6_xnor_gate op4(a,b,ans6);                           // if fxn = 5, this is the result
    wire [5:0]ans7;
    ripple_adder_6bit op5(.x(a),.y(b),.sel(1),.sum(ans7));  // if fxn = 6, this is the result
    wire [5:0]ans8;
    ripple_adder_6bit op6(.x(a),.y(b),.sel(0),.sum(ans8));  // if fxn = 7, this is the result
    

    //assigning the result according to the value of fxn to the output variable
    always @(*)
        if(choice == 3'b000)
            alu_ans = ans1;
        else if(choice == 3'b001)
            alu_ans = ans2;
        else if(choice == 3'b010)
            alu_ans = ans3;
        else if(choice == 3'b011)
            alu_ans = ans4;
        else if(choice == 3'b100)
            alu_ans = ans5;
        else if(choice == 3'b101)
            alu_ans = ans6;
        else if(choice == 3'b110)
            alu_ans = ans7;
        else if(choice == 3'b111)
            alu_ans = ans8;
        
endmodule