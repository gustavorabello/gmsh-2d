/* square cavity */
xc = 0.75;
r  = 0.1;
pertx = 0.0;
perty = 0.0;
wall = 0.025;

Point(1) = { 0.0, 0.5, 0.0, wall};
Point(2) = { 1.5, 0.5, 0.0, wall};
Point(3) = { 0.0, 0.0, 0.0, wall};
Point(4) = { 1.5, 0.0, 0.0, wall};

Point(5) = {xc, 0, 0, wall};
Point(6) = {xc-r-perty, 0, 0,wall};
Point(7) = {xc+r+perty, 0, 0,wall};
Point(8) = {xc, r+pertx, 0, wall};

l = newl;
Line(l) = {1, 3};

bl = newl; //bottom left
Line(bl) = {3, 6};
br = newl; //bottom right
Line(br) = {7, 4};
ber = newl; //bottom ellipse right
Ellipse(ber) = {8, 5, 5, 7};
bel = newl; //bottom ellipse left
Ellipse(bel) = {8, 5, 5, 6};

r = newl;
Line(r) = {4, 2};

t = newl;
Line(t) = {2, 1};

Physical Line('wallNoSlipAxi') = {t};
Physical Line('wallNormalV') = {bl,br};
Physical Line('wallNoSlip') = {-bel,ber};
Physical Line('wallInflowUAxi') = {l};
Physical Line('wallOutflow') = {r};

