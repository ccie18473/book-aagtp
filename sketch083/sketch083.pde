import processing.video.*;

PImage display;
Movie movie;

void setup ()
{  // Create the instance of Movie
  movie = new Movie(this, "car.avi");
  size(320, 480);
  movie.play();    // Start playing
  movie.frameRate(15);
  fill (0);
  display = createImage (320, 300, RGB);
}

void draw ()
{
  background (255);
  if (movie.available())
  {
    movie.read();// Read it
    thresh();
  }
  image(display,0,0);
  image (movie, 0, 240);

  text ("  Time: "+ (float)((int)(movie.time()*100))/100, 10, 20);
}
void thresh ()
{
  color p,q;
  movie.loadPixels();
  for (int i=0; i<movie.pixels.length; i++)
  {
    p = movie.pixels[i];
    if ((red(p)+green(p)+blue(p))/3 < 100) q = color(0,0,0);
    else q = color(255,255,2525);
    display.pixels[i] = q;
  }
  display.updatePixels();
}
