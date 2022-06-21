void setup ()
{
  size (300, 200);
  fill (255, 0, 0);
}

void draw ()
{
  line (100, 0, 100, height);
  textAlign(LEFT); text ("LEFT", 100, 50);
  line (0, 50, width, 50);
  textAlign(CENTER); text ("CENTER", 100, 90);
  line (0, 90, width, 90);
  textAlign(RIGHT); text ("RIGHT", 100, 130);
  line (0, 130, width, 130);
  textAlign (LEFT, BASELINE); text ("BASELINE", 200, 50);
  line (200, 0, 200, height);
  textAlign (LEFT, CENTER); text ("CENTER", 200, 90);
  textAlign (LEFT, TOP); text ("TOP", 200, 130);
}
