PImage moon;
int xoff=0, yoff=0;
PGraphics pg;

void setup ()
{
  moon = loadImage ("moon.jpg");
  size (300, 300);
  pg = createGraphics(moon.width, moon.height);
  pg.beginDraw();
  pg.image(moon, 0, 0);
  pg.stroke (0, 200, 0);
  pg.noFill();
  pg.ellipse (393, 233, 12, 12);
  pg.endDraw();
  stroke (200);
  noFill();
}

void draw ()
{
  background (200);
  image(pg, xoff, yoff);
  line (0, height/2, width/2-10, height/2);
  line (width/2+10, height/2, width, height/2);
  line (width/2, 0, width/2, height/2-10);
  line (width/2, height/2+10, width/2, height);
  ellipse (width/2, height/2, 10, 10);
}

void keyPressed ()
{
  if (key == 'w') yoff = yoff + 1;     // Move up
  else if (key == 's') yoff = yoff -1; // Move down
  else if (key == 'a') xoff = xoff +1; // Move left
  else if (key == 'd') xoff = xoff -1; // Move right
  if (xoff > 0) xoff=0;
  if (xoff < -(moon.width-width)) xoff = -(moon.width-width);
  if (yoff > 0) yoff = 0;
  if (yoff < -(moon.height-height)) yoff = -(moon.height-height);
}
