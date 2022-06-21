import ddf.minim.*;
float facing=0, delta=0;
float x=300, y=200, dx=1, dy=0;
AudioPlayer player;
Minim minim;
void setup ()
{
  size(400, 400);
  minim = new Minim(this);
  player = minim.loadFile ("sound.mp3");
  player.loop();
}

void draw ()
{
  background(200);
  ellipse (200, 200, 10, 10); ellipse (x, y, 10, 10);
  line (x, y, 200, 200); line (x, y, x+10*dx, y+10*dy);
  text ("Angle is "+theta (x, y, 200, 200)+" Facing "+
      facing+" Delta is "+delta+" Pan is "+(-sin(radians(delta))), 10, 30);
}

float theta (float x0, float y0, float x1, float y1)
{
  float x;
  x = (float)atan2(y1-y0, x1-x0);
  if (x<0) x = x + 2*PI;
  return degrees(x);
}

void keyPressed ()
{
  if (key == 'w')  // Move 'forward'
  { x += 5*dx;  y += 5*dy; }
  else if (key == 's')  // Move 'backward'
  { x -= 5*dx;  y -= 5*dy; }
  else if (key == 'a') facing = facing - 1.0;  // Turn left
  else if (key == 'd') facing = facing + 1.0;  // Turn right
  if (facing < 0) facing = facing + 360;
  else if (facing>360) facing = facing - 360;
  dx = cos(radians(facing)); dy = sin(radians(facing));
  delta = facing - theta(x, y, 200, 200);
  player.setPan (-sin(radians(delta)));
}
