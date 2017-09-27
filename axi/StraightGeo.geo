// Gmsh project created on Wed Dec 21 22:42:40 2016

lc = DefineNumber[ 0.10, Name "Parameters/lc" ]; 
Point(1)={0.000000,0,0,lc}; 
Point(2)={10.00000,0,0,lc}; 
Point(3)={10.00000,1,0,lc}; 
Point(4)={0,1,0,lc}; 

Line(1)={1,2}; 
Line(2)={2,3}; 
Line(3)={3,4}; 
Line(4)={4,1}; 

//+
Line Loop(5) = {3, 4, 1, 2};
//+
Plane Surface(6) = {5};

Physical Line("wallNoSlipConcentration") = {1};
Physical Line("wallOutflow") = {2};
Physical Line("wallNormalV") = {3}; 
Physical Line("wallInflowU") = {4}; 


