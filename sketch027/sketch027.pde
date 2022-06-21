PImage img1, img2;
color c=color(0,0,0);
void setup ()
{
  size(100,100);
  surface.setResizable(true);
  img1 = loadImage ("image.bmp");
  surface.setSize (img1.width, img1.height);
  img2 = duplicate (img1);
}
void draw ()
{
  color c1;
  background (255);
  image (img1, 0, 0);
  if (mousePressed)
  {
    c = get(mouseX, mouseY);
    for (int i=0; i<width; i++)
      for (int j=0; j<height; j++)
      {
        c1 = img1.get(i,j);
        if (c1 == c)
        {
          c1 = color(red(c1), green(c1), blue(c1), 0);
          img2.set (i,j,c1);
        }
      }
    img2.save ("out.gif");
    exit();
  }
}
PImage duplicate (PImage from)
{
  PImage newImage;
  color pixel;
  if (from == null) return from;
  newImage = createImage (from.width, from.height, ARGB);
  for (int i=0; i<from.width; i++)
    for (int j=0; j<from.height; j++)
    {
      pixel = from.get (i,j);
      newImage.set(i,j,pixel);
    }
  return newImage;
}
