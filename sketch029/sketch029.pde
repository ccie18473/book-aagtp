PImage img1, sprite;
color c=color(0,0,0);
int px=100, py=100, dx=2, dy=1;

void setup ()
{
  size(100,100);
  surface.setResizable(true);
  img1 = loadImage ("background.bmp");
  surface.setSize (img1.width, img1.height);
  sprite = loadImage("image.gif");
  sprite.resize (90, 50);
}

void draw ()
{
  background (255);
  image (img1, 0, 0);
  image (sprite, px, py);
  px = px + dx; py = py + dy;
  xbounce(); ybounce();
}

void xbounce ()
{
  int delta;
  delta = (px+sprite.width) - width;
  if (delta > 0)     // right side
  {
    px = width-delta-sprite.width;
    dx = -dx;
  } else if (px < 0) // left side
  {
    px = -px;
    dx = -dx;        // Reverse X direction
  }
}
void ybounce ()
{
  int delta;
  delta = (py+sprite.height) - height;
  if (py < 0)           // top side
  {
    py = -py;
    dy = -dy;
  } else if (delta > 0) // bottom side
  {
    py = height-delta-sprite.height;
    dy = -dy;           // Reverse Y direction
  }
}
