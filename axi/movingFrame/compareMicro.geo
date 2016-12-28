// axisymmetric bubble in microchannel
D = 1.0; // channel diameter
//Mesh.ElementOrder = 2;

/* Case 17: */
l1 = 0.025; // very fine
l2 = 0.05; // fine
l3 = 0.014; // coarse

r = 0.3*D; //0.45*D;
body = 1.88834*D; //0.417042*D;

ll = 3.5*D; // length of the left section
lr = 3.5*D; // length of the right section

/*  Case 18:
l1 = 0.05; // very fine
l2 = 0.08; // fine
l3 = 0.1; // coarse

0.45*D;
body = 1.42685*D;

ll = 0.5*D; // length of the left section
lr = 6.5*D; // length of the right section
*/

/* Defining bubble shape: */
xc = 0.0;
yc = 0.0;

/*
 *              5           2
 *              o --------- o 
 *            /              `,     
 *          6 o o 4       1 o  o 3
 *
 */

Point(1) = {  xc+r+body,   yc, 0.0, l2}; // center
Point(2) = {  xc+r+body, yc+r, 0.0, l1}; // up
Point(3) = {xc+r+body+r,   yc, 0.0, l1}; // right
Point(4) = {       xc+r,   yc, 0.0, l2}; // center
Point(5) = {       xc+r, yc+r, 0.0, l1}; // up
Point(6) = {         xc,   yc, 0.0, l1}; // left

Ellipse(1) = { 2, 1, 1, 3 };
Ellipse(2) = { 6, 4, 4, 5 };
Line(3) = { 5, 2 };

dist = 0.5*r; // distance from the bubble to the left and right sections

k = newp;
/*  k+2              k+4                 k+6               k+8
 *    o----------------o------------------o-----------------o
 *
 *
 *   k+1             k+3  6           3  k+5               k+7
 *    o----------------o--o------------o--o-----------------o
 */

Point(k+1) = {-(ll+dist),   0.0, 0.0, l3};
Point(k+2) = {-(ll+dist), D/2.0, 0.0, l3};

Extrude {ll, 0, 0} {
  Point{k+1, k+2};
}

Point(k+5) = {body+2*r+dist,   0.0, 0.0, l3};
Point(k+6) = {body+2*r+dist, D/2.0, 0.0, l3};

Extrude {lr, 0, 0} {
  Point{k+5, k+6};
}

top = newl; Line(top) = { k+4, k+6 };

bc = newl; Line(bc) = { 1, 4 };
br = newl; Line(br) = { 3, 1 };
bl = newl; Line(bl) = { 4, 6 };
left = newl; Line(left) = { 6, k+3 };
right = newl; Line(right) = { k+5, 3 };


in = newl; Line(in) = {k+1, k+2};
out = newl; Line(out) = {k+8, k+7};

Characteristic Length { k+3, k+4, k+5, k+6 } = l2;

/* Defining boundary conditions: */
Physical Line('wallInflowUParabolic3d') = { in,out };
Physical Line('wallNoSlipPressure') = { 5, top, 7};
Physical Line('wallNormalV') = { -4, -6, bc, br, bl, left, right };  // symmetry bc
Physical Line(Sprintf("bubble%g",1)) = {1, 2, 3};

