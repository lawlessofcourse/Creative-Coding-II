int xLocation = 100;
int yLocation = 100;
int rectWidth = 50;
int rectHeight = 50;
void setup()
{
   size(1000,1000); 
}

void draw()
{
    // etch-a-sketch style
    rect(xLocation,yLocation,rectWidth, rectHeight);
}

void keyPressed()
{
  // move to the left
   if(key == 'a')
   {
       if((xLocation) >= 0)
       {
         xLocation -= 5;
       }
   }
   // move up
   else if(key == 'w')
   {
     if(yLocation >= 0)
     {
       yLocation -= 5;
     }
   }
   // move right
   else if(key == 'd')
   {
     if(xLocation + rectWidth <= width)
     {
       xLocation += 5;
     }
   }
   // move down
   else if(key == 's')
   {
     if(yLocation + rectHeight <= height)
     {
       yLocation += 5;
     }
   }
}
