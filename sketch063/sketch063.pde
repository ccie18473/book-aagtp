int x=100, y=100, z=100;             // Sphere position
int eyex=100, eyey=100, eyez=400;    // Viewpoint
int cx=100, cy=100, cz=100;          // Point we are looking at
PShape globe;
PImage timg;
float theta=270, dx=0, dz=0;

void setup ()
{
  size (400, 400, P3D);
  frameRate(10);
  timg = loadImage("globe03.jpg");
  globe = createShape(SPHERE, 100);
  globe.setStroke(255);
  globe.setTexture(timg);
}

void draw ()
{
  background (45, 45, 120);
  camera(eyex, eyey, eyez, cx, cy, cz, 0, 1, 0);
  translate (x, y, z);
  globe.rotateY(radians(0.5));
  shape(globe);
}

void keyPressed ()
{
  if (key == 'w')           // Move 'forward'
  {  eyex += 5*dx;   eyez += 5*dz; }
  else if (key == 's')      // Move 'backward'
  {  eyex -= 5*dx;   eyez -= 5*dz; }
  else if (key == 'a')      // Turn left a unit (CCW)
    theta = theta + 1.0;
  else if (key == 'd')      // Turn right a unit (CW)
    theta = theta - 1.0;
  dx = cos(radians(theta)); dz = sin(radians(theta));
  cx = (int)(dx*20000.0);
  cz = (int)(dz*20000.0);
}
