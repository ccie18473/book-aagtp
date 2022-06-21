color bgcolor = color (200, 200, 200);
int bx=10, by=260, bw=60, bh=30;

void setup ()
{
  size (250, 300);
}

void draw ()
{
  background (bgcolor);
  drawButton ();
}

void drawButton ()
{
  if (buttonArmed()) fill (20, 200, 40);
    else fill (200, 60, 80);
  rect (bx, by, bw, bh);
  fill (0);
  text ("Button", bx+13, by+19);
}

boolean buttonArmed ()
{
  if ( (mouseX>=bx) && (mouseX<bx+bw) &&
       (mouseY>=by) && (mouseY<by+bh) ) return true;
  return false;
}

void mousePressed ()
{
  if (buttonArmed())
    bgcolor = color(random(128,255), random(128,255), random(128,255));
}
