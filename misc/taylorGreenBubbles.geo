

L = 2*Pi;

nb = 4;
b1 = 0.04;
wall = 0.04;

D = 1.0;
r = 0.5*D;
body = 1.0*D;
slug = 0.7*r;
pert = (0.0/100)*r;

// 1st bubble's coordinates
t = 0;
xc = L/4.0+D;
yc = L/4.0+D;
Include '../bubbleShape/circle.geo';

// 2nd bubble's coordinates
t = 1;
xc = L-L/4.0-D;
yc = L/4.0+D;
Include '../bubbleShape/circle.geo';

// 3rd bubble's coordinates
t = 2;
xc = L/4.0+D;
yc = L-L/4.0-D;
Include '../bubbleShape/circle.geo';

// 4th bubble's coordinates
t = 3;
xc = L-L/4.0-D;
yc = L-L/4.0-D;
Include '../bubbleShape/circle.geo';

k=10000;

/* 
 *              3               2
 *              o ------------- o    Y           
 *              |               |    ^
 *          L   |               |    |
 *              |               |    |
 *              o ------------- o     ------> X
 *              0     2*Pi*L    1
 *
 * */

Point(k+6) = {0.0, 0.0, 0.0,  wall}; // p0
Point(k+7) = {L,   0.0, 0.0,  wall}; // p1
Point(k+8) = {L,L, 0.0,  wall}; // p2
Point(k+9) = {0.0,   L, 0.0,  wall}; // p3

Line(k+5) = {k+9, k+8};
Line(k+6) = {k+8, k+7};
Line(k+7) = {k+7, k+6};
Line(k+8) = {k+6, k+9};

Physical Line('wallNormalU') = {k+6, k+8};
Physical Line('wallNormalV') = {k+5, k+7};

j=200*0;
For t In {1:nb}
Physical Line(Sprintf("bubble%g",t)) = {j+1, j+2, j+3, j+4};
 j=200*t;
EndFor
