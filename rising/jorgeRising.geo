// Gmsh project created on Fri Feb  6 14:28:22 2009

nb = 1;
b1 = 0.05;
wall = 0.05;

D = 1.0;
r = 0.3*D;
body = 2.0*D;
slug = 0.7*r;
pert = (0.0/100)*r;

// bubble's coordinates
xc = 5*D;
yc = 0.0;
zc = 0.0;
/*
 *                                                               4
 *                                                  _ _ _ - - - o   -
 *                                      _ _ _ ^ ^ ^             |   |
 *                        5     _ _ ^ ^                         |   |
 *      -   6  o--------- o - -                                 |   |
 *      |      |                                                |   | 10*D
 *  1*D |      |                                                |   |
 *      |      |                                                |   |
 *      -   1  o -------- o - - _ _                             |   |
 *                        2         ^ ^ - - -                   |   |
 *                                            ^ ^ ^ - - - _ _ _ o   -
 *                                                               3
 *               L1 = 10*D            L2 = 128.87*D
 *             |----------|--------------------------------------| 
 * */

L1 = 10*D;
//L2 = 128.87*D;
L2 = 20*D;

t=0;
Include '../bubbleShape/taylor.geo';

k=10000;
Point(k+1) = {0,     -D/2.0,                    0,wall};
Point(k+2) = {L1,    -D/2.0,                    0,wall};
Point(k+3) = {L1+L2, -(0.5+ (L2*4.5*D/128.87)), 0,wall};
Point(k+4) = {L1+L2,  (0.5+ (L2*4.5*D/128.87)), 0,wall};
Point(k+5) = {L1,     D/2.0,                    0,wall};
Point(k+6) = {0,      D/2.0,                    0,wall};

Line(7) = {k+02, k+01};
Line(8) = {k+03, k+02};
Line(9) = {k+04, k+03};
Line(10) = {k+05, k+04};
Line(11) = {k+06, k+05};
Line(12) = {k+01, k+06};

Physical Line('wallNoSlip') = {7, 8, 9, 10, 11, 12};

j=200*0;
For t In {1:nb}
Physical Line(Sprintf("bubble%g",t)) = {j+6, j+2, j+1, j+5, j+4, j+3};
 j=200*t;
EndFor
