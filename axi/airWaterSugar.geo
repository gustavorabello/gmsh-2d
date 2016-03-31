// axisymmetric rising bubble using fixed frame
Case = 3;
l1 = 0.04; // fine
l2 = 0.3;  // coarse

D = 8.0; // channel diameter (case 0)
l = 12.0; // total length of the domain
dist = 2.0; // distance between the center and bottom (left) boundary
twoD = 0.0;
If( Case == -314 )
 Printf("Quantitative benchmark computations of two-dimensional bubble dynamics, Int. J. for Num. Meth. in Fluids, vol. 60 pp. 1259-1288 (2008)");
 D = 2.0;
 l = 4.0;
 dist = 1.0;
 l1 = 0.03;
 l2 = 0.1;
EndIf
If( Case == -27 )
 Printf("C: Axisymmetric free boundary problems, J. Fluid Mech., vol. 341 pp. 269-294 (1997)");
 D = 3.0;
 dist = 1.0;
 l1 = 0.015;
 l2 = 0.3;
EndIf
If( Case == -26 )
 Printf("A: Axisymmetric free boundary problems, J. Fluid Mech., vol. 341 pp. 269-294 (1997)");
 D = 3.0;
 dist = 1.0;
 l1 = 0.04;
 l2 = 0.3;
EndIf
If( Case == -1 )
 Printf("Mirco");
EndIf
If( Case == 0 )
 Printf("NumMetHeaTra");
 D = 8.0;
 //l = 20.0;
 dist = 10.0 / 6.0;
EndIf
If( Case > 0 )
 Printf("Gustavo");
 D = 6.0;
 l = 8;
 dist = 2.0;
EndIf

/* Defining bubble shape (circle with diameter 1, cetered at origin): */
Point(1) = {  0.0, twoD, 0.0, l1}; // center
Point(2) = {  0.0, 0.5+twoD, 0.0, l1}; // up
Point(3) = {  0.5, twoD, 0.0, l1}; // right
Point(4) = { -0.5, twoD, 0.0, l1}; // left
Ellipse(1) = { 2, 1, 1, 3 };
Ellipse(2) = { 4, 1, 1, 2 };

k = newp;
/*  k+2                                   k+3
 *    o------------------------------------o
 *
 *
 *   k+1   4       3                      k+4
 *    o----o-------o-----------------------o
 */
Point(k+1) = {  -dist, twoD, 0.0, l2};
Point(k+2) = {  -dist, D/2.0+twoD, 0.0, l2};
Point(k+3) = { l-dist, D/2.0+twoD, 0.0, l2};
Point(k+4) = { l-dist, twoD, 0.0, l2};

top = newl; Line(top) = { k+2, k+3 };
bl = newl; Line(bl) = { 1, 4 };
br = newl; Line(br) = { 3, 1 };
left = newl; Line(left) = { 4, k+1 };
right = newl; Line(right) = { k+4, 3 };
in = newl; Line(in) = {k+1, k+2};
out = newl; Line(out) = {k+3, k+4};

/* Boundary conditions: */
Physical Line(Sprintf("bubble%g",1)) = {1, 2};
If ( Case < 0 )
 Printf("Slip walls");
 Physical Line('wallNoSlipPressure') = { in, out };
 Physical Line('wallNormalV') = { top, bl, br, left, right };  // symmetry bc
EndIf
If ( Case >= 0 )
 Printf("No-slip walls");
 Physical Line('wallNoSlipPressure') = { top, in, out };
 Physical Line('wallNormalV') = { bl, br, left, right };  // symmetry bc
EndIf
