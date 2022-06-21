PImage back;
float x[][] = new float [40][600];
float y[][] = new float [40][600];
int n[] = new int [40], m=0, count=0;
void setup ()
{
  size(100,100);
  surface.setResizable(true);
  back = loadImage ("back.jpg");
  surface.setSize (back.width, back.height);
  m=1; n[0] = 1;
  x[0][0] = 30; x[0][1] = 35;
  y[0][0] = 43; y[0][1] = 47;
}
void draw ()
{
  float a, d;
  stroke (250,255, 250,128);
  image (back, 0, 0);
  if (count<=0)
    if (random(300) < 2)
    {
      m=1; x[0][0] = random(width); x[0][1] = x[0][0];
      y[0][0] = random(50)+12; y[0][1] = y[0][0]; n[0] = 1; count=1;
    }
  for (int i=0; i<m; i++)
    for (int j=0; j<n[i]; j++)   // Draw existing
      if (x[i][0]>0) line (x[i][j], y[i][j], x[i][j+1],y[i][j+1]);
  for (int i=0; i<m; i++)        // Grow existing
  {
    a = random (60)+60; d = random (12);
    if (x[i][0] < 0) continue;
    x[i][n[i]+1] = x[i][n[i]]+d*cos(radians(a));
    y[i][n[i]+1] = y[i][n[i]]+d*sin(radians(a));
    n[i] = n[i] + 1;
    if (random (1)<0.11)         // New branch
    {
      a = random (60)+60; d = random (12);
      x[m][0] = x[i][n[i]-1]; y[m][0] = y[i][n[i]-1];
      x[m][1] = x[i][n[i]-1]; y[m][1] = y[i][n[i]-1];
      n[m] = 1; m = m + 1;
    }
    if (i!=0 && random(1) < 0.20) for (int j=0; j<600; j++) x[i][j] = -1;
  }
  if (y[0][n[0]-1] > 205) { m=0; count = -1; }
}
