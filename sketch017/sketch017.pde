PImage img;           // Original image
boolean mag = false;  // Has the mouse been pressed?
PImage sub;           // Smaller, magnified image

void setup ()
{
  size (100,100);
  surface.setResizable(true);
  img = loadImage ("image.jpg");
  surface.setSize(img.width, img.height);
}

void draw ()
{
  background (200, 200, 200);
  image (img, 0, 0); // Display the image

  if (mag)           // If the mouse is being pressed,
                     // compute and display
  {                  // a rectangular and magnified region
                     // with mouse at UL
    stroke(200);
    noFill();    
    rect (mouseX, mouseY, 100, 100);   // Outline the magnified region
    sub = get(mouseX, mouseY, 50, 50); // Get the sub-image
    sub.resize (100,100);              // Double its size
    image (sub, mouseX, mouseY);       // Draw the sub-image
  }
}

// Set the flag 'mag' when the mouse button is pressed.
void mousePressed ()
{
  mag = true;
}

// Clear the flag 'mag' when the mouse button is released.
void mouseReleased ()
{
  mag = false;
}
