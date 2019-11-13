int[] myArray = new int[5];
int yLocation = 100;
void setup()
{
  size(1000,1000);
  // populate the array here
  for(int i = 0; i < myArray.length; i++)
  {
     myArray[i] = i; 
  }
}

void draw()
{
  background(0);
  textSize(32);
  // print out the numbers with the for loop
  for(int i = 0; i < myArray.length; i++)
  {
    text(myArray[i],100,yLocation);
    yLocation += 50;
    
  }
  // reset the location of the y so that we can print it again
  yLocation = 100;
  
}
