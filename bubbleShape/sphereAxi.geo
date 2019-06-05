
// variables
i=100*t;
j=200*t;

//volume = (4.0/3.0)*pi*r*r*r;
/*
 *              2
 *              o  
 *            /   \     
 *         4 o  o  o 3    
 *              1
 * */
//c = Sqrt(r*r*r/(r+pert));
//Point(i+1) = {xc, yc, 0.0, b1};             // center
//Point(i+2) = {xc, yc+c, 0.0, b1};      // up
//Point(i+3) = {xc+r+pert, yc, 0.0, b1}; // right
//Point(i+4) = {xc-r-pert, yc, 0.0, b1};      // left

c = Sqrt(r*r*r/(r-pert));
Point(i+1) = {xc, yc, 0.0, b1};             // center
Point(i+2) = {xc, yc+c, 0.0, b1};      // up
Point(i+3) = {xc+r-pert, yc, 0.0, b1}; // right
Point(i+4) = {xc-r+pert, yc, 0.0, b1};      // left

Ellipse(j+1) = {i+2, i+1, i+1, i+3};
Ellipse(j+2) = {i+2, i+1, i+1, i+4};

