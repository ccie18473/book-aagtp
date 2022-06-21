import ddf.minim.*;
final int MAXOBJECTS = 50;
color colors[] = new color[MAXOBJECTS];
int hsize[] = new int[MAXOBJECTS];
int vsize[] = new int[MAXOBJECTS];
int last = 0;
float lastd=0, dl, dr, d;

Minim minim;
AudioInput in;
void setup ()
{
  size (400, 300);
  minim = new Minim(this);
  in = minim.getLineIn(Minim.STEREO, 1024);
  ellipseMode (CENTER); colorMode(HSB);
  noStroke(); frameRate(50);
}

void draw ()
{
  background(128);
  for (int i=MAXOBJECTS-1; i>=0; i--)
  {
    fill (colors[i]);
    ellipse (200, 150, vsize[i], hsize[i]);
    vsize[i] += 5; hsize[i] += 5;
  }
  dl = ((in.left.get(0)+1)/2) *100;
  dr = ((in.right.get(0)+1)/2) *100;
  if (dl>dr)
  {
    vsize[last] = (int)(dl-dr)*200; hsize[last] = 1;
  }
  else
  {
    vsize[last] = 1; hsize[last] = (int)(dr-dl)*200;
  }
  colors[last] = color(abs(lastd-dl)*100, 200, 250, 30);
  lastd = dl;
  last = (last + 1)%MAXOBJECTS;
}
