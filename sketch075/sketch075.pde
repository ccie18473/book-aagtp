import ddf.minim.*;
Minim minim;
AudioInput in;
AudioPlayer player;

void setup ()
{
  size(512, 300);
  minim = new Minim(this);
  in = minim.getLineIn(Minim.STEREO, 1024);
  stroke(255);
  fill(100);
  frameRate(10);
}

void draw ()
{
  float ly, y=0;

  background(0);
  ly = 0;
  for (int i=0; i<1024; i=i+2)
  {
    ly = in.left.get(i)*100+height/2;
    if (i!=0) line (i,y, i+2, ly);
    y = ly;
  }
  
}
// always close Minim audio classes when you are done with them
void stop ()
{
  in.close();
  minim.stop();
  super.stop();
}
