void setup ()
{
  size (500, 300);
  int green = 10;
  for (int i=0; i<20; i++)
  {
    fill (255, green, 255);
    ellipse (i*10+20, 40, 10, 10);
    green = green+10;
  }
}
void draw (){ }
