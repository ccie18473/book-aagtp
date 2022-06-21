public void setup ()
{
  String rules;
  size(800, 800, P2D); stroke(0);
  translate(width/2,height);
  rules = makeString(6, "X");
  drawPlant (4, 22, rules,rules.length()-1);
}

String makeString(int levels, String s)
{
  String next = "";
  char c;
  if (levels > 0)
  { // Check if there are any levels left to render
    for (int i=0; i<s.length(); i++)
    {
      c = s.charAt(i);
      if (c == 'X')
        next+=makeString(levels-1, "F-[[X]+X]+F[+FX]-X");
      else if (c == 'F') next += makeString(levels-1, "FF");
      else next = next + c;
    }
  } else next = s;
  return next;
}

void drawPlant(float length, float angle, String s, int drawLevel)
{
  char c;
  int i=0;
  for (int j=0; j<s.length(); j++)
  {
    c = s.charAt(j);
    if (c == '-') rotate(radians(angle));
    else if (c == '+') rotate(-radians(angle));
    else if (c == '[') pushMatrix();
    else if (c == ']') popMatrix();
    else if (c == 'F')
    {
      if (i <= drawLevel) line(0, 0, 0, -length);
      translate(0,-length);
    }
    i++;
  }
}
// (This sketch is a reworking of the one found at https://www.openprocessing.org/sketch/103747/)
