int Nrabbits=190, Ncoyotes=16;
float time=0, alpha=.19, beta=0.008, gamma=0.15, delta=.0005;

void setup ()
{
  size (500, 500);
  frameRate(2);
  noStroke();
}

void draw ()
{
  background(200);
  fill (0,200,0);
  for (int i=0; i<Nrabbits; i++)
    ellipse (random(width),random(height),2,2);
  fill (200,0,0);
  for (int i=0; i<Ncoyotes; i++)
    ellipse (random(width),random(height),4,2);
  prey();
  predator();
}

void prey ()
{
  float dr=0.0;
  dr = alpha*Nrabbits - beta*Nrabbits*Ncoyotes;

  Nrabbits = (int)(Nrabbits + dr);
  if(Nrabbits<0) Nrabbits = 0;
  fill(0);
  text ("  Rabbits = "+Nrabbits, 10, 25);
}

void predator ()
{
  float dc=0.0;
  dc = delta*Nrabbits*Ncoyotes - gamma*Ncoyotes;
  Ncoyotes = (int)(Ncoyotes + dc);
  fill (0);
  text (" Coyotes now "+Ncoyotes, 150, 25);
}
