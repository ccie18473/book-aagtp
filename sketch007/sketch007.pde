int N = 10;
int x0[] = new int[N];
int y0[] = new int[N];
int x1[] = new int[N];
int y1[] = new int[N];
int n = 0;
boolean down = false; // A boolean variable can only be true or false

void setup ()
{
  size(500, 500);
}

void draw ()
{
  background (200, 200, 200);
  for (int i=0; i<n; i++)
  {
    line (x0[i], y0[i], 
      x1[i], y1[i]);
  }
  if (down) line (x0[n], y0[n], mouseX, mouseY);
}

void mousePressed()
{
  down = true;
  if (n<N)
  {
    x0[n] = mouseX;
    y0[n] = mouseY;
  }
}

void mouseReleased ()
{
  if (n<N-1)
  {
    x1[n] = mouseX;
    y1[n] = mouseY;
    n = n + 1;
  }
  down = false;
}

void keyPressed ()
{
  if (key==BACKSPACE && n>0)
    n = n - 1;
}
