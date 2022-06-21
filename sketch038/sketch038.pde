String s = "";
int val = 0;
int x=-1, y=-1;

void setup ()
{
  size(500, 500);
}

void draw ()
{
  background (200, 200, 200);
  fill(0);
  text (s, 20, height-20);
  if (y>=0) ellipse (x, y, 10, 10);
}

void keyPressed()
{
  fill(0);
  if (s.length()>0 && key==BACKSPACE)
  {
    s = s.substring (0, s.length()-1);
    val = val/10;
  } else if(key==ENTER || key==RETURN)
    {
      if (x<0) x = val;
      else if (y<0) y = val;
      s = ""; val = 0;
    } else if ( (key>='0') && (key<='9'))
      {
        s = s + key;
        val = val * 10 + (key-'0');
      } else
        {
          s = "Error"; val = 0;
        }
}
