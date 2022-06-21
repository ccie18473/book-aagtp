color bgcolor = color (200, 200, 200);
button bred, bgreen, bblue;
void setup()
{
  size (450, 300);
  bred = new button (10, 200, 50, 30, "Red");
  bgreen = new button (220, 200, 50, 30, "Green");
  bblue = new button (300, 200, 50, 30, "Blue");
}

void draw ()
{
  background (bgcolor);
  bred.draw();
  bgreen.draw();
  bblue.draw();
}

void mousePressed ()
{
  if (bred.armed()) bgcolor = color(random(128,255),
           green(bgcolor), blue(bgcolor));
  if (bgreen.armed()) bgcolor = color(red(bgcolor),
           random(128,255), blue(bgcolor));
  if (bblue.armed()) bgcolor = color(red(bgcolor),
           green(bgcolor), random(128,255));
}
class button
{
  int bx, by, bw, bh;
  color armedColor= color(20,200,20);
  color unarmedColor = color (200,200,40);
  String label;
 
  button (int x, int y, int w, int h, String s)
  {
    bx = x; by = y; bw = w; bh = h;
    label = s;
  }

  void draw ()
  {
    if (armed()) fill (20, 200, 40);
      else fill (200, 60, 80);
    rect (bx, by, bw, bh);
    fill (0); text (label, bx+13, by+19);
  }

  boolean armed ()
  {
    if ( (mouseX>=bx) && (mouseX<bx+bw) &&
         (mouseY>=by) && (mouseY<by+bh) ) return true;
    return false;
  }
}
