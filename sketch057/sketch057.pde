PImage tree; // https://pngimg.com/download/204/
float sx=30., sy=40.;
int eyex=30, eyey=20, eyez=60;
int cx=20, cy=15, cz=12;
int dx = -1;

void setup ()
{
  size (500, 400, P3D);
  tree = loadImage ("tree.gif");
  noStroke();
}

void draw ()
{
  background (200, 255, 0);
  camera(eyex, eyey, eyez, cx, cy, cz, 0, 1, 0);
  beginShape (QUAD);
  texture (tree);
  vertex (0., 0., 0., 0.,         0.);
  vertex (sx, 0., 0., tree.width, 0.);
  vertex (sx, sy, 0., tree.width, tree.height);
  vertex (0., sy, 0., 0.,         tree.height);
  endShape (CLOSE);

  rotateY (PI/2.0);
  translate (-13, 0, 13);

  beginShape (QUAD);
  texture (tree);
  vertex (0., 0., 0., 0.,         0.);
  vertex (sx, 0., 0., tree.width, 0.);
  vertex (sx, sy, 0., tree.width, tree.height);
  vertex (0., sy, 0., 0.,         tree.height);
  endShape (CLOSE);

  eyex = eyex + dx;
  if(eyex<-40 || eyex>60) dx = -dx;
}
