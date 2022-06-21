int x0=-1, y0=-1;
int x1=-1, y1=-1;
int x2=-1, y2=-1;
int delta = 1;

void setup ()
{
  size (400, 400);
}

void draw ()
{
  background (200);
  
  if (x2 >= 0)
  {
    triangle (x0, y0, x1, y1, x2, y2);
    y0 = y0 + delta; y1 = y1 + delta; y2 = y2 + delta;
    // delta = delta + 1;
  }
  else if (x1 >= 0)
  {
    line (x0, y0, x1, y1);
    line (x1, y1, mouseX, mouseY);
  } else if (x0 > 0) line (x0, y0, mouseX, mouseY);
}

void mouseReleased ()
{
  if (x0 < 0) { x0 = mouseX; y0 = mouseY; }
  else if (x1 < 0) { x1 = mouseX; y1 = mouseY; }
  else if (x2 < 0)
  {
    x2 = mouseX; y2 = mouseY;
  } else
  {
    x0 = y0 = -1;
    x1 = y1 = -1;
    x2 = y2 = -1;
    // delta = 1;
  }
}
