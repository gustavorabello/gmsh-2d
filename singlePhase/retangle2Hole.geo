
wall = 0.1;
hole = 0.1;

L = 1.0;


/* 
 *              5         L+9L                4
 *         o -------------------------------- o         
 *         |                                  |       
 *    L    |                       _    _     |       
 *         |                      / \    | L  |       Y         
 *         o ---------- o         \_/   _|    | 2L    ^
 *         0          1 |                     |       |
 *              2*L     |                     |       |
 *         x(0,0)       o ------------------- o       o -----> X
 *                      2          9L         3
 * */

xCenter=8*L/3.0;
yCenter=1*L;
radius=0.5;
pert=(0.0/100)*radius;
Point(1) = {xCenter, yCenter,             0,hole}; // center
Point(2) = {xCenter, yCenter+radius-pert, 0,hole}; // up
Point(3) = {xCenter, yCenter-radius+pert, 0,hole}; // down
Point(4) = {xCenter-radius-pert, yCenter, 0,hole}; // left
Point(5) = {xCenter+radius+pert, yCenter, 0,hole}; // right
Ellipse(1) = {2, 1, 1, 5};
Ellipse(2) = {5, 1, 1, 3};
Ellipse(3) = {3, 1, 1, 4};
Ellipse(4) = {4, 1, 1, 2};

xCenter=2*8*L/3.0;
yCenter=1*L;
radius=0.5;
pert=(30.0/100)*radius;
Point(6) = {xCenter, yCenter,             0,hole}; // center
Point(7) = {xCenter, yCenter+radius-pert, 0,hole}; // up
Point(8) = {xCenter, yCenter-radius+pert, 0,hole}; // down
Point(9) = {xCenter-radius-pert, yCenter, 0,hole}; // left
Point(10) = {xCenter+radius+pert, yCenter, 0,hole}; // right
Ellipse(5) = {7, 6, 6, 10};
Ellipse(6) = {10, 6, 6, 8};
Ellipse(7) = {8, 6, 6, 9};
Ellipse(8) = {9, 6, 6, 7};

Point(11)  = {0.0, 0.0, 0.0,  wall}; // p0
Point(12)  = {8*L, 0.0, 0.0,  wall}; // p3
Point(13)  = {8*L, 2*L, 0.0,  wall}; // p4
Point(14)  = {0.0, 2*L, 0.0,  wall}; // p5

Line(9) = {11, 12};
Line(10) = {12, 13};
Line(11) = {13, 14};
Line(12) = {14, 11};
Line Loop(1) = {11, 12, 9, 10};
Line Loop(2) = {4, 1, 2, 3};
Line Loop(3) = {8, 5, 6, 7};
Plane Surface(1) = {1, 2, 3};

//+ boundary conditions stream function (psi)
Physical Line('wallPsiBottom') = {9};
Physical Line('wallPsiTop') = {11};
Physical Line('wallPsiY') = {10, 12};
Physical Line('wallPsiHole') = {4, 1, 2, 3, 8, 5, 6, 7};

//+
Physical Surface(5) = {1};
