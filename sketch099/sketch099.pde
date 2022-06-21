int starx[]=new int[50], stary[]=new int[50];
float lx[]=new float[1000], ly[]=new float[1000];
int n=0;
void setup ()
{
  size(640, 480);
  fill (255);
  for (int i=0; i<50; i++)
  {
    starx[i] = (int)random(width);
    stary[i] = (int)random(height/2);
  }
  md(0,300,width, 300, 75.0);
}

void draw ()
{
  for (int i=0; i<height; i++)
  {
    stroke(50, 50, (float)(height-i)/2);
    line (0,i, width, i);
  }
  noStroke();
  for (int i=0; i<50; i++)
    if (random(1)<0.99) ellipse (starx[i], stary[i], 2, 2);
  stroke(0); strokeWeight(lx[1]-lx[0]+1);
  for (int i=0; i<n; i=i+1)
    line (lx[i],ly[i], lx[i],height);
}

void md (float x0, float y0, float x1, float y1, float dy)
{
  if (dy < 2)
  {
    lx[n] = x0; ly[n] = y0;
    lx[n+1] = x1; ly[n+1] = y1;
    n = n + 2;
  } else
    {
      float d = random(dy+dy)-dy;
      md (x0,y0, x0+(x1-x0)/2, y0+(y1-y0)/2-d, .6*dy);
      md (x0+(x1-x0)/2, y0+(y1-y0)/2-d, x1, y1, .6*dy);
    }
}
