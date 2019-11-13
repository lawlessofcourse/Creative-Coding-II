int[] myArray = new int[5];

void setup()
{
  size(1000,1000);
  myArray[0] = 1;
  myArray[1] = 2;
  myArray[2] = 3;
  myArray[3] = 4;
}

void draw()
{
  background(0);
  textSize(32);
  text(myArray[0],100,100);
  text(myArray[1],100,150);
  text(myArray[2],100,200);
  text(myArray[3],100,250);
  
}
