
module LS194 ( clk, n_clr, s0, s1, sr_ser, sl_ser, abcd, q );
  input [3:0] abcd;
  output [3:0] q;
  input clk, n_clr, s0, s1, sr_ser, sl_ser;
  wire   N12, N13, N14, N15, n3, n4, n5, n6, n7;

  AO222X1 U8 ( .O(N15), .A1(sr_ser), .A2(n5), .B1(q[2]), .B2(n3), .C1(abcd[3]), 
        .C2(n6) );
  AO222X1 U9 ( .O(N14), .A1(q[3]), .A2(n5), .B1(q[1]), .B2(n3), .C1(abcd[2]), 
        .C2(n6) );
  AO222X1 U10 ( .O(N13), .A1(n5), .A2(q[2]), .B1(q[0]), .B2(n3), .C1(abcd[1]), 
        .C2(n6) );
  AO222X1 U11 ( .O(N12), .A1(q[1]), .A2(n5), .B1(sl_ser), .B2(n3), .C1(abcd[0]), .C2(n6) );
  NR2X1 U12 ( .O(n3), .I1(n6), .I2(n5) );
  AN2X1 U13 ( .O(n7), .I1(n3), .I2(n4) );
  AN2X1 U14 ( .O(n5), .I1(s0), .I2(n4) );
  AN2X1 U15 ( .O(n6), .I1(s0), .I2(s1) );
  INVX1 U16 ( .O(n4), .I(s1) );
  QDFERBX1 \temp_reg[2]  ( .Q(q[2]), .D(N14), .CK(clk), .EB(n7), .RB(n_clr) );
  QDFERBX1 \temp_reg[1]  ( .Q(q[1]), .D(N13), .CK(clk), .EB(n7), .RB(n_clr) );
  QDFERBX1 \temp_reg[3]  ( .Q(q[3]), .D(N15), .CK(clk), .EB(n7), .RB(n_clr) );
  QDFERBX1 \temp_reg[0]  ( .Q(q[0]), .D(N12), .CK(clk), .EB(n7), .RB(n_clr) );
endmodule

