String s1 = "To be or not to be";
String s2 = "that is the question.";

void setup ()
{
  size (500, 400); fill(0);
  text ("s1 = '"+s1+"'", 10, 20);
  text ("s2 = '"+s2+"'", 10, 35);
  text ("s1+s2 is '"+s1+s2+"'", 160, 35);
  text ("s1+\", \"+s2 is '"+ s1+", "+s2+"'", 160, 50);
  text ("Let s1 = \"To be or not to be, that is the question.\"", 10, 75);
  s1 = s1 + ", " + s2;
  text ("Then s1.length() is "+s1.length(), 25, 90);
  text ("s1.charAt(0) is '"+s1.charAt(0)+"'", 160, 90);
  text ("s1.charAt(6) is '"+s1.charAt(6)+"'", 160, 105);
  text ("s1.charAt(13) is '"+s1.charAt(13)+"'", 160, 120);
  text ("s1.charAt(41) is '"+s1.charAt(40)+"'", 160, 135);
  text ("The length() function returns the number of characters in the string.", 10, 150);
  text ("The index of the final character is length()-1. It's an error to index past the end.", 10, 165);
  text ("Putting a \" into a string is done by using a backslash: \\\" does it.", 10, 180);

  text ("s1.substring (0, 10) is \""+s1.substring(0,10)+"\"", 15, 200);
  text ("s1.substring (10, 20) is \""+s1.substring(10,20)+"\"", 15, 215);
  text ("s1.substring (12) is \""+s1.substring(12)+"\"", 15, 230);
  text ("s1.substring (20, s1.length()-1) is \""+s1.substring(20,s1.length()-1)+"\"", 15, 245);
  noLoop();
}
void draw () { }
