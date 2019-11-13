class Enemy
{
   PImage[] myImage;
   int x;
   int y;
   int health = 100;
   int speed;
   int j = 0;
   
   public Enemy(PImage[] myImage, int x, int y, int speed)
   {
      this.myImage = myImage;
      this.x = x;
      this.y = y;
      this.speed = speed;
      
   }
   
   void draw(int x, int y)
   {
    /*if(myEnemyTimer.timer())
    {
       pushMatrix();
       scale(-1, 1);
       image(myEnemyWalkImages[j],-(enemyX+579),enemyY);
       popMatrix();
       j++;
     }
     if(j >= 10)
     {
        j = 0; 
     }*/
   }
   
   int getSpeed()
   {
      return speed; 
   }
   void reduceHealth()
   {
      health -= 10; 
   }
   
   int getHealth()
   {
      return health; 
   }
   int getX()
   {
      return x; 
   }
   
   int getY()
   {
      return y; 
   }
   
   void setX(int value)
   {
      this.x = value; 
   }
   
   void setY(int value)
   {
      this.y = value; 
   }
}
