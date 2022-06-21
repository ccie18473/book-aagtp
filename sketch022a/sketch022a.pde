void setup ()
{
  size (400, 300);
}

void draw ()
{
  int i,j;

  for (i=0; i<width; i++)
    for (j=0; j<height; j++)
      set (i,j, color(255, 100, 40));
}
