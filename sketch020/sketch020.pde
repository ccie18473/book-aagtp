PImage img;        // Image to rotate
float angle = 0.0; // Angle of rotation

void setup ()
{
  size (100,100);
  surface.setResizable(true);
  img = loadImage ("image.jpg");
  surface.setSize(img.width*2, img.height*2);
}

void draw()
{
  background(200);                        // White background
  translate(img.width, img.height);       // Move image to origin
  rotate(angle);                          // Rotate
  translate (-img.width, -img.height);    // Move back
  image (img, img.width/2, img.height/2); // Draw
  angle = angle + 0.01;                   // Increment angle
}
