

nb = 1;
b1 = 0.06;
wall = 0.08;

D = 1.0;
r = 0.30*D;
body = 1*D;
slug = 0.7*r;

For t In {0:nb-1}
 // bubble's coordinates
 xc = 1.0*D+(slug+body+r+r/2.0)*t;
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

L1 = 4*D;
//L2 = 128.87*D;
L2 = 12*D;

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
Line(10005) = {10001, 10004};
Line(10006) = {10003, 10006};
