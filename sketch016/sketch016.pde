PImage img;
boolean flag = false;
PImage sub;
int x0=0, y0=0;

void setup ()
{
  size (100, 100);
  surface.setResizable(true);
  img = loadImage ("image.jpg");
  surface.setSize(img.width, img.height);}

void draw ()
{
  background (200, 200, 200); // White background
  image (img, (width-img.width)/2, (height-img.height)/2);

  if (flag)             // If a mouse button is down then x0,y0 are defined
  {                     // Draw a rectangle from (x0,y0) to the mouse cursor
    noFill(); stroke(200);
    rect (x0, y0, (mouseX-x0), (mouseY-y0)); // Draw rectangle
  }
}

void mousePressed ()
{
  flag = true;
  x0 = mouseX; y0 = mouseY;
}

// Mouse button released. Select the sub-image that lies in the rectangle
// and rescale it; replace current display image with the new cropped one.
void mouseReleased ()
{
  int t;
  flag = false;
  if (x0 > mouseX) { t = mouseX; mouseX = x0; x0 = t; }
  if (y0 > mouseY) { t = mouseY; mouseY = y0; y0 = t; }
  sub = get(x0, y0, (mouseX-x0), (mouseY-y0));
  if ((mouseX-x0 > 0) && (mouseY-y0 > 0))
  {
    if (mouseButton == RIGHT) sub.resize (width, height);
    img = sub;
  }
}
