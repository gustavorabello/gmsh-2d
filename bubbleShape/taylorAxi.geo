
// variables
i=100*t;
j=200*t;

/*
 *              5           2
 *              o --------- o 
 *            /              `,     
 *          6 o o 4       1 o  o 3    
 * */
Point(i+1) = {xc, yc, zc, b1}; // right
Point(i+2) = {xc, yc+r, zc, b1}; // center
Point(i+3) = {xc+r, yc, zc, b1}; // center

Point(i+4) = {xc-body, yc, zc, b1}; // center
Point(i+5) = {xc-body, yc+r, zc, b1}; // center
Point(i+6) = {xc-body-r/2.0, yc, zc, b1}; // center

Ellipse(j+1) = {i+2, i+1, i+1, i+3};
Ellipse(j+2) = {i+6, i+4, i+4, i+5};
Line(j+3) = {i+5, i+2};

