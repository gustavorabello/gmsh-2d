
// variables
i=100*t;
j=200*t;

/*
 *             1       2
 *              o --- o  
 *              |     |
 *              |     |
 *              o --- o  
 *             4       3
 * */
Point(i+1) = {xc-D/2.0, yc+D/2.0, 0,b1}; // center
Point(i+2) = {xc+D/2.0, yc+D/2.0, 0,b1}; // up
Point(i+3) = {xc+D/2.0, yc-D/2.0, 0,b1}; // down
Point(i+4) = {xc-D/2.0, yc-D/2.0, 0,b1}; // left

Line(j+1) = {i+4, i+1};
Line(j+2) = {i+2, i+3};
Line(j+3) = {i+3, i+4};
Line(j+4) = {i+1, i+2};
