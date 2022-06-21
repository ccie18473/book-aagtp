float jangle1=-40, jangle2=22, jangle3=90;
PImage armA, armB, armC;
void setup ()
{
  size(500, 500);
  armA = loadImage ("robotA.gif");
  armB = loadImage ("robotB.gif");
  armC = loadImage ("robotC.gif");
  fill (200, 200, 110);
}

void draw ()
{
  background(100, 100, 100, 1);
  makeArm();
}

void makeArm ()
{
  translate (100, 400);
  rect (0, 0, 100, 100);
  translate (50, 40);
  pushMatrix();
  translate (-31, -37); rotate (radians(jangle1));
  pushMatrix();
  translate (137, -13); rotate(radians(jangle2));
  pushMatrix();
  translate (137, -11); rotate (radians(jangle3));
  translate (-16, -15); image (armC, 0, 0);
  popMatrix();
  translate (-30, -25); image(armB, 0, 0);
  popMatrix();
  translate (-31, -37); image (armA, 0, 0);
  popMatrix();
}
void keyPressed ()
{
  if (key=='q') jangle1 = jangle1-1;
  if (key=='e') jangle1 = jangle1+1;
  if (key=='a') jangle2 = jangle2-1;
  if (key=='d') jangle2 = jangle2+1;
  if (key=='z') jangle3 = jangle3-1;
  if (key=='c') jangle3 = jangle3+1;
}
