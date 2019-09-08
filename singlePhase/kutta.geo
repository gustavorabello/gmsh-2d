
wall = 0.4; // refinement
nPoints = 40; // number of nodes
angRot = 0.0*(-Pi/6); // rotation

// cases
Case = 1; // circle
//Case = 2; // ellipse
//Case = 3; // symmetric airfoil
//Case = 4; // assymmetric airfoil

// circle
If( Case == 1 )
 Printf("Circle with R=5");
 xCenter = 0.00;
 yCenter =  0.00;
 R = 5.00;
 L = 20.0;
 nPoints = 60; // number of nodes
 //wall = 2.0; // refinement
 wall = 1.8; // refinement
 //wall = 0.5; // refinement
 Printf("radius = %f",R);
EndIf

// ellipse
If( Case == 2 )
 Printf("Ellipse R=1");
 xCenter = 0.00;
 yCenter = 0.00;
 R = 1.50;
 L = 4.0;
EndIf

// symmetric airfoil profile
If( Case == 3 )
 Printf("Symmetric airfiol");
 xCenter = -0.20;
 yCenter =  0.00;
 R = 1.2;
 L = 4.0;
EndIf

// assymmetric airfoil profile
If( Case == 4 )
 Printf("Assymmetric airfiol");
 xCenter = -0.15;
 yCenter =  0.10;
 R = Sqrt(1.2*1.2 + 0.25*0.25);
 L = 4.0;
EndIf

dTheta = 2.0*Pi/nPoints;

theta = 0.01;
k = 0;
j = 1+k;
For i In {1:nPoints}
 X = xCenter + R*Cos(theta);
 Y = yCenter + R*Sin(theta);
 Xk = (X*X*X - X*Y*Y + X + 2*X*Y*Y)/(X*X+Y*Y);
 Yk = (2*X*X*Y - X*X*Y + Y*Y*Y - Y)/(X*X+Y*Y);
 Point(j) = {Xk, Yk, 0, wall};
 j = j + 1;
 theta = theta+dTheta;
EndFor

j = 1+k;
// lines
For i In {1:nPoints-1}
 Line(j) = {j, j+1};
 j = j + 1;
EndFor
// last line
Line(j) = {j, 1};
j = j + 2;

//+ rotation
Rotate {{0, 0, 1}, {xCenter, yCenter, 0}, angRot} {
  Line{1:nPoints-1:1}; 
}

j = 1000;
Point(j+0)  = {-L, -L, 0.0,  wall}; // p0
Point(j+1)  = { L, -L, 0.0,  wall}; // p3
Point(j+2)  = { L,  L, 0.0,  wall}; // p4
Point(j+3)  = {-L,  L, 0.0,  wall}; // p5

Line(j+0) = {j+0,j+1}; 
Line(j+1) = {j+1,j+2}; 
Line(j+2) = {j+2,j+3}; 
Line(j+3) = {j+3,j+0}; 

//+
Line Loop(1) = {1000:1003:1};
Line Loop(2) = {1:nPoints:1};
Plane Surface(1) = {1, 2};

//+ boundary conditions stream function (psi)
Physical Line('wallPsiBottom') = {1000};
Physical Line('wallPsiTop') = {1002};
Physical Line('wallPsiY') = {1003, 1001};
Physical Line('wallPsiHole') = {1:nPoints:1};
//+
Physical Surface(5) = {1};

