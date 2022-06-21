int startx=20, starty=20;
int endx=99, endy=73;
PImage back;
int stage = 1, n=1;

void setup ()
{
  size (200, 200);
  back = loadImage("plan.png");
  back.set(startx, starty, color(1,1,1));
  image(back, 0, 0);
}

void draw ()
{
  if (stage == 1) step();
  else
    if (drawRoute(endx, endy, n-1)) noLoop();
}
void step ()
{
  for (int i=0; i<width; i++)
    for (int j=0; j<height; j++)
      if (red(get(i,j)) == n)
      {
        if(red(get(i-1,j))>n) set(i-1,j,color(n+1, 255, 255));
        if(red(get(i+1,j))>n) set(i+1,j,color(n+1, 255, 255));
        if(red(get(i,j-1))>n) set(i,j-1,color(n+1, 255, 255));
        if(red(get(i,j+1))>n) set(i,j+1,color(n+1, 255, 255));
        if (i==endx && j==endy) { stage = 2; return; }
      }
    n=n+1;
}
boolean drawRoute (int x, int y, int n)
{
  for (int i=x-1; i<=x+1; i++)
    for (int j=y-1; j<=y+1; j++)
      if (red(get(i,j)) == n)
      {
        set (i,j,color(0,100,200));
        drawRoute (i,j,n-1);
        return true;
      }
    return false;
}
