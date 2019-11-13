class Player
{
  // variables
  private int x;
  private int y;
  private int w;
  private int h;
  private int speed;
  int lives;
  String[] idleImages;
  PImage[] myIdleImages = new PImage[10];
  String[] walkImages;
  PImage[] myWalkImages = new PImage[10];
  String[] hurtImages;
  PImage[] myHurtImages = new PImage[10];
  // constructor
  public Player(int x, int y)
  {
    this.x = x;
    this.y = y;
    this.w = 200;
    this.h = 175;
    idleImages = loadStrings("Idle_dog.txt");
    walkImages = loadStrings("Walk_dog.txt");
    hurtImages = loadStrings("Hurt_dog.txt");
    createPlayaAnimationArrays();
  }
  // methods 
  void draw()
  {
    displayAnimation();
  }

  void createPlayaAnimationArrays()
  {

    for (int i = 0; i < myIdleImages.length; i++)
    {
      myIdleImages[i] = loadImage(idleImages[i]);
      myWalkImages[i] = loadImage(walkImages[i]);
      myHurtImages[i] = loadImage(walkImages[i]);
    }
  }

  void displayAnimation()
  {
    if (isIdle)
    {  
      image(myIdleImages[i], x, y, w, h);
    } else if (isWalking)
    {
      image(myWalkImages[i], x, y, w, h);
    } else if (trigEnemyHit)
    {
      image(myHurtImages[i], x, y, w, h);
    }
    //image(myWalkImages[i],x,y);
    i++;
    if (i==10)
    {
      i = 0;
    }
  }
  int getHealth()
  {
    return lives;
  }
  int getSpeed()
  {
    return speed;
  }
  int getX()
  {
    return x;
  }
    int getY()
  {
    return y;
  }
  void collided(Enemy myEnemy)
  {
    float d;
    d = dist(myEnemy.getX(), myEnemy.getY(), );
    println(d);
    if (d<100)
    {
      enemyIdle=false;
      trigEnemyHit = true;
      //myPlaya.update(0);
    } else { enemyIdle = true; trigEnemyHit=false; }
  }
}
