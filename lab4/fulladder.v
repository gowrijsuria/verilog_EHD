`include "hadder.v"
module fa(a,b,c_in,sum,c_out);
        input a,b,c_in;
        output sum,c_out;
        half h1(a,b,sum1,c_1);
        half h2(sum1,c_in,sum,c_2);
        assign c_out = c_1 | c_2;
endmodule