PImage piece;
int val[] = {5, 7, 9}, i, j;

void setup ()
{
  size (500, 400);
  piece = loadImage ("coin.gif");
  frameRate (0.5);
}

void draw ()
{
  background (0);
  for (int j=0; j<3; j++)
    for (int i=0; i<val[j]; i=i+1)
      image (piece, i*45+10, (j+1)*100);
}

void mouseReleased ()
{
  i = (mouseY/100)-1; j = (mouseX-10)/45+1;
  if (i<0) return;
  if (j<=val[i]) val[i] = val[i] - j;
  draw(); move();
  if (val[0]+val[1]+val[2] == 0)
  { draw(); text ("Computer wins.",20,300);
    noLoop(); return;
  }
}

int eval() { return val[0]^val[1]^val[2]; }

void move()
{
  if (val[0]+val[1]+val[2] == 0)
  { text ("You Win.",20,300); noLoop(); return; }
  for(int i=0; i<3; i++)
    for (int j=1; j<=val[i]; j++)
    {
      val[i] = val[i] - j;
      if (eval() == 0) return;
      val[i] = val[i] + j;
    }
  text ("Computer resigns- you win.", 20, 300);
  noLoop();
}
