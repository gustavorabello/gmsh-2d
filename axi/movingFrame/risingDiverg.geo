// axisymmetric bubble in divergent channel
wall = 0.04; 
b1 = 0.02; 
nb = 1; 
 
D = 1.0; 

// solution
//Case = 1; // DW
Case = 2; // DW50
//Case = 3; // SO2
//Case = 4; // HDMSO

// bubble shape
BubbleShape = 1; // straight bubble
//BubbleShape = 2; // inclined bubble

/* bubble width  = r;
 * bubble length = tail + body + nose
 *               =  D/2 + body + 3*D/4
 * X = aspect ratio (bubble length/bubble width)
 *   = lb / r
 */
Do = 0.00214; // reference diamenter (small)
Df = 0.0214;  // larger diameter

// Degassed water and DW50
If( Case == 1 )
 Printf("Degassed water - DW");
 Printf("Target Volume: 3.48E-8 < v[m^3] < 3.55E-8");
 Printf("Target non-dim Volume: 3.550895 < v[-] < 3.622322");
 //non-dimensional sections
 If( BubbleShape == 1 ) // straight bubble
  V = 8.00; r = 0.38*D; 
  body = (V - (2.0/3.0)*Pi*r*r*r - (2.0/3.0)*Pi*(r/2)*r*r)/(Pi*r*r);
  L1 = 32*D; 
  L2 = 14*D; 
 EndIf
 If( BubbleShape == 2 ) // inclined bubble
  // body computed at python/misc/radius.py
  //V = 3.60; r = 0.4*D; body = 4.25215763664974; 
  //V = 3.60; r = 0.5*D; body = 2.85235015254463; 
  ///////V = 3.60; r = 0.4*D; body = 9.85235015254463; 
  V = 3.60; r = 0.32*D; body = 13.0;
  //V = 3.60; r = 0.32*D; body = 15.0;
  //V = 3.60; r = 0.27*D; body = 17.0;
  //V = 3.60; r = 0.27*D; body = 22.0;
  //V = 3.60; r = 0.27*D; body = 26.0;
  //V = 3.60; r = 0.6*D; body = 1.80873330649893; 
  //V = 3.60; r = 0.7*D; body = 1.02146475145782; 
  L1 = 12*D; 
  L2 = 22*D; 
 EndIf

 // channel start x coordinate
 chxinit = 0.0;
EndIf

If( Case == 2 )
 Printf("Degassed water + 50% Glycerol - DW50");
 Printf("Target Volume: 18.0E-8 < v[m^3] < 21.0E-8");
 Printf("Target non-dim Volume: 18.36670 < v[-] < 21.42781");
 //non-dimensional sections
 If( BubbleShape == 1 ) // straight bubble
  V = 8.00; r = 0.38*D; 
  body = (V - (2.0/3.0)*Pi*r*r*r - (2.0/3.0)*Pi*(r/2)*r*r)/(Pi*r*r);
  L1 = 32*D; 
  L2 = 14*D; 
 EndIf
 If( BubbleShape == 2 ) // inclined bubble
  // body computed at python/misc/radius.py
  //V = 3.60; r = 0.4*D; body = 4.25215763664974; 
  //V = 3.60; r = 0.5*D; body = 2.85235015254463; 
  ///////V = 3.60; r = 0.4*D; body = 9.85235015254463; 
  V = 3.60; r = 0.32*D; body = 13.0;
  //V = 3.60; r = 0.32*D; body = 15.0;
  //V = 3.60; r = 0.27*D; body = 17.0;
  //V = 3.60; r = 0.27*D; body = 22.0;
  //V = 3.60; r = 0.27*D; body = 26.0;
  //V = 3.60; r = 0.6*D; body = 1.80873330649893; 
  //V = 3.60; r = 0.7*D; body = 1.02146475145782; 
  L1 = 12*D; 
  L2 = 22*D; 
 EndIf

 // channel start x coordinate
 chxinit = 0.0;
EndIf

// Silicon oil
If( Case == 3 )
 Printf("Silicon oil - SO2");
 Printf("Target Volume: 2.65E-8 < v[m^3] < 5.86E-8");
 Printf("Target non-dim Volume: 2.70398 < v[-] < 5.979381");
 //non-dimensional sections
 If( BubbleShape == 1 ) // straight bubble
  V = 2.704; r = 0.42*D; 
  body = (V - (2.0/3.0)*Pi*r*r*r - (2.0/3.0)*Pi*(r/2)*r*r)/(Pi*r*r);
  L1 = 14*D; 
  L2 = 6*D; 
 EndIf
 If( BubbleShape == 2 ) // inclined bubble
  // body computed at python/misc/radius.py
  //V = 2.70;  r = 0.6*D; body = 1.18868094788726; 
  //V = 2.80;  r = 0.4*D; body = 3.41727570637340; 
  //V = 2.80;  r = 0.5*D; body = 2.16922559625744; 
  //V = 2.80;  r = 0.6*D; body = 1.25956894708787; 
  //V = 3.20;  r = 0.4*D; body = 3.84573429307197; 
  //V = 3.20;  r = 0.5*D; body = 2.51746297136823; 
  //V = 3.20;  r = 0.6*D; body = 1.53801995792008; 
  //V = 3.80;  r = 0.4*D; body = 4.44794845734970; 
  //V = 3.80;  r = 0.5*D; body = 3.01517264217419; 
  //V = 3.80;  r = 0.6*D; body = 1.94135185741150; 
  V = 4.20;  r = 0.4*D; body = 4.82610297083092; 
  //V = 4.20;  r = 0.5*D; body = 3.33225113142393; 
  //V = 4.20;  r = 0.6*D; body = 2.20140987855224; 
  //V = 4.30;  r = 0.5*D; body = 3.40982529698491; 
  //V = 4.70;  r = 0.4*D; body = 5.27607324259425; 
  //V = 4.70;  r = 0.5*D; body = 3.71375761506869; 
  //V = 4.70;  r = 0.6*D; body = 2.51732719800371; 
  //V = 5.20;  r = 0.4*D; body = 5.70371618797107; 
  //V = 5.20;  r = 0.5*D; body = 4.08028321728716; 
  //V = 5.20;  r = 0.6*D; body = 2.82378259460910; 
  //V = 5.80;  r = 0.4*D; body = 6.19101511272663; 
  //V = 5.80;  r = 0.5*D; body = 4.50228160672880; 
  //V = 5.80;  r = 0.6*D; body = 3.17998905828141; 
  //V = 6.00; r = 0.4*D; body = 6.34777253384599; 
  //V = 6.00; r = 0.5*D; body = 4.63895819417649; 
  //V = 6.00; r = 0.6*D; body = 3.29609529786310; 
  L1 = 7*D; 
  L2 = 14*D; 
 EndIf

 // channel start x coordinate
 chxinit = 0.0;
EndIf

// water
If( Case == 4 )
 Printf("Water - HMDSO/HO");
 Printf("Target Volume: 1.21E-8 < v[m^3] < 8.78E-8");
 Printf("Target non-dim Volume: 1.2346 < v[-] < 8.958869");
 //non-dimensional sections
 If( BubbleShape == 1 ) // straight bubble
  V = 5.90; r = 0.4*D; 
  body = (V - (2.0/3.0)*Pi*r*r*r - (2.0/3.0)*Pi*(r/2)*r*r)/(Pi*r*r);
  L1 = 17*D; 
  L2 = 4*D; 
 EndIf
 If( BubbleShape == 2 ) // inclined bubble
  // body computed at python/misc/radius.py
  V = 5.85;  r = 0.3*D; body = 8.33529358473641;
  //V = 5.85;  r = 0.4*D; body = 6.23045793998997;
  //V = 5.85;  r = 0.5*D; body = 4.53663058862460;
  //V = 5.85;  r = 0.6*D; body = 3.20913517111535;
  //V = 5.90;  r = 0.4*D; body = 6.26973057483005; 
  //V = 5.90;  r = 0.5*D; body = 4.57085898087579; 
  //V = 5.90;  r = 0.6*D; body = 3.23820121780851; 
  //V = 6.05;  r = 0.4*D; body = 6.38654541431208; 
  L1 = 7*D; 
  L2 = 15*D; 
 EndIf

 // channel start x coordinate
 chxinit = 0.0;
EndIf

// initial bubble nose coordiante 
xc = 0.8*(L1+L2);
yc = 0.0;
zc = 0.0;

// straight bubble
If( BubbleShape == 1 )
 // conical frustum section --> V2 
 r1 = r;
 r2 = r;
EndIf

// inclined bubble
If( BubbleShape == 2 )
 // conical frustum section --> V2 
 // body defined earlier // computed at python/misc/radius.py
 r1 = 2*r;
 r2 = r + (body*4.5*D/128.87);
EndIf

// Computing bubble volume 
// prolate ellipsoid --> V1 = 4/3 * Pi * a * b * b
a = r/2.0;
b = r;
V1 = (4.0/3.0)*Pi*a*b*b/2.0;

// conical frustum section --> V2 
// if r1=r2 -> straight bubble
// if r1!=r2 -> inclined bubble
h  = body;
V2 = (1.0/3.0)*Pi*h*(r*r + r*r2 + r2*r2);

// prolate ellipsoid --> V3 = 4/3 * Pi * a * b * b
a = r1;
b = r2;
V3 = (4.0/3.0)*Pi*a*b*b/2.0;

/*
 *              5           2
 *      --      o --------- o       --
 *      r     /              `,     r2 (computed)
 *      --  6 o o 4       1 o  o 3  --  
 *            | |---body----|r1|
 *            r/2
 * */

i=0;

// inclined bubble
If( BubbleShape == 2 )
 Point(i+1) = {xc-(r1), yc, zc, b1}; // center
 Point(i+2) = {xc-(r1), yc + r + (body*4.5*D/128.87), zc, b1}; // up
 Point(i+3) = {xc, yc, zc, b1}; // right
 Point(i+4) = {xc-(r1+body), yc, zc, b1}; // center
 Point(i+5) = {xc-(r1+body), yc+r, zc, b1}; // up
 Point(i+6) = {xc-(r1+body+r/2), yc, zc, b1}; // right
EndIf

// straight bubble
If( BubbleShape == 1 )
 Point(i+1) = {xc-(r1), yc, zc, b1}; // center
 Point(i+2) = {xc-(r1), yc + r , zc, b1}; // up
 Point(i+3) = {xc, yc, zc, b1}; // right
 Point(i+4) = {xc-(r1+body), yc, zc, b1}; // center
 Point(i+5) = {xc-(r1+body), yc+r, zc, b1}; // up
 Point(i+6) = {xc-(r1+body+r/2), yc, zc, b1}; // right
EndIf


If( BubbleShape == 2 )
 Printf("bubble length = %f (%f mm) ",(xc-(xc-(r/2.0+r+body+r/2.0))),
                                      (xc-(xc-(r/2.0+r+body+r/2.0)))*Do*1e3);
 Printf("bubble width = %f (%f mm)",(yc + 2*(r + (body*4.5*D/128.87))),
                                    (yc + 2*(r + (body*4.5*D/128.87)))*Do*1e3);
 Printf("aspect ratio X = %f",(xc-(xc-(r+body+r)))/(yc+2*(r+(body*4.5*D/128.87))));
EndIf

// straight bubble
If( BubbleShape == 1 )
 Printf("bubble length = %f (%f mm) ",(xc-(xc-(r+body+r))),
                                      (xc-(xc-(r+body+r)))*Do*1e3);
 Printf("bubble width = %f (%f mm)",(2*r),
                                    (2*r)*Do*1e3);
 Printf("aspect ratio X = %f",(xc-(xc-(r+body+r)))/(2*r));
EndIf
Printf("dim bubble volume V = %fE-8 m^3",(V1+V2+V3)*Do*Do*Do*1e8);
Printf("non-dim bubble volume V = %f",(V1+V2+V3));


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

Point(k+1) = {chxinit,                     0.0, 0.0, wall};
Point(k+2) = {chxinit,                   D/2.0, 0.0, wall};
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
Physical Line('wallMovingYDiverg') = { w1, w2};
Physical Line('wallNormalV') = { sym1,sym2,sym3,sym4,sym5 };  // symmetry bc
Physical Line(Sprintf("bubble%g",1)) = {1, 2, 3};

