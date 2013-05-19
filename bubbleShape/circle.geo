// Gmsh project created on Fri Feb  6 14:28:22 2009

// variables
i=100*t;
j=200*t;

/*
 *              2
 *              o  
 *            /   \     
 *         4 o  o  o 5    
 *            \ 1 /
 *              o  
 *              3
 *
 * */
Point(i+1) = {xc, yc, 0,b1}; // center
Point(i+2) = {xc, yc+r-pert, 0,b1}; // up
Point(i+3) = {xc, yc-r+pert, 0,b1}; // down
Point(i+4) = {xc-r-pert, yc, 0,b1}; // left
Point(i+5) = {xc+r+pert, yc, 0,b1}; // right
Ellipse(j+1) = {i+2, i+1, i+1, i+5};
Ellipse(j+2) = {i+5, i+1, i+1, i+3};
Ellipse(j+3) = {i+3, i+1, i+1, i+4};
Ellipse(j+4) = {i+4, i+1, i+1, i+2};

