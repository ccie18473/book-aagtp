PImage tv;
PImage back;
int x0=250, y0=445;
color WHITE = color (255, 255, 255, 90);
color BLACK = color (0,0,0, 90);

void setup ()
{
  size(350, 250);
  tv = loadImage("tv.jpg"); // Load TV set image
  back = loadImage ("screen.jpg");
}

void draw ()
{
  background (90, 90, 200); // Blue background
  image (tv, 20, 20);       // Display the TV
  snow (20, 20);            // Display random pixels on the screen
  // tint (255, 60);
  // image (back, 49, 49);
}

// Display random black/white pixels
void snow(int x, int y)
{
  for (int i=x+29; i<x+160; i++)   // TV Screen coordinate offsets fixed
    for (int j=y+29; j<y+115; j++) // at UL = 29,29 and LR = 152,115
      if (random(3)<1) set (i, j, color(0,0,0,4));
        else set (i,j, WHITE);
}
