int questionNo = 0;
String [] question;
int select = 0;
String list[];

void setup ()
{
  question = loadStrings("questions.txt");
  list = new String[question.length];
  size (600, 300);
}

void draw ()
{
  background(200);
  drawGraphic();
  fill (0);
  textSize (20);
  text ((questionNo+1)+". "+question[questionNo], 20, 70);
}

void drawGraphic ()
{
  text ("Strongly Disagree 1 2 3 4 5 Strongly Agree",
          20, 140);
  noFill();
  if (select==1) fill(0); else noFill();
  ellipse (230, 180, 15, 15);
  if (select==2) fill(0); else noFill();
  ellipse (260, 180, 15, 15);
  if (select==3) fill(0); else noFill();
  ellipse (290, 180, 15, 15);
  if (select==4) fill(0); else noFill();
  ellipse (320, 180, 15, 15);
  if (select==5) fill(0); else noFill();
  ellipse (352, 180, 15, 15);
}

void mouseReleased ()
{
  if (mouseY<173 || mouseY > 188) return;
  if (mouseX>=223&&mouseX<=238) select = 1;
  if (mouseX>=253&&mouseX<=268) select = 2;
  if (mouseX>=283&&mouseX<=298) select = 3;
  if (mouseX>=313&&mouseX<=328) select = 4;
  if (mouseX>=345&&mouseX<=360) select = 5;
}
void keyPressed ()
{
  list[questionNo] = "Question "+str(questionNo+1)+" "+str(select);
  questionNo = questionNo + 1;
  if (questionNo >= question.length)
  {
    saveStrings("save.txt", list);
    exit();
  }
}
