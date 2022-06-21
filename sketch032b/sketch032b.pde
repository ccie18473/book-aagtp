int MAXFRAMES = 100;
PImage []frames = new PImage[MAXFRAMES];
int nFrames = 0, n=0;
void setup ()
{
  for (int i=0; i<MAXFRAMES; i++)
  {
    if (i<10)
      frames[i] = loadImage("a00"+i+".bmp");
    else
      frames[i] = loadImage("a0"+i+".bmp");
    if (frames[i] == null)
    {
      nFrames = i;
      break;
    }
  }
  size(100,100);
  surface.setResizable(true);
  surface.setSize(frames[0].width, frames[0].height);
}
void draw ()
{
  frameRate (10); // Can't appear in 'settings' function. Could use 'setup'.
  image (frames[n], 0, 0); // Display the Frame
  n = (n + 1)%nFrames;
}
