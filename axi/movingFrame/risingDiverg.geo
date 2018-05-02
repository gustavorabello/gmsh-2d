// axisymmetric bubble in divergent channel
wall = 0.06; 
b1 = 0.03; 
nb = 1; 
 
D = 1.0; 

// solution
Case = 1; // DW or DW50
//Case = 2; // SO
//Case = 3; // HDMSO

// bubble shape
//BubbleShape = 1; // straight bubble
BubbleShape = 2; // inclined bubble

//non-dimensional sections
L1 = 10*D; 
//L2 = 128.87*D; 
L2 = 10*D; 

// Degassed water and DW50
If( Case == 1 )
 Printf("Degassed water or DW50");
 Printf("Target Volume: 3.51E-8 < v < 3.55E-8");
 r = 0.36*D; 
 X = 6.438;  Li = 35.78e-03; 
 //X = 6.4461; Li = 40.165e-03;
 //X = 6.30;   Li = 39.38e-03; 
 //X = 6.249;  Li = 37.07e-03; 
 //X = 6.358;  Li = 37.174e-03;
EndIf

// Silicon oil
If( Case == 2 )
 Printf("Silicon oil");
 Printf("Target Volume: 2.65E-8 < v < 5.89E-8");
 //r = 0.541*D; V = 2.65e-8; // volume [m^3]
 r = 0.6*D; 
 //X = 3.075;Li = 26.142e-03;
 //X = 2.1957;Li = 29.759e-03;
 X = 2.83023;Li = 42.2645e-03;
 //X = 3.72;Li = 25.4005e-03;
 //X = 3.60;Li = 27.89e-03;
EndIf

// water
If( Case == 3 )
 Printf("Water");
 Printf("Target Volume: 5.65E-8 < v < 6.00E-8");
 r = 0.2*D;
 //X = 5.01;  Li = 26.375e-03;
 //X = 3.965; Li = 35.1155e-03;
 //X = 2.94;  Li = 41.6655e-03;
 X = 6.871; Li = 22.1135e-03;
EndIf

/* bubble width  = r;
 * bubble length = tail + body + nose
 *               =  D/2 + body + 3*D/4
 * X = aspect ratio (bubble length/bubble width)
 *   = lb / r
 * Li = initial nose position
 */
Do = 0.00214; // reference diamenter (small)
Df = 0.0214;  // larger diameter
body = (2.0*r*X-2.0*r)/(1-2*X*4.5*D/128.87);

// initial bubble nose coordiante 
xc = Li/Do;
yc = 0.0;
zc = 0.0;

// Computing bubble volume 
// prolate ellipsoid --> V1 = 4/3 * Pi * a * b * b
a = r/2.0;
b = r;
V1 = (4.0/3.0)*Pi*a*b*b/2.0;

// conical frustum section --> V2 
r1 = r + (body*4.5*D/128.87);
r2 = r;
h  = body;
V2 = (1.0/3.0)*Pi*h*(r1*r1 + r1*r2 + r2*r2);

// prolate ellipsoid --> V3 = 4/3 * Pi * a * b * b
a = (r/2.0+r);
b = r + (body*4.5*D/128.87);
V3 = (4.0/3.0)*Pi*a*b*b/2.0;

Printf("Li = %f mm",Li*1000);
Printf("bubble length = %f (%f mm) ",(r/2.0+r+body+r/2.0),(r/2.0+r+body+r/2.0)*Do*1e3);
Printf("bubble width = %f (%f mm)",2.0*(r+(body*4.5*D/128.87)),2.0*(r+(body*4.5*D/128.87))*Do*1e3);
Printf("aspect ratio X = %f",(r/2.0+r+body+r/2.0)/(2.0*(r+(body*4.5*D/128.87))));
Printf("bubble volume V = %fE-8 m^3",(V1+V2+V3)*Do*Do*Do*1e8);

/*
 *              5           2
 *              o --------- o 
 *            /              `,     
 *          6 o o 4       1 o  o 3    
 *
 * */

i=0;

// inclined bubble
If( BubbleShape == 2 )
 Point(i+1) = {xc-(r/2.0+r), yc, zc, b1}; // center
 Point(i+2) = {xc-(r/2.0+r), yc + r + (body*4.5*D/128.87), zc, b1}; // up
 Point(i+3) = {xc, yc, zc, b1}; // right
 Point(i+4) = {xc-(r/2.0+r+body), yc, zc, b1}; // center
 Point(i+5) = {xc-(r/2.0+r+body), yc+r, zc, b1}; // up
 Point(i+6) = {xc-(r/2.0+r+body+r/2.0), yc, zc, b1}; // right
EndIf

// straight bubble
If( BubbleShape == 1 )
 Point(i+1) = {xc-(r), yc, zc, b1}; // center
 Point(i+2) = {xc-(r), yc + r , zc, b1}; // up
 Point(i+3) = {xc, yc, zc, b1}; // right
 Point(i+4) = {xc-(r+body), yc, zc, b1}; // center
 Point(i+5) = {xc-(r+body), yc+r, zc, b1}; // up
 Point(i+6) = {xc-(r+body+r), yc, zc, b1}; // right
EndIf

j=0;
Ellipse(j+1) = {i+2, i+1, i+1, i+3};
Ellipse(j+2) = {i+6, i+4, i+4, i+5};
Line(j+3) = {i+5, i+2};

k = newp;
/*  
 *                                                         k+4
 *                                                   ____ --o
 *   k+2                                  k+3 ___ ^^              
 *    o-----------------------------------o--
 *                       5           2
 *                        o         o
 *   k+1              6    3       1    3                  k+5
 *    o----------------o--o---------o--o--------------------o
 *
 *         L1 = 10*D                         L2 = 128.87*D
 *    |----------------|                  |-----------------| 
 */

Point(k+1) = {5.0,                         0.0, 0.0, wall};
Point(k+2) = {5.0,                       D/2.0, 0.0, wall};
Point(k+3) = {L1,                        D/2.0, 0.0, wall};
Point(k+4) = {L1+L2, D/2.0 + (L2*4.5*D/128.87), 0.0, wall};
Point(k+5) = {L1+L2,                       0.0, 0.0, wall};

sym1 = newl; Line(sym1) = {6, k+1};
sym2 = newl; Line(sym2) = {4, 6};
sym3 = newl; Line(sym3) = {1, 4};
sym4 = newl; Line(sym4) = {3, 1};
sym5 = newl; Line(sym5) = {k+5, 3};
w1   = newl; Line(w1) = {k+3, k+4};
w2   = newl; Line(w2) = {k+2, k+3};
in   = newl; Line(in) = {k+1,k+2};
out  = newl; Line(out) = {k+4,k+5};

// Defining boundary conditions:
Physical Line('wallOutflow') = { in };
Physical Line('wallInflowZeroU') = { out };
Physical Line('wallMovingY') = { w1, w2 };
Physical Line('wallNormalV') = { sym1,sym2,sym3,sym4,sym5 };  // symmetry bc
Physical Line(Sprintf("bubble%g",1)) = {1, 2, 3};

