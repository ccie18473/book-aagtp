int x=320, y=240;  // Coordinates of the circle (ball)
int radius=20;     // Size of the circle (ball)
int dx=42, dy=22;  // Speed of the circle (ball)

void setup ()
{
  size (640, 480);    // Typical window size
  fill (255, 0, 255); // Magenta fill
  noStroke();         // Don't draw outlines
}

void draw ()
{
  background (255);                   // White background
  ellipse (x, y, radius*2, radius*2); // Draw the ball
  x = x + dx; y = y + dy;             // Move
  xbounce();
  ybounce();
}

void xbounce ()
{
  int delta = 0;
  delta = (x+radius) - width;
  if (x+radius > width)  // right side
  {
    x = width-delta-radius;
    dx = -dx;
  } else if (x < radius) // left side
  {
    x = (2*radius)-x;
    dx = -dx;            // Reverse X direction
  }
}

void ybounce ()
{
  int delta = 0;
  delta = (y+radius) - height;
  if (y < radius)               // top side
  {
    y = (2*radius)-y;
    dy = -dy;
  } else if (y+radius > height) // bottom side
  {
    y = height-delta-radius;
    dy = -dy;                   // Reverse Y direction
  }
}
