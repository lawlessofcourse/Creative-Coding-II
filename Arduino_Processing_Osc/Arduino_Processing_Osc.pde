//FOR VIDEO FOLLOW LINK TO BOX IN README
import processing.sound.*;
import processing.serial.*;
Serial myPort;        // The serial port
int xPos = 1;         // horizontal position of the graph
float inByte = 0;

SinOsc sine;
SawOsc saw;
PinkNoise noise;
TriOsc triOsc;

float freq;
float freqy;

boolean b1;
boolean b2;
boolean b3;
boolean b4;

Env env;

float attackTime = 0.001;
float sustainTime = 0.004;
float sustainLevel = 0.3;
float releaseTime = 0.4;

void setup () {
  // set the window size:
  size(400, 300);

  // List all the available serial ports
  // if using Processing 2.1 or later, use Serial.printArray()
  printArray(Serial.list());

  // I know that the first port in the serial list on my Mac is always my
  // Arduino, so I open Serial.list()[0].
  // Open whatever port is the one you're using.
  myPort = new Serial(this, Serial.list()[0], 9600);

  // don't generate a serialEvent() unless you get a newline character:
  myPort.bufferUntil('\n');

  // set initial background:
  background(0);
  sine = new SinOsc(this);
  saw= new SawOsc(this);
  noise = new PinkNoise(this);
  env  = new Env(this); 
  triOsc = new TriOsc(this);
}

void draw () {
  float pos = mouseX;
  pos = map(pos, 0, width, -1, 1);
  freq = mouseX;
  freq = map(freq, 0, width, 55, 440);
  freqy = mouseY;
  freqy = map(freqy, 0, height, 55, 880);
  if ( b1) {
    sine.play(freq, 0.35);
    sine.amp(0.35);
  }
  if ( b2) {
    saw.play(freq, 0.25);
    saw.pan(pos);
    saw.amp(0.25);
  }
  if(b3)
  {
    triOsc.play(110,0.2);
    triOsc.amp(0.2);
  }
  if(b4)
  {
    noise.play();
    noise.amp(0.25);
  }

  // draw the line:
  stroke(127, 34, 255);
  line(xPos, height, xPos, height - inByte);

  // at the edge of the screen, go back to the beginning:
  if (xPos >= width) {
    xPos = 0;
    background(0);
  } else {
    // increment the horizontal position:
    xPos++;
  }
}


void serialEvent (Serial myPort) {

  // get the ASCII string:
  String inString = myPort.readStringUntil('\n');

  //if (inString != null) {
  // trim off any whitespace:
  inString = trim(inString);
  // convert to an int and map to the screen height:
  inByte = float(inString);
  float inNum = inByte;
  println(inByte);
  inByte = map(inByte, 0, 1023, 0, height);



  if (inNum>1000&&inNum<1023)
  {
    b1=true;
  }
  if (inNum > 940 &&inNum <=963)
  {
    b2=true;
  }
  if (inNum > 509 && inNum <515)
  {
    b3=true;
  }

  if (inNum > 4 && inNum <12)
  {
    b4=true;
  }
}
