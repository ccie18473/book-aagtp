/* @pjs preload="trees.gif, stars.jpg"; */
float a=.02, bb=10;
PImage foreground, background;

void setup ()
{
  foreground=loadImage("trees.gif");
  background=loadImage("stars.jpg");
  size (400, 224);
  colorMode(HSB);
}

void draw ()
{
  float h, s, b=250, dt=0;
  image (background, 0, 0);
  for (int i=0; i<390; i++)
  {
    if (i%3 == 0) s = 220+random(20)-10;
    else if (i%2 == 0) s = 210+random(20)-10;
    else s = 200+random(20)-10;
    h = 15;
    for (int j=130; j>30; j--)
    {
      if (j<=100) dt = (100-j)*3;
      else dt = 0;
      stroke (h, s, b, 200-dt);
      h = h + random(.87);
      point (i,j-bb*sin(a*i));
    }
    a = a + random(0.001)-0.0005;
    bb = bb + random(1)-0.5;
    if (bb>16) bb = 15;
    if (bb<-10) bb = 0;
    if (a<-0.1 || a>0.1) a = 0;
  }
  image (foreground, 0, 0);
}
