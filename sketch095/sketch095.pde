int maxMetaballs = 6;
float x[] = new float[maxMetaballs];
float y[] = new float[maxMetaballs];
float dx[] = new float[maxMetaballs];
float dy[] = new float[maxMetaballs];
float radius[] = new float[maxMetaballs];
float MINT = 1.4f, MAXT = 50f;

void setup ()
{
  size(500, 500);
  for (int i=0; i<maxMetaballs; i=i+1) radius[i] = -1;
  x[0] = 250; y[0] = 850; radius[0] = 400;
  x[1] = 100; y[1] = 300; radius[1] = 20; dx[1] = 0; dy[1] = -0.55;
  x[2] = 120; y[2] = 100; radius[2] = 30; dx[2] = 0.01; dy[2] = 0.57;
  x[3] = 90; y[3] = -330; radius[3] = 23; dx[3] = -0.01; dy[3] = 0.32;
  x[4] = 320; y[4] = -650; radius[4] = 19; dx[4] = 0.01; dy[4] = 0.4;
  x[5] = 230; y[5] = -800; radius[5] = 24; dx[5] = -0.01; dy[5] = 0.42;
}

void draw ()
{
  float sum;
  background(230, 220, 40, 90);
  for(int yy = 0; yy < height; yy++)
    for(int xx = 0; xx < width; xx++)
    {
      sum = 0;
      for(int i = 0; i < maxMetaballs && radius[i] > 0; i++)
        sum += equation(xx,yy,i);
      if(sum >= MINT && sum <= MAXT)
        set(xx, yy, color(0,170,50,100));
    }
  for (int i=1; i<maxMetaballs; i=i+1)
  {
    if (radius[i] >0)
    {
      y[i] += dy[i];
      if (y[i]>height+6*radius[i] || (y[i]<-3*radius[i])&&(dy[i]<0))
      { dy[i] = -dy[i]; x[i] += random (10)-5; }
    }
    ellipse (x[i], y[i], 3, 3);
  }
  if (random(500)< 2) radius[(int)random (maxMetaballs)] += random (1)-0.5;
}

float equation(float xx, float yy, int k)
{ return (radius[k] / sqrt( (xx-x[k])*(xx-x[k]) + (yy-y[k])*(yy-y[k]) ) ); }
