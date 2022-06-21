int z = 50, dz = 1;
void setup ()

{
  size(400, 300, P3D);
}


void draw ()
{
  background (200);
  noStroke();
  lights();
  translate(100, 150, z);
  sphere(50);
  translate(200, 0, 0);
  stroke (0);
  sphere (50);
  z = z + dz;
  if (z > 50) dz = -dz;
  if (z < -350) dz = -dz;
}
