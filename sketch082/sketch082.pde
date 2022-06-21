import processing.video.*;

boolean saving = false;
Movie movie;
float time = 1, rate = 20;
int frame = 1, v = 0;
int nclicks = 0;

void setup ()
{
  movie = new Movie(this, "car.avi"); // Create the instance of Movie
  size(320, 300);
  movie.frameRate(rate);
  movie.play();    // Start playing
  fill (0);
}

void draw ()
{
  if (saving) background (0, 200, 20);
  else background(200);
  if (movie.available())
  {
    movie.read();           // Read it
    image(movie,0,0);       // Display the current frame
    if (saving)
    {
      v++;
      movie.save("frame"+ char(nclicks+int('a'))+v+".jpg");
      frame = frame + 1;
    }
  } else image(movie,0,0);

  text (" Time: "+ (float)((int)(movie.time()*100))/100, 10, 20);
  if (saving) text ("Saving file "+frame, 20, 275);
  if ( movie.time() >= movie.duration() )
    movie.jump(0); // Restart the video
}

void mouseReleased ()
{
  saving = !saving;
  if (!saving) {
    nclicks = nclicks + 1;
    v = 0;
  }
  if (nclicks > 25) nclicks = 0;
}
