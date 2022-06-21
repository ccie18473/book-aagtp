import ddf.minim.*;
int asliderX=10, asliderY=100, avalue=0, sliderWidth=100;
int bsliderX=10, bsliderY=150, bvalue=0;
int asliderPos=0, bsliderPos=0, sliderMin=0, sliderMax=1000;
AudioPlayer playera, playerb;
Minim minim;
void setup ()
{
  size(300,300);
  minim = new Minim(this);
  playera = minim.loadFile ("sounda.mp3");
  playerb = minim.loadFile ("soundb.mp3");
  playera.loop(); playerb.loop();

  playera.setGain(-100);
  playerb.setGain(-100);
}
void draw ()
{
  background (200); fill (0);
  drawSliders ();
}
void drawSliders ()
{
  line (asliderX, asliderY, asliderX+sliderWidth, asliderY);
  ellipse (asliderX+asliderPos, asliderY, 12,12);
  text (avalue, asliderX+sliderWidth+7, asliderY);
  line (bsliderX, bsliderY, bsliderX+sliderWidth, bsliderY);
  ellipse (bsliderX+bsliderPos, bsliderY, 12,12);
  text (bvalue, bsliderX+sliderWidth+7, bsliderY);
}
void mouseDragged ()
{
  if ((mouseY>=asliderY-6) && (mouseY<=asliderY+6))
  {
    if ((mouseX>=asliderX) && (mouseX<=asliderX+sliderWidth))
    asliderPos = mouseX - asliderX;
    avalue = (int)(((float)asliderPos/100)*sliderMax + sliderMin);
    playera.setGain(avalue/1000.0 * 94 - 80);
  }
  if ((mouseY>=bsliderY-6) && (mouseY<=bsliderY+6))
  {
    if ((mouseX>=bsliderX) && (mouseX<=bsliderX+sliderWidth))
    bsliderPos = mouseX - bsliderX;
    bvalue = (int)(((float)bsliderPos/100)*sliderMax + sliderMin);
    playerb.setGain(bvalue/1000.0 * 94 - 80);
  }
}
