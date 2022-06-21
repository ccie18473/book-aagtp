float eyex = 35, eyey = 10, eyez = -300.0;
float cx = 200.0, cy = 5.0, cz = 100.0;
float dx = 0.0, dz = 1.0;
float angle = 90.0;

void setup ()
{
  size(400, 300, P3D);
  keyPressed ();
}

void draw ()
{
  background (60);
  camera (eyex, eyey, eyez, cx, cy, cz, 0.0, -1.0, 0.0);
  spotLight(255,255,20, eyex, eyey, eyez,cx, cy, cz,PI/4, 300);
// spotLight(255,255,20, eyex+3*dz, eyey, eyez+3*dx, cx, cy, cz, PI/4, 300);
  fill (255,255,255); box (20);
  fill (255,0,0); translate (200, 0, 300); box(20);
  fill (0,255,255); translate (-50, 0, -400); box(20);
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
    angle = angle + 1.0;
  else if (key == 'd')   // Turn right a unit (CW)
    angle = angle - 1.0;
  if (angle < 0) angle = angle + 360.0;
  else if (angle > 360.0) angle = angle - 360.0;
  dx = cos(radians(angle)); dz = sin(radians(angle));
  cx = (int)(dx*20000.0); // cx = x coordinate of center point = cos(angle)*20000
  cz = (int)(dz*20000.0); // cz = z coordinate of center point = sin(angle)*20000
}
