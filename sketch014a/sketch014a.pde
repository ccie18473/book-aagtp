PImage img;                 // The image to be loaded
String name = "image.jpg"; // Name of the image file

void setup ()
{
  size (100,100);
  surface.setResizable(true);
  img = loadImage ("image.jpg");
  if (img == null)
  {
    println ("File image.jpg is missing.");
    exit();
  }
  surface.setSize(img.width, img.height);
}

void draw()
{
  image (img, 0, 0); // Display the image
}
