
wall = 0.1;
hole = 0.05;

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

xCenter=3*L/2.0;
yCenter=L/2.0;
radius=0.125;
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
Point(7)  = {3*L, 0.0, 0.0,  wall}; // p3
Point(8)  = {3*L, L, 0.0,  wall}; // p4
Point(9)  = {0.0, L, 0.0,  wall}; // p5

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
Physical Line('direita') = {6};
Physical Line('esquerda') = {8};
Physical Line('inferior') = {5};
Physical Line('superior') = {7};
Physical Line('circulo') = {4, 1, 2, 3};

//+
Physical Surface(5) = {1};
