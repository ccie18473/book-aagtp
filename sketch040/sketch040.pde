String []data = new String[501];
int x0=40, y0=90, index, dx0=3, dy0=2;
void setup ()
{ size (300, 300); }

void draw ()
{
  background (40, 40, 190);
  ellipse (x0, y0, 10, 10);
  x0 = x0 + dx0; y0 = y0 + dy0;
  if (x0<10)
  {
    dx0 = -dx0;
   data[index] = "Collision left"; index= index+1;
  }
  if (x0>width-10)
  {
    dx0 = -dx0;
    data[index] = "Collision right"; index= index+1;
  }
  if (y0<0)
  {
    dy0 = -dy0;
    data[index] = "Collision top"; index= index+1;
  }
  if (y0>width-10)
  {
    dy0 = -dy0;
    data[index] = "Collision bottom"; index= index+1;
  }
  data[index] = "(X0,Y0)= ("+x0+","+y0+")";
  index = index+1;
  if (index > 499)
  {
    saveStrings("save.txt", data);
    exit();
  }
}
