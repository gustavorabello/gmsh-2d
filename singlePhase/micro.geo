

wall = 0.06;

D = 1.0;
r = 0.35*D;

wallLength1 = 1.5*D;
wallLength2 = 3.0*D;
wallLength3 = 5.5*D;


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

//+
Physical Line("wallNoSlip") = {6, 10013, 5, 3, 1, 10014, 2, 4};
