
// variables
i=100*t;
j=200*t;

/*
 *              2
 *              o  
 *            /   \     
 *         5 o  o  o 4    
 *            
 * */
Point(i+1) = {xc+r/2.0+body, yc, zc, b1}; // center
Point(i+2) = {xc+r/2.0+body, yc+r, zc, b1}; // up
Point(i+3) = {xc+r/2.0+body+r, yc, zc, b1}; // right
Point(i+4) = {xc+r/2.0+body-r, yc, zc, b1}; // right
Ellipse(j+1) = {i+2, i+1, i+1, i+3};
Ellipse(j+2) = {i+2, i+1, i+1, i+4};

