PFont font1;
int count = 0;
int x[] = new int [10];
int y[] = new int [10];
int size [] = new int [10];
int dx[] = new int [10];
int dy[] = new int[10];
String s1 = "Processing";

void setup ()
{
  size (400, 200);
  font1 = loadFont ("CourierNewPS-BoldMT-48.vlw");
  textFont (font1, 12);
  for (int i=0; i<10; i++)
  {
    x[i] = 100+15*i; y[i] = 100;
    size[i] = 12;
    dx[i] = (int)(random(11)-6);
    dy[i] = (int)(random(11)-6);
  }
  fill (0);
}

void draw ()
{
  background(200);
  for (int i = 0; i<10; i++)
    if (size[i] > 0)
    {
      textSize(size[i]);
      text (s1.charAt(i), x[i], y[i]);
    }
  count = count + 1;
  if (count > 60)
    for (int i=0; i<10; i++)
    {
      x[i] = x[i] + dx[i];
      y[i] = y[i] + dy[i];
      size[i] = size[i] + (int)(random (5)-3);
    }
}
