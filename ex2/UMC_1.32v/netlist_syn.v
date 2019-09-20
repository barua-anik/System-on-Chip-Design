
module counter_DW01_dec_0 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10;

  XOR2X1 U1 ( .O(SUM[7]), .I1(A[7]), .I2(n1) );
  AN2B1XLP U2 ( .O(n1), .I1(n2), .B1(A[6]) );
  XOR2X1 U3 ( .O(SUM[6]), .I1(A[6]), .I2(n2) );
  AO12X1 U4 ( .O(SUM[5]), .A1(n2), .B1(n3), .B2(A[5]) );
  NR2X1 U5 ( .O(n2), .I1(n3), .I2(A[5]) );
  INVCKX1 U6 ( .O(n3), .I(n4) );
  AO12X1 U7 ( .O(SUM[4]), .A1(n4), .B1(n5), .B2(A[4]) );
  NR2X1 U8 ( .O(n4), .I1(n5), .I2(A[4]) );
  INVCKX1 U9 ( .O(n5), .I(n6) );
  AO12X1 U10 ( .O(SUM[3]), .A1(n6), .B1(n7), .B2(A[3]) );
  NR2X1 U11 ( .O(n6), .I1(n7), .I2(A[3]) );
  INVCKX1 U12 ( .O(n7), .I(n8) );
  AO12X1 U13 ( .O(SUM[2]), .A1(n8), .B1(n9), .B2(A[2]) );
  NR2X1 U14 ( .O(n8), .I1(n9), .I2(A[2]) );
  INVCKX1 U15 ( .O(n9), .I(n10) );
  AO12X1 U16 ( .O(SUM[1]), .A1(n10), .B1(A[0]), .B2(A[1]) );
  NR2X1 U17 ( .O(n10), .I1(A[1]), .I2(A[0]) );
  INVCKX1 U18 ( .O(SUM[0]), .I(A[0]) );
endmodule


module counter_DW01_inc_0 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  XOR2X1 U1 ( .O(SUM[7]), .I1(carry[7]), .I2(A[7]) );
  INVCKX1 U2 ( .O(SUM[0]), .I(A[0]) );
  HA1X1 U1_1_1 ( .S(SUM[1]), .C(carry[2]), .A(A[1]), .B(A[0]) );
  HA1X1 U1_1_2 ( .S(SUM[2]), .C(carry[3]), .A(A[2]), .B(carry[2]) );
  HA1X1 U1_1_3 ( .S(SUM[3]), .C(carry[4]), .A(A[3]), .B(carry[3]) );
  HA1X1 U1_1_4 ( .S(SUM[4]), .C(carry[5]), .A(A[4]), .B(carry[4]) );
  HA1X1 U1_1_5 ( .S(SUM[5]), .C(carry[6]), .A(A[5]), .B(carry[5]) );
  HA1X1 U1_1_6 ( .S(SUM[6]), .C(carry[7]), .A(A[6]), .B(carry[6]) );
endmodule


module counter ( clk, rst, load, up, cin, cout );
  input [7:0] cin;
  output [7:0] cout;
  input clk, rst, load, up;
  wire   N8, N9, N10, N11, N12, N13, N14, N15, N16, N17, N18, N19, N20, N21,
         N22, N23, N32, N33, N34, N35, N36, N37, N38, N39, n2, n3;

  AO222X1 U5 ( .O(N39), .A1(N15), .A2(n2), .B1(N23), .B2(n3), .C1(load), .C2(
        cin[7]) );
  AO222X1 U6 ( .O(N38), .A1(N14), .A2(n2), .B1(N22), .B2(n3), .C1(cin[6]), 
        .C2(load) );
  AO222X1 U7 ( .O(N37), .A1(N13), .A2(n2), .B1(N21), .B2(n3), .C1(cin[5]), 
        .C2(load) );
  AO222X1 U8 ( .O(N36), .A1(N12), .A2(n2), .B1(N20), .B2(n3), .C1(cin[4]), 
        .C2(load) );
  AO222X1 U9 ( .O(N35), .A1(N11), .A2(n2), .B1(N19), .B2(n3), .C1(cin[3]), 
        .C2(load) );
  AO222X1 U10 ( .O(N34), .A1(N10), .A2(n2), .B1(N18), .B2(n3), .C1(cin[2]), 
        .C2(load) );
  AO222X1 U11 ( .O(N33), .A1(N9), .A2(n2), .B1(N17), .B2(n3), .C1(cin[1]), 
        .C2(load) );
  AO222X1 U12 ( .O(N32), .A1(N8), .A2(n2), .B1(N16), .B2(n3), .C1(cin[0]), 
        .C2(load) );
  AN2B1XLP U13 ( .O(n2), .I1(up), .B1(load) );
  NR2X1 U14 ( .O(n3), .I1(load), .I2(up) );
  QDFFRBX1 \cout_x_reg[0]  ( .Q(cout[0]), .D(N32), .CK(clk), .RB(rst) );
  QDFFRBX1 \cout_x_reg[6]  ( .Q(cout[6]), .D(N38), .CK(clk), .RB(rst) );
  QDFFRBX1 \cout_x_reg[1]  ( .Q(cout[1]), .D(N33), .CK(clk), .RB(rst) );
  QDFFRBX1 \cout_x_reg[2]  ( .Q(cout[2]), .D(N34), .CK(clk), .RB(rst) );
  QDFFRBX1 \cout_x_reg[3]  ( .Q(cout[3]), .D(N35), .CK(clk), .RB(rst) );
  QDFFRBX1 \cout_x_reg[4]  ( .Q(cout[4]), .D(N36), .CK(clk), .RB(rst) );
  QDFFRBX1 \cout_x_reg[5]  ( .Q(cout[5]), .D(N37), .CK(clk), .RB(rst) );
  QDFFRBX1 \cout_x_reg[7]  ( .Q(cout[7]), .D(N39), .CK(clk), .RB(rst) );
  counter_DW01_dec_0 sub_40 ( .A(cout), .SUM({N23, N22, N21, N20, N19, N18, 
        N17, N16}) );
  counter_DW01_inc_0 add_38 ( .A(cout), .SUM({N15, N14, N13, N12, N11, N10, N9, 
        N8}) );
endmodule

