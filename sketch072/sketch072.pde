import ddf.minim.*;

Minim minim;
AudioInput in;
AudioPlayer player;

void setup ()
{
  size(300, 300);
  minim = new Minim(this);
  in = minim.getLineIn(Minim.STEREO);
  player = minim.loadFile ("song.mp3");
  player.play();
  stroke(255);
  fill (100);
  frameRate(10);
}

void draw ()
{
  float ly, ry;
  
  background(0);
  ly = ry = 0;
  ly = abs(in.left.get(128))*2;
  ry = abs(in.right.get(128))*2;
  fill (255, 255, 0);
  text ("Left: "+"                  Right: ", 100, 230);
  text (""+(int)(ly*100)/100.0+"                   "
                  +(int)(ry*100)/100.0, 100, 250);
  rect (100, 200, 20, -ly*100);
  rect (200, 200, 20, -ry*100);
  if (player.length() <= player.position())
  {
    stop(); exit();
  }
}

void stop ()    // always close Minim audio classes when done with them
{
  in.close();
  minim.stop();
  super.stop();
}
