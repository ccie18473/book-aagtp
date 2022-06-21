PImage thermo;             // Thermometer image
int xpos=100, ypos=50;     // Position of upper left
int ystart = 240;          // Position of Y lowest point
int yend = 44;             // Position of Y highest point
int xstart = 32;           // Left of red column
int xend = 50;             // Right of red column
int dataMin=0, dataMax=90; // Range of data values
float delta = 1;
float data = 15.0;

void setup ()
{
  size (400, 400);                   // Window size
  thermo = loadImage ("thermo.gif"); // Read button images
  delta = (float)(ystart-yend)/(float)(dataMax-dataMin);
  rectMode (CORNERS);
  noStroke();
}

void draw ()
{
  int val;

  background (200);                                     // White background
  image(thermo, xpos, ypos);                            // Draw the basic thermometer
  val = ystart-(int)(data*delta);                       // Scale data to Y range
  fill (140, 4, 20);                                    // Fill with red
  rect (xstart+xpos, val+ypos, xend+xpos, ystart+ypos); // Draw red
  text (""+(int)data, xstart+xpos, ystart+ypos+30);     // Draw data value
  data = data + random(2) - 1;                          // Modify data for display purposes
  if (data > dataMax) data = dataMax;
  else if (data < dataMin) data = dataMin;
}
