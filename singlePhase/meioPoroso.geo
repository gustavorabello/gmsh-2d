
lc = 0.05; // parede
le = 0.02; // elipse
//+
Point(1) = {0, 0, 0, lc};
Point(2) = {4.0, 0, 0, lc};
Point(3) = {4.0, 1, 0, lc};
Point(4) = {0, 1, 0, lc};
//+
Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3, 4};
Line(4) = {4, 1};
//+
Curve Loop(1) = {3, 4, 1, 2};

xc = 0.8; // x centro da 1a. elipse
yc = 0.1; // y centro da 1a. elipse
rh = 0.02; // raio horizontal
rv = 0.02; // raio vertical
kh = 0.1; // permeabilidade horizontal
kv = 0.1; // permeabilidade vertical
nh = 20; // total de obstaculos horizontais
nv = 9; // total de obstaculos horizontais

// elipses horizontais (nh) e verticais (nv)
n=5; // iterador
count=0;counte=0;countl=2;
For v In {0:nv-1}
 For h In {0:nh-1}
  //+
  Point(5+count) = {   xc+kh*(h),    yc+kv*(v), 0, le};
  Point(6+count) = {xc+rh+kh*(h),    yc+kv*(v), 0, le};
  Point(7+count) = {   xc+kh*(h), yc+rv+kv*(v), 0, le};
  Point(8+count) = {xc-rh+kh*(h),    yc+kv*(v), 0, le};
  Point(9+count) = {   xc+kh*(h), yc-rv+kv*(v), 0, le};

  //+
  Ellipse(5+(counte)) = {7+count, 5+count, 5+count, 6+count};
  Ellipse(6+(counte)) = {6+count, 5+count, 5+count, 9+count};
  Ellipse(7+(counte)) = {9+count, 5+count, 5+count, 8+count};
  Ellipse(8+(counte)) = {8+count, 5+count, 5+count, 7+count};

  Curve Loop(countl) = {8+counte, 5+counte, 6+counte, 7+counte};
  count+=5;counte+=4;countl+=1;
 EndFor
EndFor

Plane Surface(1) = {1:nh*nv+1};

//+
Physical Line("inferior", 57) = {1};
Physical Line("superior", 58) = {3};
Physical Line("esquerda", 59) = {4};
Physical Line("direita", 60) = {2};
Physical Line("obstaculo", 62) = {5:nv*nh*4+4};
//+
Physical Surface("surface") = {1};
