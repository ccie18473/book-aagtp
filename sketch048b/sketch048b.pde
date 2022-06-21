String url = "";

void setup ()
{
  size (240, 200);
}

void draw ()
{
  background (200, 200, 200);
  fill(0);
  text (url, 20, height-20);
}

void keyPressed ()
{
  fill(0);
  if (key == CODED) return;
  // if (keyCode==SHIFT) return;
  if (url.length()>0 && key==BACKSPACE)
    url = url.substring (0, url.length()-1);
  else if(key==ENTER || key==RETURN)
    link (url);
  else
    url = url + key;
}
