import processing.video.*;

boolean playing = true;
Movie movie;
float time = 1, ftime = 1, rate = 20;

void setup ()
{
  movie = new Movie(this, "car.avi");
  size(320, 300);
  ftime = 1.0/rate;
  time = movie.duration() - ftime;
  movie.play();  // Start playing
  fill (0);
}

void draw ()
{
  background(200);
  if (movie.available()) movie.read();          // Read it
  image(movie,0,0);       // Display the current frame
  text (" Time: "+ (float)((int)(movie.time()*100))/100, 10, 20);
  time = time - ftime;    // Control which is the next frame
  movie.jump(time);
  if ( (time < 0) || (time>movie.duration()) )
  {
    if (time<0) time = movie.duration() - ftime;
    else time = 0;
    movie.jump(time);       // Restart the counters. Rewind.
  }
  text ("Mouse click controls speed and direction", 50, 260);
  text (" Reverse                                                Forward", 30, 275);
  ellipse (160, 245, 3, 3);
  for (int i=160; i<320; i=i+30) ellipse (i, 245, 1, 1);
  for (int i=160; i>0; i=i-30) ellipse (i, 245, 1, 1);
  text (""+ -((int)(ftime*100))/100.0, 150, 275);
}

void mouseReleased ()
{
  if (mouseX < width/2) ftime = 3*((float)(width/2 - mouseX)/(width/2))/rate;
  else ftime = -3*(float)(mouseX-(width/2))/(width/2)/rate;
}
