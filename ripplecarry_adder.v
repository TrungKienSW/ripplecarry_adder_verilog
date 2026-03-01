module ripple3bit (a, b, s, c_out);
    input wire [2:0] a, b;
    output wire [2:0] s;
    output wire c_out;  

    wire [1:0] w;

  full_adder fa1 (.a(a[0]), .b(b[0]), .c_in(1'b0), .s(s[0]), .c_out(w[0]));
  full_adder fa2 (.a(a[1]), .b(b[1]), .c_in(w[0]), .s(s[1]), .c_out(w[1]));
  full_adder fa3 (.a(a[2]), .b(b[2]), .c_in(w[1]), .s(s[2]), .c_out(c_out));

    
endmodule


module full_adder (a, b, c_in, s,  c_out);
    input wire  a, b, c_in;
    output wire s, c_out;

    wire w1, w2, w3;

    half_adder ha1 (.a(a), .b(b), .s(w2), .c_out(w1));
    half_adder ha2 (.a(w2), .b(c_in), .s(s), .c_out(w3));
    
    assign c_out = w1 | w3;


endmodule

module half_adder (a, b, s, c_out);
    input wire a, b;
    output wire s, c_out;

assign s = a^b;
assign c_out = a&b;


endmodule