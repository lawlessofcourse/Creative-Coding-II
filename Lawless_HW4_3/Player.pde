class Player
{
  // variables
  private int x;
  private int y;
  private int w;
  private int h;

  int lives;
  String[] idleImages;
  PImage[] myIdleImages = new PImage[10];
  String[] walkImages;
  PImage[] myWalkImages = new PImage[10];
  String[] hurtImages;
  PImage[] myHurtImages = new PImage[10];
  String[] dieImages;
  PImage[] myDieImages = new PImage[10];
  // constructor
  public Player(int x, int y)
  {
    this.x = x;
    this.y = y;
    this.w = 200;
    this.h = 175;
    this.lives = 3;


    idleImages = loadStrings("Idle_dog.txt");
    walkImages = loadStrings("Walk_dog.txt");
    hurtImages = loadStrings("Hurt_dog.txt");
    dieImages = loadStrings("Dog_die.txt");
    createPlayaAnimationArrays();
  }
  // methods 
  void draw(int tempX, int tempY)
  {
    x = tempX;
    y = tempY;
    displayAnimation();
  }


  void createPlayaAnimationArrays()
  {

    for (int i = 0; i < myIdleImages.length; i++)
    {
      myIdleImages[i] = loadImage(idleImages[i]);
      myWalkImages[i] = loadImage(walkImages[i]);
      myHurtImages[i] = loadImage(hurtImages[i]);
      myDieImages[i] = loadImage(dieImages[i]);
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
    } else if (isHurt)
    {
      
      image(myHurtImages[i], x, y, w, h);
    } else if (playaIsDead)
    {
      image(myDieImages[i], x, y, w, h);
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
  int getX()
  {
    return x;
  }
  int getY()
  {
    return y;
  }
  int getWidth()
  {
    return w;
  }
  int getHeight()
  {
    return h;
  }
  void collided(Enemy myEnemy)
  {
    float d;
    d = dist(myEnemy.getX(), myEnemy.getY(), x, y);
    println(d);
    if (d<(w/2)+(myEnemy.getWidth()/2))
    {
      isHurt = true;
      isIdle = false;
      isWalking = false;
   
      //myPlaya.update(0);
    } else { 
      enemyIdle = true; 
      isHurt = false;
    }
  }

  void gameOver()
  {
    if (lives<=0)
    {
      colorMode(HSB);
      clear();
      background(255, 200, 150);
      textSize(32);
      text("You died...", width/2, height/2);
      fill(0);
      playaIsDead = true;
      isIdle = false;
      isWalking = false;
      isHurt=false;
      noLoop();
    }
  }
}
