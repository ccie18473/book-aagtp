int ex=-70, ey=0, ez=-225, cx=0, cy=0, cz=0;
float dx, dz, angle=74;
PGraphics pg, g2;
PImage back;

void setup ()
{
  size(200, 200, P2D);
  surface.setResizable(true);
  back = loadImage ("window.gif");
  surface.setSize(back.width, back.height);
  pg = createGraphics(back.width, back.height, P3D);
  g2 = createGraphics (back.width, back.height);
  g2.beginDraw(); g2.image(back, 0, 0); g2.endDraw();
}
void draw ()
{
  background (200);
  pg.beginDraw();
  pg.background(0,0,200);
  pg.camera (ex, ey, ez, cx, cy, cz, 0.0, -1.0, 0.0);
  pg.ambientLight (0, 200, 0);
  pg.translate (100, 0, 100); pg.box(20); pg.translate (-100, 0, -100);
  pg.translate (-100, 0, 100); pg.box(20); pg.translate (100, 0, -100);
  pg.translate (100, 0, -100); pg.box(20); pg.translate (-100, 0, 100);
  pg.translate (-100, 0, -100); pg.box(20); pg.translate (100, 0, 100);
  pg.endDraw();
  image(pg, 0, 0); image (g2, 0, 0);
}

void keyPressed ()
{
  if (key == 'w')   // Move 'forward'
  {   ex += 5*dx;   ez += 5*dz;
  }
  else if (key == 's') // Move 'backward'
  {   ex -= 5*dx;   ez -= 5*dz;
  }
  else if (key == 'a')    // Turn left a unit (CCW)
    angle = angle + 1.0;
  else if (key == 'd')    // Turn right a unit (CW)
    angle = angle - 1.0;
  dx = cos(radians(angle)); dz = sin(radians(angle));
  cx = (int)(dx*20000.0); // cx = x coordinate of center point = cos(angle)*20000
  cz = (int)(dz*20000.0); // cz = z coordinate of center point = sin(angle)*20000
}
