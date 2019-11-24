import supercollider.*;
import oscP5.*;
import netP5.*;
Synth synth;
Synth growl;
import processing.serial.*;
Serial myPort;        // The serial port
int xPos = 1;         // horizontal position of the graph
float inByte = 0;

void setup()
{
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
 synth = new Synth("synthy");

 
 synth.set("amp", 0.0);
 synth.set("freq",440);
 synth.set("gate", 1);
 synth.set("sustain",1);
 synth.set("modFreq",880);
 synth.set("rate",0.5);
 synth.set("depth",0.05);
 
 //synth.create();
  growl = new Synth("wubsConst");
  
  growl.set("freq",110);
  //growl.set("inSigFreq",440);
  growl.set("freqA",698.46);
  growl.set("freqB", 43.625);
  growl.set("freqDur",20);
  growl.set("vRate",0);
  growl.set("vDepth",2);
  growl.set("amp", 0.0);
  growl.set("freq2", 0);
  
  //growl.create();
}

void draw()
{
  
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
  //println(inByte);
  inByte = map(inByte, 0, 1023, 0, height);


  if (inNum>1000&&inNum<1023)
  {
   
       synth.create();
      // synth.set("amp",0.5);
    
  }
  if (inNum > 940 &&inNum <=963)
  {
    growl.create();
    //growl.set("amp",0.5);
  }
  if (inNum > 509 && inNum <515)
  {

    
  }

  if (inNum > 4 && inNum <12)
  {

  }
}
void exit()
{
  synth.free();
  super.exit();
}
