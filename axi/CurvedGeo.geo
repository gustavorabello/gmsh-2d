// Gmsh project created on Wed Dec 21 23:16:33 2016


lc = DefineNumber[ 0.1, Name "Parameters/lc" ]; 
Point(1)={0.000000,0,0,lc}; 
Point(2)={10.00000,0,0,lc}; 
Point(3)={10.00000,1,0,lc}; 
Point(4)={0,1,0,lc}; 
Point(5)={5,0.6,0,lc}; 
Point(6)={3,0,0,lc}; 
Point(7)={7,0,0,lc}; 


BSpline(1) = {1, 6, 5, 7, 2};
Line(2)={2,3}; 
Line(3)= {4,3};
Line(4)={4,1}; 

//+
Line Loop(5) = {3, -2, -1, -4};
//+
Plane Surface(6) = {5};

Physical Line("wallNoSlipConcentration") = {1};
Physical Line("wallOutflow") = {2};
Physical Line("wallNormalV") = {3}; 
Physical Line("wallInflowU") = {4}; 
 
