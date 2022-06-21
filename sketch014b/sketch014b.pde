// Display error message if the image is not read in.

PImage img; // The image to be loaded

void setup ()
{
  fill(0);
  size (400,200);
  surface.setResizable(true);
  img = loadImage ("image.jpg"); // Load the original image
  if (img == null)
  {
    background(255,0,0);
    text ("Error: Image file not found", 100, 100);
  }
  else surface.setSize(img.width, img.height);
}

void draw() 
{
  if (img !=null) image (img, 0, 0); // Display the image
}
