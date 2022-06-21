import ddf.minim.*;
Minim minim;
AudioInput input;
AudioRecorder recorder;
void setup ()
{
  size(512, 200);
  minim = new Minim(this);
  input = minim.getLineIn(Minim.STEREO, 1024);
  recorder = minim.createRecorder(input, "processing.wav", true);
}

void draw ()
{
  background(0); stroke(255);
  for(int i = 0; i < input.left.size()-1; i++)
    line (i,input.left.get(i)*100+height/2, i+1,
          input.left.get(i+1)*100+height/2);

  if (recorder.isRecording())
  {
    fill(255, 0, 0);
    text("Recording. Type 'q' to quit recording.", 5, 15);
  } else
  {
    fill(0, 255, 0);
    text("Type 'r' to record.", 5, 15);
  }
}

void keyReleased ()
{
  if ( key == 'r' && !recorder.isRecording()) recorder.beginRecord();
  else if (key == 'q' && recorder.isRecording()) recorder.endRecord();
  else if ( key == 's') recorder.save();
  else if ( key == '0') stop();
}

void stop ()
{
  input.close();
  minim.stop();
  super.stop();
  exit();
}
