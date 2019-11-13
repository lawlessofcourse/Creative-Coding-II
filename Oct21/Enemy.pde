class Enemy
{
   PImage[] myImage;
   int x;
   int y;
 
   
   public Enemy(PImage[] myImage, int x, int y)
   {
      this.myImage = myImage;
      this.x = x;
      this.y = y;
      //this.speed = speed;
      
   }
   
   void draw(int i)
   {
     image(myImage[i],x,y);
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
   
   //int getSpeed()
   //{
   //   return speed; 
   //}
   //void reduceHealth()
   //{
   //   health -= 10; 
   //}
   
   //int getHealth()
   //{
   //   return health; 
   //}
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
