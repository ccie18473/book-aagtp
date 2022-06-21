int cx=259, cy=380;
float hr = 8;
float mr = 15;
float sr = 20.0;
PImage clock;

void setup ()
{
  size(100,100);
  surface.setResizable(true);
  clock = loadImage ("clock.jpg");
  surface.setSize(clock.width, clock.height);
}

void draw ()
{
  float s, m, h;
  float angle, x, y;

  background(200);
  image (clock, 0, 0);

  s = radians(second()*6 - 90.0);
  m = radians(minute()*6 - 90.0);
  h = hour();

  if (h > 12) h = h - 12;
  h = radians(hour()*30.0-90.0) + radians(minute()*0.5);

  stroke(21);   // Draw the hands
  strokeWeight (2);
  line (cx, cy, cx + cos(s)*sr, cy + sin(s)*sr);
  line (cx, cy, cx + cos(m)*mr, cy + sin(m)*mr);
  strokeWeight(3);
  line (cx, cy, cx + cos(h)*hr, cy + sin(h)*hr);
}
