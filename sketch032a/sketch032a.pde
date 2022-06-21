PImage []frames = new PImage[12];
int nFrames = 11, n=0;
void setup ()
{
  size(100,100);
  surface.setResizable(true);
  frames[0] = loadImage("a000.bmp");
  frames[1] = loadImage("a001.bmp");
  frames[2] = loadImage("a002.bmp");
  frames[3] = loadImage("a003.bmp");
  frames[4] = loadImage("a004.bmp");
  frames[5] = loadImage("a005.bmp");
  frames[6] = loadImage("a006.bmp");
  frames[7] = loadImage("a007.bmp");
  frames[8] = loadImage("a008.bmp");
  frames[9] = loadImage("a009.bmp");
  frames[10] = loadImage("a010.bmp");
  surface.setSize(frames[0].width, frames[0].height);
}
void draw ()
{
  frameRate (10);
  image (frames[n], 0, 0); // Display the Frame
  n = (n + 1)%nFrames;
}
