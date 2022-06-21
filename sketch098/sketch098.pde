final int Ncols = 12, Nrows = 3;
boolean exists [][] = new boolean[Ncols][Nrows];
int x, y, dx, dy, px, py, score = 0, life=5;
int direction = 0;
void setup ()
{
  size (400, 400); fill (200, 40, 40);
  for (int i=0; i<Ncols; i++) // All bricks exist
    for (int j=0; j<Nrows; j++) exists[i][j] = true;
  x = (int)random(300)+100; y = 150; // Random X start
  dx=1; dy=-2; px = 120; py = 300; // Initial paddle position
}

void draw ()
{
  background(200);
  for (int i=0; i<Ncols; i++) // Draw all bricks
    for (int j=0; j<Nrows; j++)
      if (exists[i][j]) rect (i*30+20, j*15+30, 30, 15);
  line (px-30, py, px+30, py); // Paddle
  ellipse (x, y, 3, 3); move(); // Ball
  text ("Score: "+score+"          Lives remaining: "+life,20,350);
  if (score>=36) text (" YOU WIN!",100, 300);
  else if (life <= 0)
  {
    text (" YOU LOSE!",100, 300);
    noLoop(); // Win or lose.
  }
}
void keyPressed () // Use the 'a' and 'd' keys to move the paddle
{
  if (key == 'a' && px > 30) direction = -4;
  else if (key == 'd' && px<width-30) direction = 4;
  else direction = 0;
}

void keyReleased ()
{
  direction = 0;
}

void move () // Move the ball
{
  x = x + dx; y = y + dy; // Basic move
  px = px + direction;
  if (x<2|| x>width-2) dx = -dx; // X bounce?
  if (y>=py-1&&y<=py+1 && (x>=px-30&&x<=px+30)) dy = -dy; // Paddle bounce
  if (y<0) dy = -dy; // Y bounce top
  for (int i=0; i<Ncols; i++) // Ball hits a brick
    for (int j=0; j<Nrows; j++)
      if(exists[i][j] && x>=i*30+20 && y>=j*15+30 &&
        x<=i*30+50 && y<=j*15+45)
      {
        exists[i][j] = false; // Brick is destroyed
        dy = -dy; score++; // Ball bounces, score
      }
  if (y>height) // Ball through the bottom
  {
    if (score < 36) life--; y=150; // Lose a life, restart the ball
    x = (int)random(width-100+50);
  }
}
