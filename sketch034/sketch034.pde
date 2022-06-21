PFont font1;
int x=20, y=100;
int size = 55, ds=-1;

void setup ()
{
  size (200, 200);
  font1 = loadFont ("CourierNewPS-BoldMT-48.vlw");
  textFont (font1, 48);
  fill (0);
}

void draw ()
{
  background(200);
  textSize (size);
  text ("Hello", x, y);
  size = size + ds;
  if (size < 2) ds = -ds;
  if (size > 55) ds = -ds;
}
