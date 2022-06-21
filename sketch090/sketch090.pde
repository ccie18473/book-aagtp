final int N = 42;
PVector flock[]=new PVector[N], flockV[]=new PVector[N];

void setup ()
{
  size (500,400);
  for (int i=0; i<N; i++)
  {
    flock[i]= new PVector(random(width), random(height));
    flockV[i] = new PVector(0, 0, 0);
  }
  noStroke(); fill (255); frameRate(15);
}

void draw ()
{
  background (0);
  drawFlock();
  moveFlock();
}

void drawFlock ()
{
  for (int i=0; i<N; i++)
    ellipse(flock[i].x, flock[i].y, 5,5);
}

void moveFlock ()
{
  PVector c = new PVector(0,0);
  for (int i=0; i<N; i++)
  {
    c = toCenter (i);
    c.add(away(i));
    c.add(match(i));
    flockV[i].add(c);
    flock[i].add(flockV[i]);
    flockV[i].normalize();
    flockV[i].mult(6);
  }
}

PVector match (int b)
{
  PVector c=new PVector (0,0);
  for (int i=0; i<N; i++)
    if (i!=b) c.add(flockV[i]);
  c.div(N-1);
  c.sub(flockV[b]);
  c.div(8);
  return c;
}

PVector toCenter (int b)
{
  PVector c = new PVector(0,0,0);
  for (int i=0; i<N; i++)     // Find center of mass
    if (i!=b) c.add(flock[i]);
  c.div(N-1);
  c.sub(flock[b]);
  c.x -= 2*(flock[b].x-mouseX);
  c.y -= 2*(flock[b].y-mouseY);
  c.normalize();
  return c;
}

PVector away (int b)
{
  PVector r=new PVector (0,0), q=new PVector (flock[b].x, flock[b].y);
  for (int i=0; i<N; i++)
    if (flock[b].dist(flock[i]) < 100)
    {
      q.set(flock[b]);
      q.sub(flock[i]);
      r.sub(q);
    }
  r.normalize();
  r.mult(-.5);
  return r;
}
