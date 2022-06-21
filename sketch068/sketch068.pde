PImage prop;
float angle = 0.0;
void setup ()
{
  prop = loadImage("props.gif");
  size(400, 200);
}

void draw ()
{
  background(255);
  fill (128); noStroke();
  ellipse (175, 100, 30, 40);  // Draw simple aircraft
  rect (50, 95, 250, 10);
  stroke (128);
  line (175, 100, 175, 75);
  drawProp (100, 100);        // Left propeller
  drawProp (250, 100);        // Right propeller
}

void drawProp(int x, int y)
{
  pushMatrix();    // Save state on entry to the function
  translate(x, y); // Translate to the specified propeller position
  scale (0.2);     // Make it smaller
  rotate(angle);   // rotate the propeller as a whole
  angle = angle + 0.1;
  image (prop, 0, 0);      // Draw the first prop section
  pushMatrix();            // save state
    rotate(PI/2);          // Rotate 90 degrees
    image (prop, 0, 0);    // draw second prop section
  popMatrix();             // restore
  pushMatrix();            // Save again
    rotate(PI);            // Rotate by 180 degrees
    image (prop, 0, 0);    // draw third prop section
  popMatrix();             // Restore
  pushMatrix();            // save one more time
    rotate(-PI/2);         // Rotate 270 degrees (-90)
    image (prop, 0, 0);    // Draw final section
  popMatrix();             // restore
  ellipse (0, 0, 30, 30);  // draw the center part of the propeller
  popMatrix();    // Restore state to what it was when function was called
}
