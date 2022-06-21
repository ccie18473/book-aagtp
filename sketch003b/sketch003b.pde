int count = 0;
void setup()
{
  size (300, 300);
}

void draw ()
{
  if (count<100)
    background(255, 0, 0);
  else background (0, 255, 0);
  count = count + 1;
}
