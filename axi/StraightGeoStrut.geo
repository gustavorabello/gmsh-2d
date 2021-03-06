// Gmsh project created on Sat Dec 03 21:08:54 2016

lc = DefineNumber[ 0.02, Name "Parameters/lc" ]; 

// removing 1.0 from y coordinate for symmetry, since 
// normalV should be at Y=0.0 and everything else above. 
// This number makes the average channel diameter equal to 1.
xMax = 10.0000;
cutX = 1.45;
symY = 1.0;
Point(1) = {0.000000, symY-0.000000, 0, lc};
Point(2) = {3.175000-cutX, symY-0.000000, 0, lc};
Point(3) = {3.300000-cutX, symY-0.000000, 0, lc};
Point(4) = {3.425000-cutX, symY-0.000000, 0, lc};
Point(5) = {3.875000-cutX, symY-0.000000, 0, lc};
Point(6) = {4.000000-cutX, symY-0.000000, 0, lc};
Point(7) = {4.125000-cutX, symY-0.000000, 0, lc};
Point(8) = {4.575000-cutX, symY-0.000000, 0, lc};
Point(9) = {4.700000-cutX, symY-0.000000, 0, lc};
Point(10) = {4.825000-cutX, symY-0.000000, 0, lc};
Point(11) = {5.275000-cutX, symY-0.000000, 0, lc};
Point(12) = {5.400000-cutX, symY-0.000000, 0, lc};
Point(13) = {5.525000-cutX, symY-0.000000, 0, lc};
Point(14) = {5.975000-cutX, symY-0.000000, 0, lc};
Point(15) = {6.100000-cutX, symY-0.000000, 0, lc};
Point(16) = {6.225000-cutX, symY-0.000000, 0, lc};
Point(17) = {6.675000-cutX, symY-0.000000, 0, lc};
Point(18) = {6.800000-cutX, symY-0.000000, 0, lc};
Point(19) = {6.925000-cutX, symY-0.000000, 0, lc};
Point(20) = {7.375000-cutX, symY-0.000000, 0, lc};
Point(21) = {7.500000-cutX, symY-0.000000, 0, lc};
Point(22) = {7.625000-cutX, symY-0.000000, 0, lc};
Point(23) = {8.075000-cutX, symY-0.000000, 0, lc};
Point(24) = {8.200000-cutX, symY-0.000000, 0, lc};
Point(25) = {8.325000-cutX, symY-0.000000, 0, lc};
Point(26) = {8.775000-cutX, symY-0.000000, 0, lc};
Point(27) = {8.900000-cutX, symY-0.000000, 0, lc};
Point(28) = {9.025000-cutX, symY-0.000000, 0, lc};
Point(29) = {9.475000-cutX, symY-0.000000, 0, lc};
Point(30) = {9.600000-cutX, symY-0.000000, 0, lc};
Point(31) = {9.725000-cutX, symY-0.000000, 0, lc};
Point(32) = {xMax, symY-0.000000, 0, lc};
Point(33) = {xMax, symY-1.000000, 0, lc};
Point(34) = {0.000000, symY-1.000000, 0, lc};

//+
Line(1) = {1, 2};
//+
Circle(2) = {2, 3, 4};
//+
Circle(3) = {5, 6, 7};
//+
Circle(4) = {8, 9, 10};
//+
Circle(5) = {11, 12, 13};
//+
Circle(6) = {14, 15, 16};
//+
Circle(7) = {17, 18, 19};
//+
Circle(8) = {20, 21, 22};
//+
Circle(9) = {23, 24, 25};
//+
Circle(10) = {26, 27, 28};
//+
Circle(11) = {29, 30, 31};
//+
Line(12) = {4, 5};
//+
Line(13) = {7, 8};
//+
Line(14) = {10, 11};
//+
Line(15) = {13, 14};
//+
Line(16) = {16, 17};
//+
Line(17) = {19, 20};
//+
Line(18) = {22, 23};
//+
Line(19) = {25, 26};
//+
Line(20) = {28, 29};
//+
Line(21) = {31, 32};
//+
Line(22) = {32, 33};
//+
Line(23) = {33, 34};
//+
Line(24) = {34, 1};


/*--------------------------------------------------
 * //+
 * Line Loop(25) = {23, 24, 1, 2, 12, 3, 13, 4, 14, 5, 15, 6, 16, 7, 17, 8, 18, 9, 19, 10, 20, 11, 21, 22};
 * //+
 * Plane Surface(26) = {25};
 * --------------------------------------------------*/

//+
Physical Line('wallNoSlipConcentration') = {2,3,4,5,6,7,8,9,10,11};
Physical Line('wallNoSlip') = {1,12,13,14,15,16,17,18,19,20,21};
//+
Physical Line('wallInflowUParabolic3d') = {24};
//+
Physical Line('wallOutflow') = {22};
//+
Physical Line('wallNormalV') = {23};

