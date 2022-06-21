int MAXBALLS = 100;
int []xpos = new int[MAXBALLS];
int []ypos = new int[MAXBALLS];
int nballs = 30;
int []dx= new int[MAXBALLS];
int []dy = new int[MAXBALLS];
void setup ()
{
  size (400, 400);
  for (int i=0; i<nballs; i=i+1)
  {
    xpos[i] = (int)random(width-10)+5;
    ypos[i] = (int)random(height-10)+5;
    dx[i] = (int)random(10)-5;
    dy[i] = (int)random(10)-5;
  }
}

void draw ()
{
  background (255);
  for (int i = 0; i<nballs; i++)
  {
    ellipse (xpos[i], ypos[i], 10, 10); xpos[i] = xpos[i] + dx[i];
    ypos[i] = ypos[i] + dy[i];
    bounce(i);
  }
  for (int i=0; i<nballs; i++)
    for (int j=i+1; j<nballs; j++)
      if (distance (xpos[i], ypos[i], xpos[j], ypos[j]) < 10)
      {
        dx[i] = -dx[i]; dy[i] = -dy[i];
        dx[j] = -dx[j]; dy[j] = -dy[j];
      }
}

float distance (int x0, int y0, int x1, int y1)
{ return sqrt ( (x0-x1)*(x0-x1) + (y0-y1)*(y0-y1) ); }

void bounce (int i)
{
  if (xpos[i] < 10) dx[i] = -dx[i];
  if (xpos[i] > width-10) dx[i] = -dx[i];
  if (ypos[i] < 10) dy[i] = -dy[i];
  if (ypos[i] > height-10) dy[i] = -dy[i];
  xpos[i] = xpos[i] + dx[i]; ypos[i] = ypos[i] + dy[i];
}
