PImage im;

void setup ()
{
  size (640, 480);
  im = loadImage ("image.jpg");
}

void draw ()
{
  image (im, 150, 30);
}
