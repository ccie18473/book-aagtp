final int MAXCIRCLES = 256;
int x[] = new int[MAXCIRCLES];
int y[] = new int[MAXCIRCLES];
int ncircles = 0;

void setup ()
{
  size (600, 400);
  fill (200, 150, 100);
  for (int i=0; i<MAXCIRCLES; i++)
    x[i] = -1;
  frameRate(1);
}

void draw ()
{
  background (200);

  for (int i=0; i<MAXCIRCLES; i++)
    if (x[i] >= 0)
      ellipse (x[i], y[i], 18, 18);
    else break;
  
  x[ncircles] = int(random(0, width));
  y[ncircles] = int(random(0, height));
  ncircles = (ncircles+1);
  if (ncircles>=MAXCIRCLES)
    ncircles = 0;
}
