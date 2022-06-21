PImage ad1;
float xoff=0, yoff=0;
float dx=-.05, dy=.03;
int stage = 0, count = 0;

void setup ()
{
  size(100,100);
  surface.setResizable(true);
  ad1 = loadImage ("burrito.jpg");
  surface.setSize (ad1.width-30, ad1.height-30);
}

void draw ()
{
  noStroke();
  image (ad1, xoff, yoff);
  xoff += dx; yoff += dy;

  if (xoff <= -30 || xoff > 0) dx = -dx;
  if (yoff <= -30 || yoff > 0) dy = -dy;
  fill (150, 150, 90);
  rect (0, height-50, width, 90);
  triangle (width-260, height, width, height-120, width, height);
  fill(200);
  textSize(30);
  text ("Organically raised, no additives. Only the best.", 40, height-20);

  if (stage == 0)
  {
    fill (30);
    text ("It takes us hours to make it.", 40, 90);
    count += 1;
    if (count > 850)
    {   count = 0; stage = 1; }
  } else if (stage == 1)
  {
    fill (30, 100, 100);
    text ("It takes you five minutes to eat it.", 40, 90);
    count += 1;
    if (count > 900)
    {  count = 0; stage = 0;
    }
  }
}
