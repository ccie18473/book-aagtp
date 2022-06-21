int x = -1, y = -1;
int x1 = -1, y1 = -1;
boolean flag = false;

void setup ()
{
  size (600, 400);
  fill (200, 0, 160);
  rectMode (CORNERS);
}

void draw ()
{
  background (200);
  if (flag)
    rect (x, y, mouseX, mouseY);
  else
    rect (x, y, x1, y1);
}

void mousePressed ()
{
  flag = true;
  x = mouseX; y = mouseY;
}

void mouseReleased ()
{
  flag = false;
  x1 = mouseX; y1 = mouseY;
}
