
// variables
i=100*t;
j=200*t;

/*
 *              6           2
 *              o --------- o 
 *            /              `,     
 *          8 o o 5       1 o  o 4    
 *            \              ,'
 *              o --------- o 
 *              7           3
 *
 * */
Point(i+1) = {xc+r/2.0+body, yc, zc, b1}; // center
Point(i+2) = {xc+r/2.0+body, yc+r, zc, b1}; // up
Point(i+3) = {xc+r/2.0+body, yc-r, zc, b1}; // down 
Point(i+4) = {xc+r/2.0+body+r, yc, zc, b1}; // right

Point(i+5) = {xc+r/2.0, yc, zc, b1}; // center
Point(i+6) = {xc+r/2.0, yc+r, zc, b1}; // up
Point(i+7) = {xc+r/2.0, yc-r, zc, b1}; // down 
Point(i+8) = {xc, yc, zc, b1}; // right
Ellipse(j+1) = {i+2, i+1, i+1, i+4};
Ellipse(j+2) = {i+4, i+1, i+1, i+3};
Ellipse(j+3) = {i+7, i+5, i+5, i+8};
Ellipse(j+4) = {i+8, i+5, i+5, i+6};
Line(j+5) = {i+6, i+2};
Line(j+6) = {i+3, i+7};

