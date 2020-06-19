// Gmsh project created on Fri Feb  6 14:28:22 2009

nb = 1;
wall = 0.09;

D = 1.0;

k=newp;
Point(k+1) = {0, 0, 0,wall};
Point(k+2) = {4*D, 0, 0,wall};
Point(k+3) = {4*D, 8*D, 0,wall};
Point(k+4) = {0, 8*D, 0,wall};

Line(k+5) = {k+4, k+3};
Line(k+6) = {k+3, k+2};
Line(k+7) = {k+2, k+1};
Line(k+8) = {k+1, k+4};

//Physical Line('wallNoSlip') = {k+6, k+7, k+8, k+5};
Physical Line('wallNoSlip') = {k+6, k+7, k+8};
Physical Line('wallOutflow') = {k+5};

