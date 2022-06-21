final int SIZE = 200;
float x[] = new float[SIZE];
float y[] = new float[SIZE];
int N = 0;
boolean drawLast = true;

void setup ()
{
  size(400,400);
  noFill();
}

void draw ()
{
  background(200);
  stroke(255, 102, 0);
  if(drawLast)
    for (int i=0; i<N; i++) ellipse (x[i], y[i], 2, 2);
  if (N>=4)
  {
    for (int i=0; i<=N-4; i++)
    curve (x[i],y[i], x[i+1],y[i+1],
           x[i+2],y[i+2], x[i+3],y[i+3]);
    stroke(0,0,200);
    if (drawLast)
      curve (x[N-3],y[N-3], x[N-2],y[N-2],
             x[N-1],y[N-1], mouseX, mouseY);
  }
}

void mousePressed ()
{
  x[N] = mouseX; y[N] = mouseY;
}

void mouseReleased ()
{ if (N < SIZE-1) N = N + 1; }

void keyPressed ()
{
  if (key == BACKSPACE && N>0) N=N-1;
  if (key == ' ') drawLast = !drawLast; // ! means 'not'
}
