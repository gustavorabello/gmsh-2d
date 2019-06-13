
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

xCenter=8*L/2.0;
yCenter=L;
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

Point(6)  = {0.0, 0.0, 0.0,  wall}; // p0
Point(7)  = {8*L, 0.0, 0.0,  wall}; // p3
Point(8)  = {8*L, 2*L, 0.0,  wall}; // p4
Point(9)  = {0.0, 2*L, 0.0,  wall}; // p5

Line(5) = {6, 7};
Line(6) = {7, 8};
Line(7) = {8, 9};
Line(8) = {9, 6};

//+ required by 2d mesh
Line Loop(1) = {7, 8, 5, 6};
Line Loop(2) = {4, 1, 2, 3};
Plane Surface(1) = {1, 2};

/*--------------------------------------------------
 * //+ boundary conditions potential (phi)
 * Physical Line('wallPhiY') = {8,6};
 * Physical Line('wallPhiBottom') = {5};
 * Physical Line('wallPhiTop') = {7};
 * Physical Line('wallPhiHole') = {4, 1, 2, 3};
 * --------------------------------------------------*/

//+ boundary conditions stream function (psi)
Physical Line('wallPsiY') = {8, 6};
Physical Line('wallPsiBottom') = {5};
Physical Line('wallPsiTop') = {7};
Physical Line('wallPsiHole') = {4, 1, 2, 3};

//+
Physical Surface(5) = {1};
