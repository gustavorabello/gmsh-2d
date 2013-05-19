
/*
 *                          o------------------------ o
 *             2            |                         |
 *           o ------------ o                         |
 *           |                                        |
 *           o ------------ o                         | 
 *             1            |                         |
 *                          o ----------------------- o
 *
 * */
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
xInit     = 1.5;
yInit     = 0.7;
height    = 0.6;
len       = 2.5*height;
pert      = (0.0/100)*(height/2.0);
p1        = 9; 
Point(09) = {xInit, yInit, 0, b1}; // init
Point(10) = {xInit, yInit+height, 0, b1}; 
Point(11) = {xInit+len, yInit+height, 0, b1}; 
Point(12) = {xInit+len, yInit, 0, b1}; 
Point(13) = {xInit+len, yInit+height/2.0, 0, b1}; // center
Point(14) = {xInit+len+pert+height/2.0, yInit+height/2.0, 0, b1};

Line(9) = {p1+2,p1+1};
Line(10) = {p1+1, p1};
Line(11) = {p1, p1+3};
Ellipse(12) = {p1+3, p1+4, p1+4, p1+5};
Ellipse(13) = {p1+5, p1+4, p1+4, p1+2};

/*
 *               2
 *               o 
 *            ,'1  `,     
 *         4 o   o   o 5    
 *            `,   ,'
 *               o 
 *               3
 *
 * */
b2        = 0.04;
xInit     = 4.7;
height    = 0.7;
yInit     = 0.7+height/3.0;
len       = 1.5*height;
pert      = (0.0/100)*(height/2.0);
p1        = 15; 
droplet = 0.03;
wall = 0.5;
xCenter=1.5;
yCenter=1.5;
radius=0.5;
pert=(1.0/100)*radius;
Point(15) = {xInit, yInit, 0, b2}; // center
Point(16) = {xInit, yInit-pert+height/2.0, 0, b2}; // up
Point(17) = {xInit, yInit+pert-height/2.0, 0, b2}; // down
Point(18) = {xInit-pert-height/2.0, yInit, 0, b2}; // left 
Point(19) = {xInit+pert+height/2.0, yInit, 0, b2}; // right
Ellipse(14) = {p1+1, p1, p1, p1+4};
Ellipse(15) = {p1+4, p1, p1, p1+2};
Ellipse(16) = {p1+2, p1, p1, p1+3};
Ellipse(17) = {p1+3, p1, p1, p1+1};

/*
 *               2
 *               o 
 *            ,'1  `,     
 *         4 o   o   o 5    
 *            `,   ,'
 *               o 
 *               3
 *
 * */
b3        = 0.04;
xInit     = 6.2;
height    = 0.7;
yInit     = 0.7+0.3;
len       = 1.5*height;
pert      = (0.0/100)*(height/2.0);
p1        = 20; 
droplet = 0.03;
wall = 0.5;
xCenter=1.5;
yCenter=1.5;
radius=0.5;
pert=(1.0/100)*radius;
Point(20) = {xInit, yInit, 0, b3}; // center
Point(21) = {xInit, yInit-pert+height/2.0, 0, b3}; // up
Point(22) = {xInit, yInit+pert-height/2.0, 0, b3}; // down
Point(23) = {xInit-pert-height/2.0, yInit, 0, b3}; // left 
Point(24) = {xInit+pert+height/2.0, yInit, 0, b3}; // right
Ellipse(18) = {p1+1, p1, p1, p1+4};
Ellipse(19) = {p1+4, p1, p1, p1+2};
Ellipse(20) = {p1+2, p1, p1, p1+3};
Ellipse(21) = {p1+3, p1, p1, p1+1};


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
b4        = 0.05;
xInit     = 7.6;
yInit     = 0.7;
height    = 0.6;
len       = 0.6*height;
pert      = (0.0/100)*(height/2.0);
p1        = 25; 
Point(25) = {xInit, yInit, 0, b4}; // init
Point(26) = {xInit, yInit+height, 0, b4}; 
Point(27) = {xInit+len, yInit+height, 0, b4}; 
Point(28) = {xInit+len, yInit, 0, b4}; 
Point(29) = {xInit+len, yInit+height/2.0, 0, b4}; // center
Point(30) = {xInit+len+pert+height/2.0, yInit+height/2.0, 0, b4};

Line(24) = {p1+2,p1+1};
Line(25) = {p1+1, p1};
Line(26) = {p1, p1+3};
Ellipse(27) = {p1+3, p1+4, p1+4, p1+5};
Ellipse(28) = {p1+5, p1+4, p1+4, p1+2};

Physical Line('wall') = {8, 1, 2, 3, 4, 5, 6, 7};
Physical Line('bubble1') = {10, 11, 12, 13, 9};
Physical Line('bubble2') = {17, 16, 15, 14};
Physical Line('bubble3') = {21, 20, 19, 18};
Physical Line('bubble4') = {25, 26, 27, 28, 24};

