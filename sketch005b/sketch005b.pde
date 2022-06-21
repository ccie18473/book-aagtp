int x0=-1, y0=-1;
int x1=-1, y1=-1;

void setup ()
{
  size(300, 300);
}

void draw ()
{
  background (200, 200, 200);
  if (x1 >= 0) line (x0, y0, x1, y1);
  else if (x0 >= 0) line (x0, y0, mouseX, mouseY);
}

void mouseReleased ()
{
  if (x0 < 0)
    {
      x0 = mouseX; y0 = mouseY;
    }
  else if (x1 < 0)
    {
      x1 = mouseX; y1 = mouseY;
    }
  else { x0 = y0 = -1; x1 = y1 = -1; }
}
