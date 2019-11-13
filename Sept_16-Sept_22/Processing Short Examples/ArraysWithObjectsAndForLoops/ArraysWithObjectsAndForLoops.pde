MyCircle[] myCircles = new MyCircle[3];
int xLocation = 100;
int yLocation = 100;
int diameter = 50;
void setup()
{
  size(1000,1000);
  for(int i = 0; i < myCircles.length; i++)
  {
     myCircles[i] = new MyCircle(xLocation, yLocation, diameter); 
     xLocation += 100;
     diameter += 25;
  }
  
  
}

void draw()
{
  for(int i = 0; i < myCircles.length; i++)
  {
     myCircles[i].draw(); 
  }

}
