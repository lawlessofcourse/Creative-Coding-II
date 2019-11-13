String[] idleImages;
PImage[] myIdleImages = new PImage[10];

String[] walkImages;
PImage[] myWalkImages = new PImage[10];

String[] enemyWalkImages;
PImage[] myEnemyWalkImages = new PImage[10];

Enemy myEnemy;

int i = 0;
int x = 100;
int y = 100;
int enemyX;
int enemyY;

boolean isWalking = false;
boolean isIdle = true;
void setup()
{
  
  idleImages = loadStrings("Idle.txt");
  walkImages = loadStrings("Walk.txt");
 
  
  size(2000,1000);
  createAllAnimationArrays(); 
  frameRate(30);
  myEnemy = new Enemy();
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
   if(key=='a')
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
