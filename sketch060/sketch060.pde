PImage track;
float eyey = 20,eyex = 213,eyez = 400.0;
float cx=200.0, cy=5.0, cz= 200.0,dx = 0.0, dz = 1.0;
float angle = 265.0, velocity=0.,carX=200, carY=0, carZ=310;

void setup ()
{
  size (600, 400, P3D);
  track = loadImage ("road.png");
  keyPressed();
  fill (180, 30, 30);
}

void draw ()
{
  background(0);
  beginShape(QUADS);
    texture (track);
    vertex (0, 0, 0, 0, 0);
    vertex (1000, 0, 0, 1000, 0);
    vertex (1000, 0, 1000, 1000, 1000);
    vertex (0, 0, 1000, 0, 1000);
  endShape();
  translate (carX, 4, carZ);
  rotateY(-radians(angle));
  box(20, 5, 10);
  carX = carX + velocity*dx;
  carZ = carZ + velocity*dz;
  eyex = carX - dx*50; eyez = carZ - dz*50;
  camera (eyex, eyey, eyez, cx, cy, cz, 0.0, -1.0, 0.0);
}

void keyPressed ()
{
  if (key == 'w') velocity += .1;  // Move 'forward'
  if (key == 's') velocity -= .1;  // Move 'backward'
  if (key == 'a') angle = angle +2.0;  // Turn left a unit (CCW)
  if (key == 'd') angle = angle -2.0;  // Turn right a unit (CW)
  if (angle < 0) angle = angle + 360.0;
  else if (angle > 360.0) angle = angle - 360.0;
  dx = cos(radians(angle)); dz = sin(radians(angle));
  cx =(int)(dx*20000.0); // cx = x coordinate of center point = cos(angle)*20000
  cz =(int)(dz*20000.0); // cz = z coordinate of center point = sin(angle)*20000
}
