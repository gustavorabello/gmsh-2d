// sphere for axisymmetric static or oscillating drop simulation

// axisymmetric bubble in divergent channel
wall = 0.02; 
b1 = 0.02; 
nb = 1; 

wallLength = 4;
 
D = 1.0; 
r = 0.5*D; 
pert = (0.0/100.0)*r; // circle perturbation

For t In {0:nb-1}
 // bubble's coordinates
 xc = 0.0;
 yc = 0.0;

 // include torus.geo file
 Include '../bubbleShape/sphereAxi.geo';
EndFor

k = newp;
/*  k+2                          k+3
 *    o---------------------------o
 *
 *
 *   k+1       4       3         k+4
 *    o--------o-------o----------o
 */
Point(k+1) = {-wallLength/2,            0.0, 0.0, wall};
Point(k+2) = {-wallLength/2, wallLength/2.0, 0.0, wall};
Point(k+3) = { wallLength/2, wallLength/2.0, 0.0, wall};
Point(k+4) = { wallLength/2,            0.0, 0.0, wall};

top = newl; Line(top) = { k+2, k+3 };
bl = newl; Line(bl) = { 1, 4 };
br = newl; Line(br) = { 3, 1 };
left = newl; Line(left) = { 4, k+1 };
right = newl; Line(right) = { k+4, 3 };
in = newl; Line(in) = {k+1, k+2};
out = newl; Line(out) = {k+3, k+4};

/* Boundary conditions: */
Physical Line(Sprintf("bubble%g",1)) = {1, -2};
Physical Line('wallNoSlipPressure') = { top, in, out };
Physical Line('wallNormalV') = { bl, br, left, right };  // symmetry bc

