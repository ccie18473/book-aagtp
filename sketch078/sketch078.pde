import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;
AudioOutput out;
PImage piano;

void setup ()
{
  size(100,100);
  surface.setResizable(true);
  piano = loadImage ("piano.png");
  surface.setSize(piano.width, piano.height);
  minim = new Minim(this);
  out = minim.getLineOut(Minim.STEREO);
}

void draw ()
{
  image (piano,0,0);
}

void mousePressed ()
{
  if (mouseX<20) out.playNote(0, 1, 440.0);
  else if (mouseX < 38) out.playNote(0, 1, 493.9);
  else if (mouseX < 57) out.playNote(0, 1, 523.3);
  else if (mouseX < 77) out.playNote(0, 1, 587.3);
  else if (mouseX < 95) out.playNote(0, 1, 659.3);
  else if (mouseX < 114) out.playNote(0, 1, 698.5);
  else if (mouseX < 134) out.playNote(0, 1, 784.0);
}

void mouseReleased ()
{
  out = minim.getLineOut(Minim.STEREO);
}

void keyPressed ()
{
  out.close();
  super.stop();
  exit();
}
