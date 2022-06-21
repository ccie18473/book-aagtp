PImage img1, img2;

void setup ()
{
  size(100,100);
  surface.setResizable(true);
  img1 = loadImage ("image.jpg");
  surface.setSize(img1.width, img1.height);
  img2 = duplicate (img1);
  colorMode (HSB);
  brighten(img2, 60);
}

void draw()
{
  background (128); // Grey background
  if (mousePressed) image (img2, 0, 0);
  else image (img1, 0, 0);
}

void brighten (PImage img, int val)
{
  color c;
  for (int i=0; i<img.width; i++)
    for (int j=0; j<img.height; j++)
    {
      c = img.get(i,j);
      img.set (i, j, color(hue(c), saturation(c), brightness(c)+val));
    }
}

PImage duplicate (PImage from)
{
  PImage newImage;
  color pixel;
  if (from == null) return from;
  newImage = createImage (from.width, from.height, RGB);
  for (int i=0; i<from.width; i++)
    for (int j=0; j<from.height; j++)
    {
      pixel = from.get (i,j);
      newImage.set(i,j,pixel);
    }
  return newImage;
}
