 module tb;
 reg [3:0] t_a;
 reg [3:0] t_b;
 reg op;
 wire [3:0] t_result;
 reg [3:0] exp_result_0;
 reg [3:0] exp_result_1;
 reg [3:0] t_result_0;
 reg [3:0] t_result_1;
 integer i, j;
integer errors = 0;

alu DUT(
    .a(t_a), 
    .b(t_b),
    .op(op),
    .result(t_result)
);

 initial begin
    for(i = 0; i < 16; i= i + 1)begin 
        for(j = 0; j < 16; j = j + 1)begin
            t_a = i;
            t_b = j;
            op = 0;
            exp_result_0 = t_a + t_b;
            exp_result_1 = t_a - t_b;
            #2
            t_result_0 = t_result;
            op = 1;
            #2
            t_result_1 = t_result;
            if({t_result_0, t_result_1} !== {exp_result_0, exp_result_1})begin 
                $display("FAIL at time: %0t, A = %0d, B = %0d, A+B = %0d, got A+B = %0d | A-B = %0d, got A-B = %0d"
                , $time, t_a, t_b, exp_result_0, t_result_0, exp_result_1, t_result_1);
                errors = errors + 1;
            end
        end
    end
    $display("%0d out of %0d passed !", 16*16 - errors, 16*16);
    $finish;
 end
 endmodule