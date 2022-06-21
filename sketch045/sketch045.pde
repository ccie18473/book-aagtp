int val = 0;
int dv = -1;
int count = 0;
float dtor = 180.0/3.14159;
PImage background_image; // Rendered gauge
int dataMin=0, dataMax=100;
float alpha=230, beta=-40;

void setup ()
{
  size (170, 108);
  background_image = loadImage
                 ("data/gauge.png");
  frameRate( 30 );
  background (255);
}

/* Test main for a gauge widget */
void draw ()
{
  image (background_image, 0, 0);
  gauge (119, 55, val, 25);
  val = val + dv;
  if (val > dataMax)
  { val = dataMax; dv = -dv; }
  else if (val < dataMin)
  { val = dataMin; dv = -dv; }
}

void gauge (int x, int y, int v, int dial_length)
{
  float theta;
  int xx, yy;
// Calculate rotation angle of pointer
  theta = radians (((v-dataMin)*(beta-alpha))/(dataMax-dataMin) + alpha);
  stroke (0, 0, 0);
  yy = int(dial_length * sin(theta)); // x-coordinate of rotated pointer end
  xx = int(dial_length * cos(theta)); // y-coordinate of rotated pointer end
  yy = y-yy; xx = xx + x;
  line (x, y, xx, yy);
}
