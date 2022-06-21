import ddf.minim.*;
int x=320, y=240;              // Coordinates of the circle (ball)
int dx=3, dy=2, radius=10;     // Size and speed of the circle (ball)
AudioPlayer player;
Minim minim;

void setup ()
{
  size (400, 300);             // Window size
  fill (255, 0, 255);          // Magenta fill
  minim = new Minim(this);
  player = minim.loadFile ("click.mp3");
}
void draw ()
{
  background (128);             // Grey background
  ellipse (x, y, radius+radius, radius+radius); // Draw the ball
  x = x + dx; y = y + dy;       // Move
  xbounce(); ybounce();
}
void xbounce ()
{
  if (x+radius > width)         // right side
  {   // Reverse X direction
    x = width-((x+radius) - width);
    dx = -dx; player.play(); player.rewind();
  } else if (x < radius)        // left side
  {
    x = radius-x; player.rewind();
    dx = -dx;   player.play();
  }
  x = x + dx;
}
void ybounce ()
{
  if (y<radius)                 // Top side
  {                             // Reverse Y direction
    y = radius+y; player.rewind();
    dy = -dy; player.play();
  } else if (y+radius > height) // Bottom side
  {
    y = height-((y+radius)-height); dy = -dy;
    player.play(); player.rewind();
  }
  y = y + dy;
}
