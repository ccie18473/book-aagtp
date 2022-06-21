int count = 0;
int N = 0;
int increment = 2;
String message;

void setup ()
{
  size (450, 500);
  background (0, 80, 0);
  message = "Processing 3.5.4 September 2021. !// J Parker - Sketch 041!";
  message = message + "void draw()!{! boolean more = true;! int x, y;!"+
    "!  x = 15; y = 50;!  background (0, 80, 0);!"+
    "!    for (int i=0; i<N; i++)!    {!      if (message.charAt(i) == '-')"+
    "!      {!        y = y + 15; !        x = 15;!      }!      else!"+
    "      {!        text (message.charAt(i), x, y);!        x = x + 10;"+
    "!      }!    }!  !  count = count + 1;!  if (count > increment) !  "+
    "{ count = 0; N++; }!"+
    "  if(N > message.length()) N = 0;!}!";    
    message = message + "-- Abort at line 201 --!'   c = chr(128)'!        ^!!!";
}

void draw()
{
  boolean more = true;
  int x, y;

  x = 15; y = 50;
  background (0, 80, 0);
  for (int i=0; i<N; i++)
  {
    if (message.charAt(i) == '!')
    {
      y = y + 15;
      x = 15;
    }
      else
      {
        text (""+message.charAt(i), x, y);
        x = x + 10;
      }
  }
  // N=N+1; if(N >= message.length()) N = 0;
}

void keyPressed()
{
  N=(N+1)%message.length();
}
