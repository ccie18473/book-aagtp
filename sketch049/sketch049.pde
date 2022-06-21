String [] webIn;
String url = "https://minkhollowmedia.ca/41-2/games";
String file = "", name="", s="";
int index = 0, i=0;
PImage next;

void setup ()
{
  size (400, 400);
  webIn = loadStrings(url+"/"+file);
  fill (0);
}

void draw ()
{
  background (200);
  if (next != null) image (next, 0, 0);
  index = index + 1;
  if (index>=webIn.length)
  {
    text ("DONE", 10, 370);
    return;
  }
  text (webIn[index], 10, 370);
  s = webIn[index].toLowerCase();
  i = s.indexOf ("src=", i);
  if (i<0) return;
  s = webIn[index];
  name = getName(s.substring(i+4));
  if (name == null) return;
  if (name.charAt(0) != '/') next = loadImage (url+"/"+name);
  if (next == null) next = loadImage (name);
}

String getName (String s)
{
  int i=1;
  if (s.charAt(0) != '"') return null;
  while (i<s.length())
  {
    if (s.charAt(i) == '"') return s.substring(1, i);
    i = i + 1;
  }
  return null;
}
