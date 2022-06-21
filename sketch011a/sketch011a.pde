void setup ()
{
  size (400, 300);
  fill (255, 0, 0);
}

void draw ()
{
  background(200);
  textSize(12);
  text ("12 pixel text starts at (100, 50).", 100, 50);
  textSize (20);
  text ("20 pixel text starts at (50, 100).", 50, 100);
}
