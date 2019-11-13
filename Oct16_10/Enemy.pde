class Enemy
{
  PImage[] myImage;
  int x;
  int y;
  int w;
  int h;
  int health = 100;
  int speed;
  int j = 0;
  String[] enemyidleImages;
  PImage[] enemyIdleImages = new PImage[10];
  String[] enemywalkImages;
  PImage[] enemyWalkImages = new PImage[10];
  String[] enemyslideImages;
  PImage[] enemySlideImages = new PImage[10];

  public Enemy(int x, int y)
  {
    this.x = x;
    this.y = y;
    this.speed = speed;
    this.w = 150;
    this.h = 125;
    enemyidleImages = loadStrings("Idle_cat.txt");
    enemywalkImages = loadStrings("Walk_cat.txt");
    enemyslideImages = loadStrings("Slide_cat.txt");
    createEnemyAnimationArrays();
  }

  void draw()
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
    displayAnimation();
  }

  void createEnemyAnimationArrays()
  {

    for (int i = 0; i < enemyIdleImages.length; i++)
    {
      enemyIdleImages[i] = loadImage(enemyidleImages[i]);
      enemyWalkImages[i] = loadImage(enemywalkImages[i]);
      enemySlideImages[i] = loadImage(enemyslideImages[i]);
    }
  }

  void displayAnimation()
  {
  
    if (enemyIdle)
    {
      image(enemyIdleImages[i], x, y, w, h);
    } else if (trigEnemyHit)
    {

      image(enemySlideImages[i], x, y, w, h);
    }


    //image(myWalkImages[i],x,y);
    i++;
    if (i==10)
    {
      i = 0;
    }
    j++;
    if (j==8)
    {
      j = 0;
    }

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

  void collided(Player myPlaya)
  {
    float d;
    d = dist(myPlaya.x+myPlaya.w/2, myPlaya.y + myPlaya.h/2, myEnemy.x+myEnemy.w/2, myEnemy.y+myEnemy.h/2);
    println(d);
    if (d<100)
    {
      enemyIdle=false;
      trigEnemyHit = true;
      //myPlaya.update(0);
    } else { enemyIdle = true; trigEnemyHit=false; }
  }
}
