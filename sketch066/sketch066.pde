final int SIZE = 5000;
float x[] = new float[SIZE];
float y[] = new float[SIZE];
float dx[] = new float[SIZE];
float dy[] = new float[SIZE];
float size[] = new float[SIZE];
int last = 0, N=0;
PImage background;

void setup ()
{
  size(100,100);
  surface.setResizable(true);
  background = loadImage("background.png");
  surface.setSize (background.width, background.height);
  for (int i=0; i<SIZE; i++) x[i] = -1;
}

void draw ()
{
  fill (210);
  noStroke();
  image (background, 0, 0);
  for (int i=0; i<SIZE; i++)  // Draw existing
  {
    if (x[i] >= 0)
    {
      rect(x[i], y[i], size[i]+random(3)-1.5, size[i]+random(3)-1.5);
      x[i] = x[i] + dx[i] + random (3)-1.5;
      y[i] = y[i] + dy[i];
    } }

  N = (int)random (((float)mouseY/height)*30);  // Create new
  for (int i=0; i<N; i++)
  {
    x[last] = random(width); y[last] = 0;
    dx[last] = 0; dy[last] = random(2)+1;
    size[last] = 3;
    last = last + 1;
    if (last >=SIZE) last = 0;
  }
}
