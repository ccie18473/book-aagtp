float sx=30., sy=40., sz=12.;
int eyex=30, eyey=50, eyez=60;
int cx=20, cy=30, cz=12;
int dx = -1;
PImage timage;

void setup ()
{
  size(200, 200, P3D);
  stroke(0);
  timage = loadImage ("carpets.jpg");
}

void draw ()
{
  background(255);
  camera(eyex, eyey, eyez, cx, cy, cz, 0, 1, 0);

  beginShape (QUAD);
  texture (timage);
  vertex (0., 0., 0., 0.,           0.);
  vertex (sx, 0., 0., timage.width, 0.);
  vertex (sx, sy, 0., timage.width, timage.height);
  vertex (0., sy, 0., 0.,           timage.height);
  endShape (CLOSE);

  eyex = eyex + dx;
  if (eyex < -30) dx = -dx;
  if (eyex > 100) dx = -dx;
}
