import processing.serial.*;
Serial myPort;
int val;

void setup()
{
  size(1280,720);
  background(0);
  serialSetup();
}

void draw()
{

}

void serialSetup()
{
  //printArray(Serial.list());
  
  String portName = Serial.list()[0]; 
  myPort = new Serial(this, portName, 9600);
 
}

void serialEvent(Serial myPort)
{
     while(myPort.available()>0)
  {
    int val = myPort.read();
    println(val);
  }
  int numVal = myPort.read();
  String sVal = myPort.readString();
  //println(numVal);
  //println(sVal);
  //println(numVal);
  
  
}
