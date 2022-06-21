int count = 0;
void setup()
{
  size (300, 300);
}

void draw ()
{
  background (0, 255, 0);
  if (count<100)
    background(255, 0, 0);
  count = count + 1;
}
