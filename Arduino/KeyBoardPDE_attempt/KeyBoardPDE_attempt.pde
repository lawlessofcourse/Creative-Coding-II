import cc.arduino.*;
//import org.firmata.*;

import processing.serial.*;

Arduino arduino;

Serial myPort;
int val;
int keyVal;
void setup()
{
  
 
  size(1280,720);
  background(0);
  printArray(Arduino.list());
  //arduino = new Arduino(this,Serial.list()[0],9600);
  //arduino.pinMode(8,Arduino.OUTPUT);
  //println(arduino);
  serialSetup();

}

void draw()
{
  //println(keyVal);
  //println(arduino.analogRead(4));
   
}

void serialSetup()
{
  //printArray(Serial.list());
  
  String portName = Serial.list()[0]; 
  myPort = new Serial(this, portName, 9600);
  
}

void serialEvent(Serial myPort)
{
   //println(myPort.read());
  while(myPort.available()>0)
  {
    int val = myPort.read();
    println(val);
  }
  
}
