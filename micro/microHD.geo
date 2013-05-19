
/*
 *      2  o------------------------ o  4
 *         |                         |
 *         |                         |
 *         |                         |
 *         |                         | 
 *         |                         |
 *      1  o ----------------------- o  3
 *
 * */

wall=0.02;
Point(1) = {0, 0, 0, wall};
Point(2) = {0, 1, 0, wall};
Point(3) = {3, 0, 0, wall};
Point(4) = {3, 1, 0, wall};


/*
 *             6            7
 *            , o ----------o 
 *        12  o o 11         `,     
 *            |          9 o  o 10    
 *        14  o o 13         ,'
 *            ' o ----------o 
 *             5            8
 *
 * */
b1=0.03;
p=4;
Point(5) =  {0.9, 0.15, 0, b1}; 
Point(6) =  {0.9, 0.85, 0, b1};
Point(7) =  {1.9, 0.85, 0, b1};
Point(8) =  {1.9, 0.15, 0, b1};
Point(9) =  {1.9, 0.5, 0, b1};
Point(10) =  {2.3, 0.5, 0, b1};
Point(11) =  {0.9, 0.6, 0, b1};
Point(12) =  {0.6, 0.6, 0, b1};
Point(13) =  {0.9, 0.4, 0, b1};
Point(14) = {0.6, 0.4, 0, b1};
Line(1) = {6, 7};
Line(2) = {8, 5};
Line(3) = {12, 14};
Line(4) = {1, 2};
Line(5) = {2, 4};
Line(6) = {4, 3};
Line(7) = {3, 1};
Ellipse(8) = {6, 11, 11, 12};
Ellipse(9) = {5, 13, 13, 14};
Ellipse(10) = {8, 9, 9, 10};
Ellipse(11) = {10, 9, 9, 7};
Physical Line('wall') = {4, 7, 6, 5};
Physical Line('bubble') = {3, 9, 2, 10, 11, 1, 8};
Transfinite Line {4} = 30 Using Progression 1;
Transfinite Line {6} = 30 Using Progression 1;
