String[] idleImages;
PImage[] myIdleImages = new PImage[10];

String[] walkImages;
PImage[] myWalkImages = new PImage[10];

int i = 0;
int x = 100;
int y = 100;

boolean isWalking = false;
boolean isIdle = true;
void setup()
{
  
  idleImages = loadStrings("Idle.txt");
  walkImages = loadStrings("Walk.txt");
  
  size(2000,1000);
  createAllAnimationArrays(); 
  frameRate(30);
}  

void draw()
{
   background(0);
   displayAnimation();
}

void createAllAnimationArrays()
{
 for(int i = 0; i < myIdleImages.length;i++)
  {
     myIdleImages[i] = loadImage(idleImages[i]);
     myWalkImages[i] = loadImage(walkImages[i]);
  }
  

}
void displayHealth()
{
}
void displayAnimation()
{
   if(isIdle)
   {
     image(myIdleImages[i], x,y);
   }
   else if(isWalking)
   {
     image(myWalkImages[i],x,y); 
   }
   
   i++;
   if(i == 10)
   {
      i = 0; 
   } 
}

void keyPressed()
{
   
   if(key == 'd')
   {
       x+=10;
       isIdle = false;
       isWalking = true;
       
   }
   
   
}

void keyReleased()
{
   isIdle = true;
   isWalking = false;
}

boolean checkCollision(int rectOneRight, int rectTwoLeft,
int rectOneLeft, int rectTwoRight, int rectOneBottom, int rectTwoTop,
int rectOneTop, int rectTwoBottom)
{
   //evaluates to true if rectOne and rectTwo are colliding
  if(rectOneRight > rectTwoLeft 
  && rectOneLeft < rectTwoRight 
  && rectOneBottom > rectTwoTop 
  && rectOneTop < rectTwoBottom)
  {
    return true;
  }
  else
  {
      return false;
  }
}
