float wpx[] = { 172, 221, 354, 787, 848, 846, 747, 645, 198};
float wpy[] = { 217, 166, 129, 100, 165, 536, 869, 884, 734};
float wpa[] = { 39, 70, 80, 135, 175, 195, 260, 290, 354}; // Degrees
PImage track;
float x=wpx[8], y=wpy[8], dx, dy;
int wayPoint = 8, speed=2, N= wpx.length;
boolean lines = true;
void setup ()
{
  size(100,100);
  surface.setResizable(true);
  track = loadImage("road.png");
  surface.setSize(track.width, track.height);
}

void draw ()
{
  fill (255, 0, 0);
  image(track, 0, 0);
  if (lines) for (int i=0; i<N; i++)   // Draw lines?
    line(wpx[i], wpy[i], wpx[(i+1)%N], wpy[(i+1)%N]);
  translate (x, y);                    // Rotate car to face motion
  rotate (radians(wpa[wayPoint]));
  rect (0, 0, 5, 10);                  // Arrived at waypoint?
  if (distance (x, y, wpx[(wayPoint+1)%N], wpy[(wayPoint+1)%N]) < speed)
  {
    wayPoint = (wayPoint+1)%N;         // Yes. Aim at next one
    x = wpx[wayPoint];
    y = wpy[wayPoint];
  }                     // Change x and y car position
  dx = speed * (wpx[(wayPoint+1)%N]-wpx[wayPoint])/
        distance (wpx[wayPoint],wpy[wayPoint], wpx[(wayPoint+1)%N],
        wpy[(wayPoint+1)%N]);
  dy = speed* (wpy[(wayPoint+1)%N]-wpy[wayPoint])/
        distance (wpx[wayPoint],wpy[wayPoint], wpx[(wayPoint+1)%N],
        wpy[(wayPoint+1)%N]);
  x = x + dx; y = y + dy;
}

float distance (float x0, float y0, float x1, float y1)
{ return sqrt ( (x0-x1)*(x0-x1) + (y0-y1)*(y0-y1) ); }

void keyPressed ()
{
  if (key == ' ') lines = !lines;                // Toggle waypoint display.
  if (key == 'w') speed = speed+1;               // Faster
  if (key == 's') if (speed>0) speed = speed-1;  // Slower, but not backwards
}
