PImage img;
color c1, c2, c;
boolean grey = false;

void setup ()
{
  size(200, 200);
  surface.setResizable(true);
  img = loadImage ("image.jpg");
  surface.setSize(img.width, img.height);
  c = color (200, 200, 200); // Default background
}

void draw ()
{
  int i,j;
  color c1, c2;
  background (200);
  image (img, 0, 0);
  if (mousePressed)
  {
    for (i=0; i<width; i++)
      for (j=0; j<height; j++)
      {
        c1 = get (i,j);
        c2 = (int)brightness(c1);
        set (i,j,color(c2,c2,c2));
      }
  }
}

void mousePressed () { grey = true; }
void mouseReleased () { grey = false; }
