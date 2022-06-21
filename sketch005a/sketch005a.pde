void setup ()
{
  size(500, 500);
}
void draw ()
{
  background (220, 220, 220);
  stroke (255, 0, 0); // Red margin line
  line (20, 0, 20, height);
  stroke (100, 0, 250); // Blue horizontal lines
  for (int i=4; i<50; i++)
    line (0, i*10, width, i*10);
}
