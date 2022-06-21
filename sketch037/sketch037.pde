PImage img;
String s = "";

void setup ()
{
  size(500, 500);
}

void draw ()
{
  background (200, 200, 200);
  if (img != null) image (img, 0, 0);
  fill(0);
  text (s, 20, height-20);
}

void keyPressed()
{
  fill(0);
  if (s.length()>0 && key==BACKSPACE)
  {
    s = s.substring (0, s.length()-1);
  }
  else if(key==ENTER || key==RETURN)
  {
    img = loadImage (s);
    if (img == null) s = "Error";
  } else
      s = s + key;
}
