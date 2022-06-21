int x0 = -1, y0 = -1;
int x1 = -1, y1 = -1;
boolean ok = false;

void setup ()
{
  size (300, 300);
}
void draw ()
{
  background(200);
  fill (100, 255, 40);
  if (x0 >= 0)
    ellipse (x0, y0, 5, 5);
  if (x1 >= 0)
    ellipse (x1, y1, 5, 5);
  if (ok)
  {
    fill (0);
    text ("Distance is "+distance(x0,y0,x1,y1), 100, 250);
  }
}

float distance (int x0, int y0, int x1, int y1)
{
  float d;
  d = (x0-x1)*(x0-x1) + (y0-y1)*(y0-y1);
  d = sqrt(d);
  return d;
}

void mousePressed ()
{
  if (x0 < 0)
  {
    x0 = mouseX; y0 = mouseY;
  } else if (x1 < 0)
  {
    x1 = mouseX; y1 = mouseY;
    ok = true;
  }
}
