// Rotate a line about its origin
float angle = 0.0;

void setup ()
{
  size (300, 200);
  stroke(0);
  fill(0);
}

void draw ()
{
  background (200);
  translate (150, 100);
  rotate (angle);
  ellipse (0, 0, 3, 3);
  line (-50, 0, 50, 0);
  translate (-150, -100);
  angle += .01;
}
