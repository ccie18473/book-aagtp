PImage img;

void setup ()
{
  img = loadImage ("image.jpg");
  size (240, 480); // Fixed size window
  img.resize (240, 480);
  image (img, 0, 0);
}

void draw ()
{ }
