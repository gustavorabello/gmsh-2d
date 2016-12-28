

nb = 1;
b1 = 0.03;
wall = 0.05;

D = 1.0;
r = 0.37*D;
body = 2.5*D;
slug = 0.7*r;

For t In {0:nb-1}
 // bubble's coordinates
 xc = 1.5*D+(slug+body+r+r/2.0)*t;
 yc = 0.0;
 zc = 0.0;

 // include torus.geo file
 Include '../bubbleShape/taylor.geo';
EndFor

/*
 *
 *        AXI-SYMMETRY           AXI-SYMMETRY           AXI-SYMMETRY
 *  -.-----.-----.-----.-----.-----.-----.-----.-----.-----.-----.-----.--- 
 * 0.5*D |      |                                                |   |
 *       -   1  o -------- o - - _ _                             |   | 5*D    
 *                         2         ^ ^ - - -                   |   |
 *                                             ^ ^ ^ - - - _ _ _ o   -
 *                                                                3
 *                L1 = 10*D            L2 = 128.87*D
 *              |----------|--------------------------------------| 
 * */

L1 = 3*D;
//L2 = 128.87*D;
L2 = 6*D;

k=10000;
Point(k+1) = {0,     -D/2.0,                    0,wall};
Point(k+2) = {L1,    -D/2.0,                    0,wall};
Point(k+3) = {L1+L2, -(0.5+ (L2*4.5*D/128.87)), 0,wall};

Line(k+1) = {k+1, k+2};
Line(k+2) = {k+2, k+3};

Point(k+4) = {0,     +D/2.0,                    0,wall};
Point(k+5) = {L1,    +D/2.0,                    0,wall};
Point(k+6) = {L1+L2, +(0.5+ (L2*4.5*D/128.87)), 0,wall};

Line(k+3) = {k+4, k+5};
Line(k+4) = {k+5, k+6};
Line(k+5) = {k+1, k+4};
Line(k+6) = {k+3, k+6};

Physical Line("wallNoSlip") = {k+4, k+3, k+5, -(k+1), -(k+2)};
Physical Line("wallOutflow") = {-(k+6)};

j=200*0;
For t In {1:nb}
Physical Line(Sprintf("bubble%g",t)) = {j+6, j+2, j+1, j+5, j+4, j+3};
 j=200*t;
EndFor
