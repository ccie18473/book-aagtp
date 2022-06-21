float size = 0;
float ds = .3;
PImage source, destination;

void setup ()
{
  size(100,100);
  surface.setResizable(true);
  source = loadImage("image.jpg");  // Fill in your own image here
  surface.setSize(source.width, source.height);
  destination = new PImage(source.width, source.height);
}

void draw ()
{
  background (200);
  warp(source);
  image(destination, 0, 0);
  size -= random(ds);
  if (abs(size) > 12)
  {
    ds = -ds;
    size = size - ds;
  }
}

void warp(PImage source)
{
  int w = source.width, h = source.height;
  int newX, newY;
  color c;

  for(int x = 12; x < w-12; x++)
    for(int y = 12; y < h-12; y++)
    {
      newX = (int)(x + size*sin(radians(3*y)));
      newY = (int)(y + size*cos(radians(4*x)));

      if(newX >= w || newX < 0 || newY >= h || newY < 0)
        c = color(200);
      else
        c = source.get (newX, newY);
      destination.set (x, y, c);
    }
}
