int count = 0;
void setup()
{
  size (300, 300);
}

void draw ()
{
  if (count == 0)
  {
    background(255, 0, 0); count = 1;
  } else
  {
    background(0, 255, 0); count = 0;
  }
}
