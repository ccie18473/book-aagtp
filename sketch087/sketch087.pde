float m0,m1, sum=0;
int wait = 0, count=0;
boolean timing = false;

void setup ()
{
  size (400, 200);
  fill (0);
}

void draw ()
{
  if (timing) background(0,200,0);
  else background(200);
  text ("Count is "+count+"  You need "+(5-count)+" more trials.", 10, 180);
  text ("When the background turns green, click the mouse.", 10, 20);
  wait = wait + 1;
  if (wait > random (5000) && !timing)
  {
    background(0, 200, 0);
    timing = true;
    m0 = millis();
  }
  if (count == 5)
  {
    noLoop();
    sum = sum/count;
    text ("Reaction time is "+sum/1000 + " seconds.", 20, 100);
  }
}

void mousePressed ()
{
  if (timing)
  {
    m1 = millis();
    timing = false;
    sum = sum + (m1-m0);

    count = count + 1;
    wait = 0;
  }
}
