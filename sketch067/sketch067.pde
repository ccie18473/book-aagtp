final int SIZE = 800;
float x[] = new float[SIZE];
float y[] = new float[SIZE];
float dx[] = new float[SIZE];
float dy[] = new float[SIZE];
float size[] = new float[SIZE];
int last = 0;
PImage background;
int emitterx=252, emittery=200;

void setup ()
{
  size(100,100);
  surface.setResizable(true);
  background = loadImage ("background.png");
  surface.setSize(background.width, background.height);
  for (int i=0; i<SIZE; i++) x[i] = -1;
}

void draw ()
{
  int N=0;

  noStroke();
  
  image (background, 0, 0);
  for (int i=0; i<SIZE; i++)  // Draw existing particles
    if (x[i] > 0)
    {        // Vary the color slightly
      fill (200+random(10), 200+random(10), 150, 64);
      ellipse (x[i], y[i], size[i], size[i]);  // Draw circle
      x[i] = x[i] + random(3)-1.5;             // Jiggle X
      y[i] = y[i] + dy[i] + random(3)-1.5;     // Move up
      size[i] = size[i] + random(3)-1.5;       // Change size
    }

    N = (int)random(15);    // Create N new particles
    for (int i=0; i<N; i++)
    {
      last = (last+1);
      if (last >= SIZE) last = 0;
      x[last] = emitterx+random(2)-1;   // X position (emitter)
      y[last] = emittery;               // Y position (emitter)
      dx[last] = 0; dy[last] = -2;      // Initial speed (up)
      size[last] = 4;                   // Initial size
    }
}
