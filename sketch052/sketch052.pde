int x=100, y=100, z=100;    // Sphere position
int ex=100, ey=100, ez=400; // Viewpoint
int cx=100, cy=100, cz=100; // Point we are looking at

void setup ()
{
  size (500, 400, P3D);
}

void draw ()
{
  background (200, 200, 200);
  camera(ex, ey, ez, cx, cy, cz, 0, 1, 0);
  noStroke();
  lights();
  translate (x, y, z);
  sphere (12);
  translate (20, 0, 0);
  box (12);
  translate (-x-20, -y, -z);
}

void keyPressed ()
{
  if (key == 'w') ez = ez - 10;
  if (key == 's') ez = ez + 10;
  if (key == 'a') ex = ex - 10;
  if (key == 'd') ex = ex + 10;
  if (keyCode == UP) cy = cy + 10;
  if (keyCode == DOWN) cy = cy - 10;
}
