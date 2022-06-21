int x=100, y=100, z=100;              // Sphere position
int dx=2, dy=3, dz=4;                 // Velocity of the sphere
int eyex= 100, eyey=100, eyez=400;    // Viewpoint
int cx=100, cy=100, cz=100;           // Point we are looking at

void setup() { size (400, 400, P3D); }

void mycube ()
{
  stroke (255, 0, 0); line (0, 0, 0, 0, 0, 200); // Z axis is red
  stroke(0, 0, 255); line (0, 200, 0, 0, 0, 0);  // Y axis is blue
  stroke(0, 255, 0); line (0, 0, 0, 200, 0, 0);  // X axis is green
  stroke (255);                                  // All other edges are white
  line (0, 0, 200, 0, 200, 200);
  line (0, 200, 200, 0, 200, 0);
  line (0, 200, 0, 200, 200, 0);
  line (0, 200, 200, 200, 200, 200);
  line (0, 0, 200, 200, 0, 200);
  line (200, 0, 0, 200, 0, 200);
  line (200, 0, 200, 200, 200, 200);
  line (200, 200, 200, 200, 200, 0);
  line (200, 200, 0, 200, 0, 0);
  noStroke();
}

void moveSphere ()
{      // Move the sphere position one frame
  x = x + dx; y = y + dy; z = z + dz;
  if (x<=6 || x>=194) dx = -dx;
  if (y<=6 || y>=194) dy = -dy;
  if (z<=6 || z>=194) dz = -dz;
}

void draw ()
{
  background (45, 45, 120);
  camera(eyex, eyey, eyez, cx, cy, cz, 0, 1, 0);
  mycube();
  lights();
  noStroke();
  translate (x, y, z);
  sphere (12);
  moveSphere();
}
