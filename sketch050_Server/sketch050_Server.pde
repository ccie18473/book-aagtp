// Server
import processing.net.*;
Server sender;
int ind = 0;
char nextChar;
String message = "This is a message from J Parker ";

void setup ()
{
  size(200, 100);
  sender = new Server(this, 5000); // Create server
}

void draw ()
{
  background(200);
  if (ind >= message.length()) ind = 0;
  nextChar = message.charAt(ind);
  sender.write(nextChar);
  text ("IP address: "+sender.ip(), 30, 40);
  ind = ind + 1;
}
