Ball[] shapes =  new Ball[50];
int drawCounter;
int frameCounter;
int count = 1000;
int colorCount;

void setup()
{
  size(1000, 1000);
  for(int i = 0; i < shapes.length; i++)
  {
    shapes[i] = new Ball();
    //colorCount = floor(random(180, 210));
  }

}
void draw() 
{
  colorMode(HSB);
  background(175, 250, 50);
  frameCounter+=1;
  println(frameCounter);
  println(drawCounter);
  
  if(frameCounter<count)
  {
    drawCounter = 0;
  } else if (frameCounter % count==0)
    {
      drawCounter+=1;
      if(colorCount>360)
      {
        colorCount = 0;
      }else
            colorCount += 45 ;

    }
    
  for(int i = 0; i<shapes.length; i++)
  {
    shapes[i].display();
    shapes[i].move(); 
  }
}
