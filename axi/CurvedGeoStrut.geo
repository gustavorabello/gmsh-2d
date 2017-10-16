// Gmsh project created on Fri Dec 30 16:33:57 2016

la = DefineNumber[ 0.05, Name "Parameters/la" ]; 
lc = DefineNumber[ 0.02, Name "Parameters/lc" ]; 

// removing 1.0 from y coordinate for symmetry, since 
// normalV should be at Y=0.0 and everything else above. 
// This number makes the average channel diameter equal to 1.
xMax = 10.0000;
symY = 3.0;
Point(1)={0.000000,symY-2.000000,0,la}; 
Point(2)={1.850000,symY-2.000000,0,lc}; 
Point(3)={2.150000,symY-2.000000,0,lc}; 
Point(4)={2.531200,symY-2.015500,0,lc}; 
Point(5)={2.804000,symY-2.140300,0,lc}; 
Point(6)={3.189700,symY-2.283600,0,lc}; 
Point(7)={3.478400,symY-2.365000,0,lc}; 
Point(8)={3.851400,symY-2.438700,0,lc}; 
Point(9)={4.149200,symY-2.474200,0,lc}; 
Point(10)={4.516700,symY-2.495100,0,lc}; 
Point(11)={4.816700,symY-2.499700,0,lc}; 
Point(12)={5.183300,symY-2.499700,0,lc}; 
Point(13)={5.483300,symY-2.495100,0,lc}; 
Point(14)={5.850800,symY-2.474200,0,lc}; 
Point(15)={6.148600,symY-2.438700,0,lc}; 
Point(16)={6.521600,symY-2.365000,0,lc}; 
Point(17)={6.810300,symY-2.283600,0,lc}; 
Point(18)={7.196000,symY-2.140300,0,lc}; 
Point(19)={7.468800,symY-2.015500,0,lc}; 
Point(20)={7.850000,symY-2.000000,0,lc}; 
Point(21)={8.150000,symY-2.000000,0,lc}; 
Point(22)={xMax,symY-2.000000,0,lc}; 
Point(23)={2.000000,symY-2.000000,0,lc}; 
Point(24)={2.666700,symY-2.079800,0,lc}; 
Point(25)={3.333300,symY-2.326800,0,lc}; 
Point(26)={4.000000,symY-2.458800,0,lc}; 
Point(27)={4.666700,symY-2.498400,0,lc}; 
Point(28)={5.333300,symY-2.498400,0,lc}; 
Point(29)={6.000000,symY-2.458800,0,lc}; 
Point(30)={6.666700,symY-2.326800,0,lc}; 
Point(31)={7.333300,symY-2.079800,0,lc}; 
Point(32)={8.000000,symY-2.000000,0,lc}; 
Point(33)={2.000000,symY-2.150000,0,lc}; 
Point(34)={2.604294,symY-2.216213,0,lc}; 
Point(35)={3.292593,symY-2.471172,0,lc}; 
Point(36)={3.982247,symY-2.607719,0,lc}; 
Point(37)={4.664400,symY-2.648403,0,lc}; 
Point(38)={5.335600,symY-2.648403,0,lc}; 
Point(39)={6.017753,symY-2.607719,0,lc}; 
Point(40)={6.707407,symY-2.471172,0,lc}; 
Point(41)={7.395706,symY-2.216213,0,lc}; 
Point(42)={8.000000,symY-2.150000,0,lc}; 
Line(1)={1,2}; 
Line(2)={3,4}; 
Line(3)={5,6}; 
Line(4)={7,8}; 
Line(5)={9,10}; 
Line(6)={11,12}; 
Line(7)={13,14}; 
Line(8)={15,16}; 
Line(9)={17,18}; 
Line(10)={19,20}; 
Line(11)={21,22}; 
Circle(12)={2,23,33}; 
Circle(13)={4,24,34}; 
Circle(14)={6,25,35}; 
Circle(15)={8,26,36}; 
Circle(16)={10,27,37}; 
Circle(17)={12,28,38}; 
Circle(18)={14,29,39}; 
Circle(19)={16,30,40}; 
Circle(20)={18,31,41}; 
Circle(21)={20,32,42}; 
Circle(22)={33,23,3}; 
Circle(23)={34,24,5}; 
Circle(24)={35,25,7}; 
Circle(25)={36,26,9}; 
Circle(26)={37,27,11}; 
Circle(27)={38,28,13}; 
Circle(28)={39,29,15}; 
Circle(29)={40,30,17}; 
Circle(30)={41,31,19}; 
Circle(31)={42,32,21}; 
Point(43)={0.000000,symY-3.000000,0,la}; 
Point(44)={xMax,symY-3.000000,0,la}; 

Line(32)={43,44}; 
Line(33)={43,1}; 
Line(34)={44,22}; 

//+
Line Loop(35) = {32, 34, -11, -31, -21, -10, -30, -20, -9, -29, -19, -8, -28, -18, -7, -27, -17, -6, -26, -16, -5, -25, -15, -4, -24, -14, -3, -23, -13, -2, -22, -12, -1, -33};
//+
Plane Surface(36) = {35};

Physical Line("wallNoSlip") = {1,2,3,4,5,6,7,8,9,10,11}; 
Physical Line("wallNoSlipConcentration") = {12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31}; 
Physical Line("wallNormalV") = {32}; 
Physical Line("wallInflowUParabolic3d") = {33}; 
Physical Line("wallOutflow") = {34}; 
