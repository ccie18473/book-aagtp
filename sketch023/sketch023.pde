PImage img;
int threshold;
color black = color(0, 0, 0);
color white = color (255, 255, 255);

void setup ()
{
  size(200, 200);
  surface.setResizable(true);
  img = loadImage ("image.jpg"); 
  surface.setSize(img.width, img.height);
  threshold = 128;
}

void draw ()
{
  color c;
  int i,j,g;

  background(200);
  image (img, 0, 0);
  
  threshold = (int)(((float)mouseX/(float)width) * 255);
  for (i=0; i<width; i++)
    for (j=0; j<height; j++)
    {
      c = get (i,j);
      g = (int)brightness(c);
      if (g<threshold) g = black;
      else g = white;
      set (i,j,g);
    }
}
