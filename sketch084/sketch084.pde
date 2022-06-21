import processing.video.*;
Capture camera;
PImage display;
void setup ()
{
  String[] cameras = Capture.list();
    if (cameras.length == 0)
    {
      println("There are no cameras.");
      exit();
    }
  
  camera = new Capture(this, cameras[0]);
  display = createImage (640, 480, RGB);
  camera.start();
  size (640, 480);
}

void draw ()
{
  if (camera.available() == true) camera.read();
  display.copy (camera, 0,0,640, 480, 0,0,640, 480);
  grey();
  image(display, 0, 0); // set(0, 0, camera);
}

void grey ()
{
  color p;
  int k;
  
  for (int i=0; i<display.pixels.length; i=i+1)
  {
    p = display.pixels[i];
    k = (int)((red(p)+green(p)+blue(p))/3);
    display.pixels[i] = color(k,k,k);
  }
}
