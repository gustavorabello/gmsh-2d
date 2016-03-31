/* upper half of a symmetric channel */
//Mesh.ElementOrder = 2;
wall = 0.05;

D = 1.0; // channel height
wallLength = 3.0; // channel length

Point(1) = {-wallLength/2.0, D/2.0, 0.0, wall};
Point(2) = { wallLength/2.0, D/2.0, 0.0, wall};
Point(3) = {-wallLength/2.0,   0.0, 0.0, wall};
Point(4) = { wallLength/2.0,   0.0, 0.0, wall};

l = newl;
// inlet:
Line(l) = {1, 3};
Physical Line('wallInflowU') = {l};

// symmetry line:
Line(l+1) = {3, 4};
Physical Line('wallNormalV') = {l+1};

// outlet:
Line(l+2) = {4, 2};
Physical Line('wallOutflow') = {l+2};

// upper wall:
Line(l+3) = {2, 1};
Physical Line('wallNoSlip') = {l+3};

//Transfinite Line {1, 3} = 100 Using Progression 1;
//Transfinite Line {4, 2} = 20 Using Progression 1;
