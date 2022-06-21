float d2r = 3.14159/180.0;
void setup ()
{
  size (400, 400);
  noFill();
  stroke(255);
  ellipse (0,0,280,280);
  stroke(0);
  fill(0);
  
  line (100, 100, 200, 100);
  text ("0 degrees", 210, 100);

  rotate (radians(10));
  line (100, 100, 200, 100);
  rotate (-10*d2r);
  text ("10 degrees", 190, 140);
 
  rotate (20*d2r);
  line (100, 100, 200, 100);
  rotate (-20*d2r);
  text ("20 degrees", 165, 180);
}
