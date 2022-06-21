PImage inputImage;
color bgColor, fillColor;

void setup ()
{
  size(100,100);
  surface.setResizable(true);
  inputImage = loadImage ("image.bmp");
  surface.setSize (inputImage.width, inputImage.height);
  bgColor = inputImage.get(0,0);
  fillColor = color (40, 200, 30);
}

void draw ()
{
  image (inputImage, 0, 0);

  for (int i=0; i<inputImage.width; i++)
    for (int j=0; j<inputImage.height; j++)
      if ((inputImage.get(i,j)==bgColor) && nay(i,j,fillColor))
      {
        inputImage.set(i,j,fillColor);
      }
}

boolean nay (int x, int y, int c)
{
  if (get(x-1, y) == c) return true;
  if (get(x+1, y) == c) return true;
  if (get(x, y-1) == c) return true;
  if (get(x, y+1) == c) return true;
  return false;
}

void mouseReleased ()
{
  bgColor = get(mouseX, mouseY);
  fillColor = color (random(128,255),random(128,255),random(128,255));
  inputImage.set (mouseX, mouseY, fillColor);
}
