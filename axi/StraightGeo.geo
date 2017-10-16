// Gmsh project created on Wed Dec 21 22:42:40 2016

lc = DefineNumber[ 0.02, Name "Parameters/lc" ]; 

// removing 1.0 from y coordinate for symmetry, since 
// normalV should be at Y=0.0 and everything else above. 
// This number makes the average channel diameter equal to 1.
xMax = 10.0000;
symY = 1.0;
Point(1)={0.000000,symY-0,0,lc}; 
Point(2)={1.725,symY-0,0,lc}; 
Point(3)={8.275,symY-0,0,lc}; 
Point(4)={xMax,symY-0,0,lc}; 
Point(5)={xMax,symY-1,0,lc}; 
Point(6)={0,symY-1,0,lc}; 

Line(1)={1,2}; 
Line(2)={2,3}; 
Line(3)={3,4}; 
Line(4)={4,5}; 
Line(5)={5,6}; 
Line(6)={6,1}; 

/*--------------------------------------------------
 * //+
 * Line Loop(7) = {3, 4, 5, 6, 1, 2};
 * //+
 * Plane Surface(8) = {7};
 * --------------------------------------------------*/

Physical Line("wallNoSlip") = {-1,-3};
Physical Line("wallNoSlipConcentration") = {-2};
Physical Line("wallOutflow") = {-4};
Physical Line("wallNormalV") = {-5}; 
Physical Line("wallInflowUParabolic3d") = {-6}; 

