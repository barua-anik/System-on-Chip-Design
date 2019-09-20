
module counter_DW01_dec_0 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;
  wire   n1, n2, n3, n4, n5, n6;

  EXOR2D1 U1 ( .A1(A[7]), .A2(n1), .Z(SUM[7]) );
  NOR2D1 U2 ( .A1(A[6]), .A2(n2), .Z(n1) );
  EXNOR2D1 U3 ( .A1(A[6]), .A2(n2), .Z(SUM[6]) );
  OAI21M20D1 U4 ( .A1(n3), .A2(A[5]), .B(n2), .Z(SUM[5]) );
  OR2D1 U5 ( .A1(n3), .A2(A[5]), .Z(n2) );
  OAI21M20D1 U6 ( .A1(n4), .A2(A[4]), .B(n3), .Z(SUM[4]) );
  OR2D1 U7 ( .A1(n4), .A2(A[4]), .Z(n3) );
  OAI21M20D1 U8 ( .A1(n5), .A2(A[3]), .B(n4), .Z(SUM[3]) );
  OR2D1 U9 ( .A1(n5), .A2(A[3]), .Z(n4) );
  OAI21M20D1 U10 ( .A1(n6), .A2(A[2]), .B(n5), .Z(SUM[2]) );
  OR2D1 U11 ( .A1(n6), .A2(A[2]), .Z(n5) );
  OAI21M20D1 U12 ( .A1(A[0]), .A2(A[1]), .B(n6), .Z(SUM[1]) );
  NAN2M1D1 U13 ( .A1(A[1]), .A2(SUM[0]), .Z(n6) );
  INVD1 U14 ( .A(A[0]), .Z(SUM[0]) );
endmodule


module counter_DW01_inc_0 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  ADHALFDL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADHALFDL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADHALFDL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADHALFDL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADHALFDL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADHALFDL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  EXOR2D1 U1 ( .A1(carry[7]), .A2(A[7]), .Z(SUM[7]) );
  INVD1 U2 ( .A(A[0]), .Z(SUM[0]) );
endmodule


module counter ( clk, rst, load, up, cin, cout );
  input [7:0] cin;
  output [7:0] cout;
  input clk, rst, load, up;
  wire   N8, N9, N10, N11, N12, N13, N14, N15, N16, N17, N18, N19, N20, N21,
         N22, N23, N32, N33, N34, N35, N36, N37, N38, N39, n2, n3, n4, n5, n6,
         n7, n8, n9, n10, n11;

  OAI21M20D1 U4 ( .A1(load), .A2(cin[7]), .B(n2), .Z(N39) );
  AOI22D1 U5 ( .A1(N23), .A2(n3), .B1(N15), .B2(n4), .Z(n2) );
  OAI21M20D1 U6 ( .A1(cin[6]), .A2(load), .B(n5), .Z(N38) );
  AOI22D1 U7 ( .A1(N22), .A2(n3), .B1(N14), .B2(n4), .Z(n5) );
  OAI21M20D1 U8 ( .A1(cin[5]), .A2(load), .B(n6), .Z(N37) );
  AOI22D1 U9 ( .A1(N21), .A2(n3), .B1(N13), .B2(n4), .Z(n6) );
  OAI21M20D1 U10 ( .A1(cin[4]), .A2(load), .B(n7), .Z(N36) );
  AOI22D1 U11 ( .A1(N20), .A2(n3), .B1(N12), .B2(n4), .Z(n7) );
  OAI21M20D1 U12 ( .A1(cin[3]), .A2(load), .B(n8), .Z(N35) );
  AOI22D1 U13 ( .A1(N19), .A2(n3), .B1(N11), .B2(n4), .Z(n8) );
  OAI21M20D1 U14 ( .A1(cin[2]), .A2(load), .B(n9), .Z(N34) );
  AOI22D1 U15 ( .A1(N18), .A2(n3), .B1(N10), .B2(n4), .Z(n9) );
  OAI21M20D1 U16 ( .A1(cin[1]), .A2(load), .B(n10), .Z(N33) );
  AOI22D1 U17 ( .A1(N17), .A2(n3), .B1(N9), .B2(n4), .Z(n10) );
  OAI21M20D1 U18 ( .A1(cin[0]), .A2(load), .B(n11), .Z(N32) );
  AOI22D1 U19 ( .A1(N16), .A2(n3), .B1(N8), .B2(n4), .Z(n11) );
  NOR2M1D1 U20 ( .A1(up), .A2(load), .Z(n4) );
  NOR2D1 U21 ( .A1(load), .A2(up), .Z(n3) );
  counter_DW01_dec_0 sub_40 ( .A(cout), .SUM({N23, N22, N21, N20, N19, N18, 
        N17, N16}) );
  counter_DW01_inc_0 add_38 ( .A(cout), .SUM({N15, N14, N13, N12, N11, N10, N9, 
        N8}) );
  DFFRPQ1 \cout_x_reg[0]  ( .D(N32), .RB(rst), .CK(clk), .Q(cout[0]) );
  DFFRPQ1 \cout_x_reg[7]  ( .D(N39), .RB(rst), .CK(clk), .Q(cout[7]) );
  DFFRPQ1 \cout_x_reg[1]  ( .D(N33), .RB(rst), .CK(clk), .Q(cout[1]) );
  DFFRPQ1 \cout_x_reg[2]  ( .D(N34), .RB(rst), .CK(clk), .Q(cout[2]) );
  DFFRPQ1 \cout_x_reg[3]  ( .D(N35), .RB(rst), .CK(clk), .Q(cout[3]) );
  DFFRPQ1 \cout_x_reg[4]  ( .D(N36), .RB(rst), .CK(clk), .Q(cout[4]) );
  DFFRPQ1 \cout_x_reg[5]  ( .D(N37), .RB(rst), .CK(clk), .Q(cout[5]) );
  DFFRPQ1 \cout_x_reg[6]  ( .D(N38), .RB(rst), .CK(clk), .Q(cout[6]) );
endmodule

