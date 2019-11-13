Player myPlaya;
Enemy myEnemy;


int animKey = 0;

int i = 0;
int x = 100;
int y = 100;
int eX = 600;
int eY = 100;
int playerWidth = 587;
int playerHeight = 707;
int enemyWidth = 579;
int enemyHeight = 763;
boolean isIdle = true;
boolean isWalking = false;
boolean isIdleBack = false;
boolean isWalkingBack = false;
boolean flipX = false;
boolean trigEnemyHit = false;
boolean enemyIdle = true;

void setup()
{
  myPlaya = new Player(x, y);
  myEnemy = new Enemy(eX, eY);
  size(1000, 1000);

  frameRate(12);
}

void draw()
{
  background(0);
  ellipse(myPlaya.x+myPlaya.w, myPlaya.y+myPlaya.h, 5, 5);
  myPlaya.draw();
  myEnemy.draw();
  myEnemy.collided(myPlaya);
  
  //if (checkCollision(myPlaya.w+myPlaya.x, myEnemy.x, 
  //  myPlaya.x, myEnemy.x+myEnemy.w, myPlaya.y+myPlaya.h, myEnemy.y, 
  //  myPlaya.y, myEnemy.y+myEnemy.h)) 
  //{
  //  myPlaya.update(0);
  //  delay(100);
  //  trigEnemyHit= true;
  //}
}





void keyPressed()
{

  if (key == 'd' || key == 'D')
  {
    isWalking = true;
    isIdle = false;
    flipX = false;
    isWalkingBack=false;
    //myPlaya.update(6);
  } else if (key == 'a' || key =='A')
  {
    isWalkingBack = true;
    isWalking = false;
    isIdle = false;
    flipX = true;

    //myPlaya.update(-6);
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
  if (rectOneRight > rectTwoLeft 
    && rectOneLeft < rectTwoRight 
    && rectOneBottom > rectTwoTop 
    && rectOneTop < rectTwoBottom)
  {
    return true;
  } else
  {
    return false;
  }
}
