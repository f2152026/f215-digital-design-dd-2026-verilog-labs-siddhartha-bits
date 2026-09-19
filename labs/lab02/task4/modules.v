module and_df(
    input a,
    input b,
    output y
);
assign #3 y = a & b;
endmodule

module and_beh_before(
    input a,
    input b,
    output reg y
);
always @(*) begin
   #3 y = a & b;
end
endmodule

module and_beh_intra(
    input a,
    input b,
    output reg y
);
always @(*) begin
    y = #3 a & b;
end
endmodule