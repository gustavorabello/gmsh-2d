

wall=0.1;

Point(1) = {1, 0.5, 0.0, wall};
Point(2) = {8, 0.5, 0.0, wall};
Point(3) = {8, 0, 0.0, wall};
Point(4) = {20, 0, 0.0, wall};
Point(5) = {20, 2, 0.0, wall};
Point(6) = {8, 2, 0.0, wall};
Point(7) = {8, 1.5, 0.0, wall};
Point(8) = {1, 1.5, 0.0, wall};

Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3, 4};
Line(4) = {4, 5};
Line(5) = {5, 6};
Line(6) = {6, 7};
Line(7) = {7, 8};
Line(8) = {8, 1};

/*
 *             2            3
 *              o ----------o 
 *              |             `,     
 *              |         5 o   o 6    
 *              |             ,'
 *              o ----------o 
 *             1            4
 *
 * */
b1        = 0.05;
xInit     = 2.0;
yInit     = 0.7;
height    = 0.6;
len       = 1.5*height;
pert      = (0.0/100)*(height/2.0);
p1        = 9; 
Point(09) = {xInit, yInit, 0, b1}; // init
Point(10) = {xInit, yInit+height, 0, b1}; 
Point(11) = {xInit+len, yInit+height, 0, b1}; 
Point(12) = {xInit+len, yInit, 0, b1}; 
Point(13) = {xInit+len, yInit+height/2.0, 0, b1}; // center
Point(14) = {xInit+len+pert+height/2.0, yInit+height/2.0, 0, b1};// center

Line(9) = {p1+2,p1+1};
Line(10) = {p1+1, p1};
Line(11) = {p1, p1+3};
Ellipse(12) = {p1+3, p1+4, p1+4, p1+5};
Ellipse(13) = {p1+5, p1+4, p1+4, p1+2};

/*
 *             2            3
 *              o ----------o 
 *              |             `,     
 *              |         5 o   o 6    
 *              |             ,'
 *              o ----------o 
 *             1            4
 *
 * */
b2        = 0.05;
xInit     = 3.8;
yInit     = 0.7;
height    = 0.6;
len       = 1.5*height;
pert      = (0.0/100)*(height/2.0);
p1        = 15; 
Point(15) = {xInit, yInit, 0, b2}; // init
Point(16) = {xInit, yInit+height, 0, b2}; 
Point(17) = {xInit+len, yInit+height, 0, b2}; 
Point(18) = {xInit+len, yInit, 0, b2}; 
Point(19) = {xInit+len, yInit+height/2.0, 0, b2}; // center
Point(20) = {xInit+len+pert+height/2.0, yInit+height/2.0, 0, b2};// center

Line(14) = {p1+2,p1+1};
Line(15) = {p1+1, p1};
Line(16) = {p1, p1+3};
Ellipse(17) = {p1+3, p1+4, p1+4, p1+5};
Ellipse(18) = {p1+5, p1+4, p1+4, p1+2};

Physical Line('wall') = {8, 1, 2, 3, 4, 5, 6, 7};
Physical Line('bubble1') = {9, 10, 11, 12, 13};
Physical Line('bubble2') = {14, 15, 16, 17, 18};
