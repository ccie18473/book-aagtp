float angle = 0.0, d = 0.01;

void setup ()
{
  size (150, 130);
  stroke(0);
}

void draw ()
{
  background (200);
  rotate (angle);
  line (0, 0, 50, 0);
  ellipse (50, 0, 3, 3);
  angle += d;
  if (angle > 1.6) d = -d;
  else if (angle < 0.0) d = -d;
}
