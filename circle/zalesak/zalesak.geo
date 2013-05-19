
wall = 0.5;
xCenter=0.0;
yCenter=0.0;
radius=1.0;
xcoord=0.3;
wallLength=6*radius;
droplet=0.08;
pert=(0.0/100)*radius;

// Zalesak's disk
Point(1) = {xCenter, yCenter, 0,droplet}; // center
Point(2) = {xCenter, yCenter+radius-pert, 0,droplet}; // up
Point(3) = {xCenter-radius-pert, yCenter, 0,droplet}; // left
Point(4) = {xCenter+radius+pert, yCenter, 0,droplet}; // right
Point(5) = {-xcoord, radius/2.0, 0, droplet};
Point(6) = { xcoord, radius/2.0, 0, droplet};
Point(7) = {-xcoord, -Sqrt((radius*radius)-(xcoord*xcoord)), 0, droplet};
Point(8) = { xcoord, -Sqrt((radius*radius)-(xcoord*xcoord)), 0, droplet};

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

Physical Line("wallNoSlip") = {-8, -9, -10, -11};
Physical Line("bubble1") = {-6, -7, -1, -2, -3, -4, -5};
