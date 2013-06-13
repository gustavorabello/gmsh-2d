// File: coalescence-two-bubbles-2d.geo

b1 = 0.02; // char. length interface 
wall = 0.03; // char. length wall


xm = 0; // center of combination zone
ym = 0; 

DeltaR = 0.1; // half of length of combination zone 
factor = 3.5; 
R = factor*DeltaR; // bubbles' radius
D = 2*R;
Theta = Pi/8; // angle

nL = 3; // parameter 
L = xm + DeltaR + nL*R; // outer domain - horizontal
nM = 2;
M = xm + nM*R; // outer domain - vertical

H = (DeltaR + R)*Tan(Theta);

Point(1) = {xm,ym,0,b1};
Point(2) = {xm + DeltaR,ym,0,b1};
Point(3) = {xm - DeltaR,ym,0,b1};
Point(4) = {xm + DeltaR + R,ym,0,b1};
Point(5) = {xm - DeltaR - R,ym,0,b1};
Point(6) = {xm + DeltaR + R*( 1 - Cos(Theta) ),R*Sin(Pi - Theta),0,b1};
Point(7) = {xm - DeltaR - R*( 1 - Cos(Theta) ),R*Sin(Pi - Theta),0,b1};
Point(8) = {xm + DeltaR + R*( 1 - Cos(Theta) ),- R*Sin(Pi - Theta),0,b1};
Point(9) = {xm - DeltaR - R*( 1 - Cos(Theta) ),- R*Sin(Pi - Theta),0,b1};
Point(10) = {xm,H,0,b1};
Point(11) = {xm,-H,0,b1};
Point(12) = {xm + DeltaR + D,ym,0,b1};
Point(13) = {xm - DeltaR - D,ym,0,b1};
Point(14) = {L,M,0,wall};
Point(15) = {-L,M,0,wall};
Point(16) = {-L,-M,0,wall};
Point(17) = {L,-M,0,wall};

Circle(1) = {6,4,12};
Circle(2) = {12,4,8};
Circle(3) = {7,5,13};
Circle(4) = {13,5,9};
Circle(5) = {7,10,6};
Circle(6) = {8,11,9};

Line(7) = {14, 17};
Line(8) = {17, 16};
Line(9) = {16, 15};
Line(10) = {15, 14};

Physical Line('wallNoSlip') = {10, 7, 8, 9};
Physical Line('bubble1') = {-3, 5, 1, 2, 6, -4};

