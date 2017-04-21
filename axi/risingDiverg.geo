// axisymmetric bubble in divergent channel
wall = 0.03; 
b1 = 0.015; 
nb = 1; 
 
D = 1.0; 
r = 0.35*D; 
body = 3.5*D; 
slug = 0.7*r; 

For t In {0:nb-1}
 // bubble's coordinates
 xc = 4.0+(slug+body+r+r/2.0)*t;
 yc = 0.0;
 zc = 0.0;

 // include torus.geo file
 Include '../bubbleShape/taylorAxi.geo';
EndFor

L1 = 2*D; 
//L2 = 128.87*D; 
L2 = 20*D; 

k = newp;
/*  
 *                                                         k+4
 *                                                   ____ --o
 *   k+2                                  k+3 ___ ^^              
 *    o-----------------------------------o--
 *                       5           2
 *                        o         o
 *   k+1              6    3       1    3               k+5
 *    o----------------o--o---------o--o-----------------o
 *
 *         L1 = 10*D                         L2 = 128.87*D
 *    |----------------|                  |-----------------| 
 */

Point(k+1) = {0.0, 0.0,  0.0,wall};
Point(k+2) = {0.0, D/2.0, 0.0, wall};
Point(k+3) = {L1+body+2*r, D/2.0, 0.0, wall};
Point(k+4) = {L1+L2, +(0.5+ (L2*4.5*D/128.87)), 0,wall};
Point(k+5) = {L1+L2, 0, 0, wall};

sym1 = newl; Line(sym1) = {6, k+1};
sym2 = newl; Line(sym2) = {4, 6};
sym3 = newl; Line(sym3) = {1, 4};
sym4 = newl; Line(sym4) = {3, 1};
sym5 = newl; Line(sym5) = {k+5, 3};
w1   = newl; Line(w1) = {k+3, k+4};
w2   = newl; Line(w2) = {k+2, k+3};
in   = newl; Line(in) = {k+1,k+2};
out  = newl; Line(out) = {k+4,k+5};

// Defining boundary conditions:
Physical Line('wallOutflow') = { out };
Physical Line('wallNoSlip') = { in, w1, w2};
Physical Line('wallNormalV') = { sym1,sym2,sym3,sym4,sym5 };  // symmetry bc
Physical Line(Sprintf("bubble%g",1)) = {1, 2, 3};

