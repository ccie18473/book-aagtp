float sx=30., sy=40., sz=12.;
int eyex= 144, eyey=0, eyez=245;
int cx=30, cy=40, cz=32;
int dz = -1;

void setup ()
{
  size(300, 300, P3D);
  stroke(0);
}

void draw ()
{
  background(255);
  camera(eyex, eyey, eyez, cx, cy, cz, 0, 1, 0);
 
  beginShape (QUAD);
    fill (170, 120, 50);
  vertex (0., 0., 0.);
  vertex (sx, 0., 0.);
  vertex (sx, sy, 0.);
  vertex (0., sy, 0.);
    fill (120, 170, 50);
  vertex (sx, 0., 0.);
  vertex (sx, 0., sz);
  vertex (sx, sy, sz);
  vertex (sx, sy, 0.);
    fill (170, 50, 120);
  vertex (sx, 0., sz);
  vertex (0., 0., sz);
  vertex (0., sy, sz);
  vertex (sx, sy, sz);
    fill (50, 120, 170);
  vertex (0., 0., 0.);
  vertex (0., sy, 0.);
  vertex (0., sy, sz);
  vertex (0., 0., sz);
  endShape (CLOSE);

  eyez = eyez + dz;
  if (eyez < -200) dz = -dz;
  if (eyez > 300) dz = -dz;
}
