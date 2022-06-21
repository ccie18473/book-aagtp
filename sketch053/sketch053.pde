int x=100, y=100, z=100;      // Sphere position
int ex=100, ey=100, ez=147;   // Viewpoint
int cx=100, cy=100, cz=100;   // Point we are looking at
int code = 0;

void setup()
{
  size (500, 400, P3D);
}

void draw ()
{
  background (200, 200, 200);
  camera(ex, ey, ez, cx, cy, cz, 0, 1, 0);
  if (code == 0)
    lights();
  else if (code == 1)
    ambientLight (0, 200, 200, 0, 1000, 0);
  else if (code == 2)
    directionalLight (200, 0, 200, 0, 1000, 0);
  else if (code == 3)
    pointLight (200, 200, 0, 0, -1000, 0);
  else if (code == 4)
    spotLight (0, 200, 0, -300, 100, 100, 100, 0, 0, PI/16, 1000);
  
  else if (code == 5) // All three!
  {
    directionalLight (200, 0, 200, 0, 1000, 0);
    pointLight (200, 200, 0, 0, -1000, 0);
    spotLight (0, 200, 0, -300, 100, 100, 100, 0, 0, PI/16, 1000);
  }
  translate (x, y, z);
  sphere (12);
}

void keyPressed ()
{
  if (key == '0') code = 0;
  if (key == '1') code = 1;
  if (key == '2') code = 2;
  if (key == '3') code = 3;
  if (key == '4') code = 4;
  if (key == '5') code = 5;
}
