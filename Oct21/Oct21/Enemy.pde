Timer myEnemyTimer;
class Enemy
{
  PImage[] myImage;
  int x;
  int y;
  int health = 100;
  int speed;
  int j = 0;
  boolean enemyIdle = true;
  public Enemy(PImage[] myImage, int x, int y, int speed)
  {
    this.myImage = myImage;
    this.x = x;
    this.y = y;
    this.speed = speed;
    enemyWalkImages = loadStrings("Enemy/Walk.txt");
    createEnemyAnimationArrays();
  }

  void draw(int x, int y)
  {
    if (myEnemyTimer.timer())
    {
      pushMatrix();
      scale(-1, 1);
      image(myEnemyWalkImages[j], -(enemyX+579), enemyY);
      popMatrix();
      j++;
    }
    if (j >= 10)
    {
      j = 0;
    }
  }
  void createEnemyAnimationArrays()
  {
    for (int i = 0; i < myIdleImages.length; i++)
    {
      myEnemyWalkImages[i] = loadImage(enemyWalkImages[i]);
    }
  }
  void displayEnemyAnimation()
  {
    if (isIdle)
    {
      image(myIdleImages[i], x, y);
    } else if (isWalking)
    {
      image(myWalkImages[i], x, y);
    }

    i++;
    if (i == 10)
    {
      i = 0;
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
}
