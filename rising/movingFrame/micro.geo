

nb = 1;
b1 = 0.04;
wall = 0.04;

D = 1.0;
r = 0.3*D;
body = 1.5*D;
slug = 0.7*r;

For t In {0:nb-1}
 // bubble's coordinates
 xc = 0.0+(slug+body+r+r/2.0)*t;
 yc = 0.0;
 zc = 0.0;

 // include torus.geo file
 Include '../../bubbleShape/taylor.geo';
EndFor

wallLength1 = 4.0*D;
wallLength2 = 0.6+nb*(body+3*r/2.0)+(nb-1)*slug;
wallLength3 = 2.0*D;


/* 
 *              20       
 *              o          Y           
 *              |          ^
 *              |          |
 *              |          |
 *              o           ------> X
 *              17         
 *
 * */

k=10000;
Point(k+1) = {-wallLength1 ,-(D/2.0), 0.0, wall}; // p1
Point(k+2) = {-wallLength1 ,+(D/2.0), 0.0, wall}; // p2

Extrude {wallLength1-0.3, 0, 0} {
  Point{k+01, k+02};
}
Extrude {wallLength2, 0, 0} {
  Point{k+03, k+04};
}
Extrude {wallLength3, 0, 0} {
  Point{k+05, k+06};
}
Line(k+13) = {k+07, k+08};
Line(k+14) = {k+01, k+02};
Physical Line('wallInflowZeroU') = {k+13,7,9,11,12,10,8};
Physical Line('wallOutflow') = {k+14};


j=200*0;
For t In {1:nb}
Physical Line(Sprintf("bubble%g",t)) = {j+6, j+2, j+1, j+5, j+4, j+3};
 j=200*t;
EndFor

Transfinite Line {10, 9} = 110 Using Progression 1;
