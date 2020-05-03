
// refinement
wall = 0.1;
droplet=0.07;

D=1.0;
radius=D/2.0;
xcoord=0.2;
xCenter=0.0;
yCenter=0.6;
wallLength=6*D;
pert=(0.0/100)*radius;
scale=2.0;

// Zalesak's disk
Point(1) = {xCenter, yCenter, 0,droplet}; // center
Point(2) = {xCenter, yCenter+radius-pert, 0,droplet}; // up
Point(3) = {xCenter-radius-pert, yCenter, 0,droplet}; // left
Point(4) = {xCenter+radius+pert, yCenter, 0,droplet}; // right
Point(5) = {-xcoord, yCenter+radius/2.0, 0, droplet};
Point(6) = { xcoord, yCenter+radius/2.0, 0, droplet};
Point(7) = {-xcoord, yCenter-Sqrt((radius*radius)-(xcoord*xcoord)),0,droplet};
Point(8) = { xcoord, yCenter-Sqrt((radius*radius)-(xcoord*xcoord)),0,droplet};

// boundary
Point(9) = {-wallLength/2.0, -wallLength/2.0, 0,wall};
Point(10) = {wallLength/2.0, -wallLength/2.0, 0,wall};
Point(11) = {wallLength/2.0, wallLength/2.0, 0,wall};
Point(12) = {-wallLength/2.0, wallLength/2.0, 0,wall};


Ellipse(1) = {2, 1, 1, 3};
Ellipse(2) = {3, 1, 1, 7};
Line(3) = {7, 5};
Line(4) = {5, 6};
Line(5) = {6, 8};
Ellipse(6) = {8, 1, 1, 4};
Ellipse(7) = {4, 1, 1, 2};
Line(8) = {9, 10};
Line(9) = {10, 11};
Line(10) = {11, 12};
Line(11) = {12, 9};

//+
Dilate {{0, 0, 0}, {scale, scale, 0}} {
  Curve{1}; Curve{7}; Curve{6}; Curve{5}; Curve{4}; Curve{3}; Curve{2}; 
}

Physical Line("wallNoSlip") = {-8, -9, -10, -11};
Physical Line("bubble1") = {-6, -7, -1, -2, 3, 4, 5};
