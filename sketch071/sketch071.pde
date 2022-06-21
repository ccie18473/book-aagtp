import ddf.minim.*;
Minim minim;
AudioPlayer player;
float pan = 0;

void setup ()
{
  size (500, 400);
  minim = new Minim(this);
  player = minim.loadFile ("song.mp3");
//  player = minim.loadFile ("https://file-examples-com.github.io/uploads/2017/11/file_example_MP3_700KB.mp3");
  player.play();
  player.printControls();
  frameRate(10.0);
}

void draw ()
{
  float bal, vol=1, p, g;
  background (0);
  bal = player.getBalance();
  vol = player.getVolume();
  p = player.getPan();
  g = player.getGain();
  text ("Balance: "+bal+" Pan: "+p+" Volume: "+vol+" gain: "+g, 10, 40);
  player.setGain (vol-1.0);
}

void keyPressed ()
{
  if (key == 'a')
  {
    if (pan>-1) pan = pan - .1;
    player.setPan (pan);
  } else if (key == 'd')
  {
    if (pan<1.0) pan = pan+.1;
    player.setPan(pan);
  }
}
