/* square cavity */
wall = 0.025;

Point(1) = { 0.0, 1.0, 0.0, wall};
Point(2) = { 1.0, 1.0, 0.0, wall};
Point(3) = { 0.0, 0.0, 0.0, wall};
Point(4) = { 1.0, 0.0, 0.0, wall};

l = newl;
Line(l) = {1, 3};

b = newl;
Line(b) = {3, 4};

r = newl;
Line(r) = {4, 2};

t = newl;
Line(t) = {2, 1};

Physical Line('wallNoSlipTl') = {l};
Physical Line('wallNoSlipTr') = {r};
Physical Line('wallNoSlip') = {b, t};