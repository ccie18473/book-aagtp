int sliderX=10, sliderY=100, sliderWidth=100, sliderHeight=8;
color sliderColor = color(128,128,128);
int sliderPos=0, sliderMin=0, sliderMax=1000;
int value=0;

void setup ()
{
  size(600,300);
}

void draw ()
{
  background (200);
  drawSlider ();
}

void drawSlider ()
{
  fill (sliderColor); // The bar part
  rect (sliderX, sliderY, sliderWidth, sliderHeight);
  fill (200,40,40);   // Slider partl
  ellipse (sliderX+sliderPos, sliderY+sliderHeight/2,12,12);
  fill (0);
  line (sliderX+sliderPos, sliderY, sliderX+sliderPos, sliderY+sliderHeight);
  text (value, sliderX+sliderWidth+7, sliderY+sliderHeight);
}

void mouseDragged()
{
  if ((mouseY<sliderY) || (mouseY>sliderY+sliderHeight))
    return;
  if ((mouseX>=sliderX) && (mouseX<=sliderX+sliderWidth))
    sliderPos = mouseX - sliderX;
  value = (int)(((float)sliderPos/sliderWidth)*sliderMax + sliderMin);
}
