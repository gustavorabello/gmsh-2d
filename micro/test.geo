
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

wall=0.07;
Point(1) = {0, 0, 0, wall};
Point(2) = {0, 1, 0, wall};
Point(3) = {6, 0, 0, wall};
Point(4) = {6, 1, 0, wall};


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
b1=0.06;
p=4;
Point(5) =  {1.0, 0.15, 0, b1}; 
Point(6) =  {1.0, 0.85, 0, b1};
Point(7) =  {1.4, 0.85, 0, b1};
Point(8) =  {1.4, 0.15, 0, b1};
Point(9) =  {1.4, 0.5, 0, b1};
Point(10) =  {1.8, 0.5, 0, b1};
Point(11) =  {1.0, 0.6, 0, b1};
Point(12) =  {0.7, 0.6, 0, b1};
Point(13) =  {1.0, 0.4, 0, b1};
Point(14) = {0.7, 0.4, 0, b1};
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

//--------------------------------------------------
// Physical Line('wallNoSlip') = {7, 5};
// Physical Line('wallOutflow') = {6};
// Physical Line('wallInflowU') = {4};
// Physical Line('bubble1') = {3, 9, 2, 10, 11, 1, 8};
//-------------------------------------------------- 

Physical Line('wallNoSlip') = {7, 5};
Physical Line('wallOutflow') = {6};
Physical Line('wallInflowU') = {4};
Physical Line('bubble1') = {3, 9, 2, 10, 11, 1, 8};

Transfinite Line {4} = 30 Using Progression 1;
Transfinite Line {6} = 30 Using Progression 1;
