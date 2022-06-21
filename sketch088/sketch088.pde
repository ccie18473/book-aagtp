float queue[] = new float[200], end=2.0e3;
float miaTime=16.0, msTime=8.0,arrival,departure;
int Nqueue=0, nq;
float qsum=0.0, time=0.0;
void setup ()
{
  size (500, 350);
  fill(0);
  arrival=-miaTime*log(random(1));
  departure = end*2;
}
void draw ()
{
  if (time>end) return;
  background(200);
  if (arrival<departure)
  { // An arrival
    into(time + -msTime*log(random(1)));
    arrival = time + -miaTime*log(random(1));
    if (departure>end) departure = queue[Nqueue-1];
    time = arrival;
  } else if (departure<end)
  { // A departure
    out();
    time = departure;
    if (Nqueue>0) departure = queue[Nqueue-1];
    else departure = end*2;
  }
  fill (0); text ("Time "+time+" Length is "+Nqueue+" Mean length "+(qsum/nq),30,145);
  nq += 1; qsum += Nqueue;
}

void into(float t)
{
  queue[Nqueue] = t;
  Nqueue = Nqueue + 1;
}

void out ()
{
  if (Nqueue <= 0) return;
  for (int i=0; i<Nqueue-1; i++) queue[i] = queue[i+1];
  Nqueue = Nqueue - 1;
}
