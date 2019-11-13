int xLocation = 100;
int yLocation = 100;
int rectWidth = 50;
int rectHeight = 50;

int xLocation2 = 200;
int yLocation2 = 200;
int rectWidth2 = 50;
int rectHeight2 = 50;


void setup()
{
  size(500,500);  
}

void draw()
{
    background(0);
    rect(xLocation, yLocation, rectWidth, rectHeight);
    rect(xLocation2, yLocation2, rectWidth2, rectHeight2);
    
}

void keyPressed()
{
   if(keyCode == DOWN)
   {
      if(yLocation + rectHeight + 10 <= height && !rectColliding(xLocation + rectWidth + 10,xLocation2,xLocation,
      xLocation2 + rectWidth2,yLocation+rectHeight + 10,yLocation2,yLocation,yLocation2 + rectHeight2 + 10))
      {
        yLocation += 10;  
      }
      else
      {
         yLocation -=10; 
      }
      
       
   }
   else if(keyCode == UP)
   {
     if(yLocation - 10 >= 0 && !rectColliding(xLocation + rectWidth + 10,xLocation2,xLocation,
      xLocation2 + rectWidth2,yLocation+rectHeight + 10,yLocation2,yLocation,yLocation2 + rectHeight2 + 10))
      {
        yLocation -= 10;
      }
      else
      {
         yLocation += 10; 
      }
   }
   else if(keyCode == LEFT)
   {
     if(xLocation - 10 >= 0 && !rectColliding(xLocation + rectWidth + 10,xLocation2,xLocation,
      xLocation2 + rectWidth2+10,yLocation+rectHeight + 10,yLocation2,yLocation,yLocation2 + rectHeight2 + 10))
      {
        xLocation -= 10; 
      }
      else
      {
        xLocation += 10;
      }
   }
   else if(keyCode == RIGHT)
   {
     if(xLocation + rectWidth + 10 <= width && !rectColliding(xLocation + rectWidth + 10,xLocation2,xLocation,
      xLocation2 + rectWidth2,yLocation+rectHeight + 10,yLocation2,yLocation,yLocation2 + rectHeight2 + 10))
      {
        xLocation += 10;
      }
      else
      {
         xLocation -= 10; 
      }
   }
   
}

boolean rectColliding(int rectOneRight, int rectTwoLeft, int rectOneLeft, int rectTwoRight, 
  int rectOneBottom, int rectTwoTop, int rectOneTop, int rectTwoBottom)
{
  //evaluates to true if rectOne and rectTwo are colliding
  if (rectOneRight > rectTwoLeft && rectOneLeft < rectTwoRight && rectOneBottom > rectTwoTop && rectOneTop < rectTwoBottom)
  {

    return true;
  } else
  {
    return false;
  }
}
