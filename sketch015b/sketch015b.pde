PImage img;
int w, h;
float aspect = 1.0;

void setup ()
{
  img = loadImage ("image.jpg");
  size (540, 480);
  w = img.width; h = img.height;
  aspect = (float)w/(float)h;

  if (w > h)
  {
    w = width;
    h = (int)((float)w/aspect);
  } else
  {
    h = height;
    w = (int)(h*aspect);
  }
  img.resize (w, h);
  image (img, (width - w)/2, (height-h)/2);
}

void draw () { }
