int x0 = -1, y0 = -1;             // The first pixel clicked on
int x1 = -1, y1 = -1;             // The second pixel clicked on
color beige = color(200,200,200); // Background
color black = color(0,0,0);       // The color black (text)
color green = color (100,255,40); // Circle color
boolean bothPixelsSet = false;    // Mouse clicked twice?
int textX=100, textY=250;         // Where to draw the distance
int circleSize = 5;               // Size of the circles at the click points

void setup ()                     // Set up a 300x300 window
{ size (300, 300); }
void draw()
{
  background(beige);              // Fill the window with beige
  fill (green);                   // Objects will be filled with green
  if (x0 >= 0)                    // x0 >= 0 means it has been set
    ellipse (x0, y0, circleSize, circleSize);
  if (x1 >= 0)                    // x1 >= 0 means it has been set
    ellipse (x1, y1, circleSize, circleSize);
  if (bothPixelsSet)
  {
    fill (black);                 // Set text color
    text ("Distance is "+distance(x0,y0,x1,y1), textX, textY);
  }
}
// Compute the distance between two points
float distance (int x0, int y0, int x1, int y1)
{
  float d;
  d =sqrt( (x0-x1)*(x0-x1) + (y0-y1)*(y0-y1));
  return d;
}
// Mouse is released when a point is defined
void mouseReleased ()
{
  if (x0 < 0)                      // First click has not been made
  { x0 = mouseX; y0 = mouseY;
  } else if (x1 < 0)               // This is the second click
  {   x1 = mouseX; y1 = mouseY;
      bothPixelsSet = true;
  }
}
