import processing.video.*;

boolean playing = true;
Movie movie;
int frame = 1;

void setup ()
{
  movie = new Movie(this, "car.avi"); // Create the instance of Movie
  size(320, 300);
  movie.play();   // Start playing
}

void draw ()
{
  if (movie.available())  // New frame?
  {
    movie.read();         // Read it
    frame = frame + 1;    // Count it
  }
  image(movie,0,0);       // Display the current frame
  text ("Frame "+frame+" Time: "+ (float)((int)(movie.time()*100))/100, 10, 20);
  if (movie.time() >= movie.duration())  // End
  {
    frame = 1; movie.jump(0);  // Restart the counters. Rewind.
  }
}

void mouseReleased ()
{
  if (playing)
  {
    movie.pause();
    playing = false;
  } else
  {
    movie.play();
    playing = true;
  }
}
