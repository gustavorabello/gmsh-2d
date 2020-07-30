
// variables
i=100*t;
j=200*t;

/*
 *              5           2
 *              o --------- o 
 *            /              `,     
 *          6 o o 4       1 o  o 3    
 * */
Point(i+1) = {xc, yc, zc, b1}; // right
Point(i+2) = {xc, yc+r, zc, b1}; // center
Point(i+3) = {xc+r, yc, zc, b1}; // center

Point(i+4) = {xc-body, yc, zc, b1}; // center
Point(i+5) = {xc-body, yc+r, zc, b1}; // center
Point(i+6) = {xc-body-r/2.0, yc, zc, b1}; // center

Ellipse(j+1) = {i+2, i+1, i+1, i+3};
Ellipse(j+2) = {i+6, i+4, i+4, i+5};
Line(j+3) = {i+5, i+2};

// Computing bubble volume 
// sphere (1,2,3) --> V1 = 4/3 * Pi * a * a * a
V1 = (4.0/3.0)*Pi*r*r*r/2.0;

// conical frustum section --> V2 
r1 = r;
r2 = r;
h  = body;
V2 = (1.0/3.0)*Pi*h*(r1*r1 + r1*r2 + r2*r2);

// prolate ellipsoid (4,5,6) --> V3 = 4/3 * Pi * a * b * b
a = (r/2.0+r);
b = r;
V3 = (4.0/3.0)*Pi*a*b*b/2.0;

perimeter = (Pi*r/2)+body+(Pi*Sqrt((r*r+r*r/4)/2))/2;
eqradius = perimeter/Pi;
kappa = eqradius/0.5;

Printf("bubble perimeter = %f [-]",perimeter);
Printf("equivalent radius = %f [-]",eqradius);
Printf("kappa = %f [-]",kappa);
Printf("bubble length = %f [-]",(r+body+r/2.0));
Printf("bubble width = %f [-]",r);
Printf("aspect ratio X = %f [-]",(r+body+r/2.0)/r);
Printf("bubble volume V = %f [-]",(V1+V2+V3));
