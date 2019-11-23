Player myPlaya;
Enemy myEnemy;
Timer myTimer;

int animKey = 0;

int i = 0;
int j = 0;
int eX = 600;
int eY = 100;
int playaX=100;
int playaY=100;
float playaSpeed = 6;
int playerWidth = 587;
int playerHeight = 707;
int enemyWidth = 579;
int enemyHeight = 763;

boolean isIdle = true;
boolean isWalking = false;
boolean isHurt = false;

boolean playaIsDead = false;
boolean trigEnemyHit = false;
boolean enemyIdle = true;

void setup()
{
  myPlaya = new Player(playaX, playaY);
  myEnemy = new Enemy(eX, eY);
  myTimer = new Timer();
  size(1280, 720);

  frameRate(12);
}

void draw()
{
  background(0);
  hud();
  // ellipse(myPlaya.x+myPlaya.w, myPlaya.y+myPlaya.h, 5, 5);
  myPlaya.draw();

  myEnemy.draw();
  myEnemy.collided(myPlaya);

  if (isBlocked())
  {
    isHurt=true;
    isIdle = false;
    isWalking= false;
    //dealDamage();
  }
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
    myPlaya.update(playaSpeed);
  } else if (key == 'a' || key =='A')
  {
    isWalking = true;
    isIdle = false;
    myPlaya.update(-playaSpeed);
  }
}
boolean isBlocked()
{
  if (checkCollision(myPlaya.getX()+myPlaya.getWidth(), myEnemy.getX(), 
    myPlaya.getX(), myEnemy.getX()+myEnemy.getWidth(), myPlaya.getY()+myPlaya.getHeight(), myEnemy.getY(), 
    myPlaya.getY(), myEnemy.getY()+myEnemy.getHeight()))
  {
    return true;
  } else 
  return false;
}
void keyReleased()
{
  isIdle = true;
  isWalking = false;
}

void hud()
{
  int health = myPlaya.getHealth();
  textSize(32);
  text(str(health), 100, 100);
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
