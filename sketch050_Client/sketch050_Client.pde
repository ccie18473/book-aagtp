// Client
import processing.net.*;
Client me;
char nextChar = ' ';
String message = "";

void setup ()
{
  size(200, 200);
  me = new Client(this,"***.***.***.***", 5000);
  fill (20);
  frameRate (10);
}

void draw ()
{
  if (me.available() > 0)
  {
    background(50, 250, 50);
    text ("IP address: "+me.ip(), 30, 40);
    nextChar = (char)me.readChar ();
    message = message + nextChar;
    if (message.length() > 20)
      message = message.substring(1,message.length());
    text (message, 10, 100);
  } else
  {
    background (200, 30, 10);
    text ("No server at port 5000.", 10, 20);
  }
}
