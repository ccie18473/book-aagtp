int eyex=30, eyey=0, eyez=60;
int cx=20000, cy=15, cz=20000;
float angle = 0.0;
float dx = 1.0, dz = 1.0, sx, sy, sz;

void setup ()
{
  size (500, 400, P3D);
  fill (200,0,0);
  keyPressed(); // Initialize the viewpoint
}

void draw ()
{
  background (200, 255, 0);
  camera(eyex, eyey, eyez, cx, cy, cz, 0, 1, 0);
  for (int i=0; i<9; i++) // Draw nine boxes (30,0,30) apart
  {
    translate (30, 0, 30);
    box (20);
  }
}

void keyPressed ()
{
  if (key == 'w')        // Move 'forward'
  {
    eyex += 5*dx; eyez += 5*dz;
  }
  else if (key == 's')   // Move 'backward'
  {
    eyex -= 5*dx; eyez -= 5*dz;
  }
  else if (key == 'a')   // Turn left a unit (CCW)
    angle = angle - 1.0;
  else if (key == 'd')   // Turn right a unit (CW)
    angle = angle + 1.0;
  if (angle < 0) angle = angle + 360.0;
  else if (angle > 360.0) angle = angle - 360.0;
  dx = cos(radians(angle)); dz = sin(radians(angle));
  cx = (int)(dx*20000.0); // cx = x coordinate of center point
  cz = (int)(dz*20000.0); // cz = z coordinate of center point
}
