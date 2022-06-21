PFont font1;
int x1, y=190, x2;
int size = 55;
int i1, i2;
String []headlines = new String[5];

void setup ()
{
  size (400, 200);
  font1 = loadFont ("CourierNewPS-BoldMT-48.vlw");
  textFont (font1, 12);

  headlines[0] = "2 Die, 8 Hurt in Pasadena as Vehicle Hits Crowd * ";
  headlines[1] = "L.A.'s Open Enrollment Plan Shrinks for 5th Year * ";
  headlines[2] = "Program for Writers for Young Adults Starts With Duo Behind 'Buffy' Books * ";
  headlines[3] = "Pickets Want Laguna Festival to Stay Put *         ";
  headlines[4] = "3rd Whale in a Month Washes Up on Coast *          ";
  fill (0);
  i1 = 0; i2 = 1; x1 = width-10;
  x2 = x1 + (int)textWidth(headlines[i1])+ 10;
}

void draw ()
{
  background(200);
  text (headlines[i1], x1, y); text (headlines[i2], x2, y); x1 = x1 - 1; x2 = x2 - 1;
  if (x1+textWidth(headlines[i1]) < 0)
  {
    i1 = (i2+1)%5;
    x1 = x2 + (int)textWidth(headlines [i2])+ 10;
  }

  if (x2+textWidth(headlines[i2]) < 0)
  {
    i2 = (i1+1)%5;
    x2 = x1 + (int)textWidth(headlines [i1])+ 10;
  }
}
