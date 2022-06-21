PImage img;
color c;

void setup ()
{
  size(200, 200);
  surface.setResizable(true);
  img = loadImage ("image.jpg");
  surface.setSize(img.width+55, img.height);
  c = color (200, 200, 200); // Default background
}

void draw()
{
  background (c);
  image (img, 0, 0);
  if (red(c) != 200)
  {
    text ("R="+red(c), img.width+2, 20);
    text ("G="+green(c), img.width+2, 35);
    text ("B="+blue(c), img.width+2, 50);
  }
}

void mousePressed ()
{
  if (mouseX > img.width)
    c = color(200, 200, 200);
  else
    c = get (mouseX, mouseY);
}
