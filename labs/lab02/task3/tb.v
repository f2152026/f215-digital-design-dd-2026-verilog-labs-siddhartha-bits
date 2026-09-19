module tb;
reg [1:0] A;
reg [1:0] B;
wire GT, LT, EQ;
reg exp_gt, exp_lt, exp_eq;
integer errors = 0;
integer i,j;
comp2 DUT(
    .A(A),
    .B(B),
    .GT(GT),
    .LT(LT),
    .EQ(EQ)
);
initial begin 
    for(i = 0; i < 4; i = i + 1) begin 
        for(j = 0; j < 4; j = j + 1)begin 
            A = i;
            B = j;
            exp_eq = A == B;
            exp_gt = A > B;
            exp_lt = A < B;
            #5
            if ({GT, LT, EQ} !== {exp_gt, exp_lt, exp_eq}) begin
            $display("FAIL at time %0t: A=%b B=%b  got GT=%b LT=%b EQ=%b  expected GT=%b LT=%b EQ=%b",
                    $time, A, B, GT, LT, EQ, exp_gt, exp_lt, exp_eq);
            errors = errors + 1;
            end
        end
    end
    $display("%0d out of 16 test cases passed !", 16 - errors);
    $finish;
end
endmodule
