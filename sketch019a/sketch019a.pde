// Translate a circle
void setup ()
{
  size (300, 200);
  stroke(0);
  fill(200, 100, 50);
}

void draw ()
{
  background (200);
  ellipse (0, 0, 10, 10);
  translate (50, 50);
  ellipse (0, 0, 10, 10);
  ellipse (30, 40, 10, 10);
}
