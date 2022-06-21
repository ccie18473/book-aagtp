import processing.video.*;
Capture camera;
float sx=30., sy=40., sz=12.;
int eyex=30, eyey=50, eyez=60;
int cx=20, cy=30, cz=12, dx=-1;

void setup ()
{
  String[] cameras = Capture.list();
  size (640, 480, P3D);

  if (cameras.length == 0)
  {
    println("There are no cameras.");
    exit();
  }

  camera = new Capture(this, cameras[0]);
  camera.start();
}

void draw ()
{
  if (camera.available() == true) camera.read();
  background(255);
  camera(eyex, eyey, eyez, cx, cy, cz, 0, 1, 0);
  textureMode(NORMAL);
  beginShape (QUAD);
  texture (camera);
  vertex (0., 0., 0.,  0., 0.);
  vertex (sx, 0., 0.,  1., 0.);
  vertex (sx, sy, 0.,  1., 1.);
  vertex (0., sy, 0.,  0., 1.);
  endShape (CLOSE);
  eyex = eyex + dx;
  if (eyex < -30) dx = -dx;
  if (eyex > 100) dx = -dx;
}
