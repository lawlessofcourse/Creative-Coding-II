BouncingCircles[] myCircles = new BouncingCircles[4];
Timer myTime;
BouncingRectangles myRect;
Trees myTree;
void setup()
{
  size(2000, 1000); 
  for (int i = 0; i < myCircles.length; i++)
  {
    myCircles[i] = new BouncingCircles((int)random(50, 100), 
      (int)random(50, 100), 50, 2, 
      2, (int)random(256), (int)random(256), 
      (int)random(256));
  }

  myRect = new BouncingRectangles(300, 300, 100, 100, 1, 2, 13, 39, 128);
  myTime = new Timer();
  myTree = new Trees(60,500);
}

void draw()
{
  background(0);
  for (int i = 0; i <myCircles.length; i++)
  {
    checkCollisions(myCircles[i]);
    if (myTime.timer())
    {
      myCircles[i].increaseXSpeed(4);
      myCircles[i].increaseYSpeed(3);
    }
    myCircles[i].draw();
    myRect.draw();
    myTree.draw();
  }
}

void keyPressed()
{
  // create key presses to move the rectangle
  // check collisions
}

boolean checkCollisionWithTrees(int rectOneRight, int rectTwoLeft,
int rectOneLeft, int rectTwoRight, int rectOneBottom, int rectTwoTop,
int rectOneTop, int rectTwoBottom)
{
 //evaluates to true if rectOne and rectTwo are colliding
if(rectOneRight > rectTwoLeft 
&& rectOneLeft < rectTwoRight 
&& rectOneBottom > rectTwoTop 
&& rectOneTop < rectTwoBottom){
  return true;
}
else
{
    return false;
}
}

// check my collisions between each circle
void checkCollisions(BouncingCircles myCircle)
{
  for (int i = 0; i < myCircles.length; i++)
  {
    if (myCircle != myCircles[i])
    {
      if (myCircle.checkCollision(myCircles[i].getX(), myCircles[i].getY(), myCircles[i].getDiameter()))
      {
        myCircle.alterXSpeed();
        myCircle.alterYSpeed();
        myCircles[i].alterXSpeed();
        myCircles[i].alterYSpeed();
      }
    }
  }
}
