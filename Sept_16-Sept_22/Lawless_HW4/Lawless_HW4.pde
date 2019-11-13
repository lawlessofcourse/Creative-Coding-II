
myEnemy[] enemies = new myEnemy[50];
myPlayer myPlaya;
float grav = 1.8;
float w;
float velocity;
int hue;
int shipX=width/2;
int shipY=height/2;
float speed = 20; 
int frameCounter;
int enemyCount = 5;
void setup()
{ 
  size(800, 800);

   for(int i = 0; i<enemies.length; i++)
   {
     enemies[i] = new myEnemy(floor(random(0,width)),floor(random(0,height)),floor(random(40, 50)));
   }
  
  myPlaya = new myPlayer(width/2, height/2, 20);
}

void draw()
{
  colorMode(HSB);
  background(140, 100, 225);
  
  myPlaya.draw(shipX, shipY);
  
  for(int i = 0; i<enemyCount; i++)
  {
    enemies[i].draw();
    enemies[i].checkBoundaries();
    enemies[i].collided(myPlaya);
    enemies[i].updateLocation(myPlaya);
  }
  
  textSize(32);
  fill(0);
  text("Jack Lawless", 10, 30);
  frameCounter++;
  if(frameCounter%500==01&&enemyCount<10)
  {
    enemyCount+=1;
  }
  println(frameCounter);
  println("mod" + frameCounter%500);
}
void mouseClicked()
{
   for(int i = 0; i<enemies.length; i++)
   {
     enemies[i].clicked();
   }
    
  
}
void keyPressed()
{
  if (key=='a')
  {
    if ((shipX)>=0)
    {
      shipX-=speed;
    }
  } else if (key=='w')
  {
    if (shipY>=0)
    {
      shipY-=speed;
    }
  } else if (key=='d')
  {
    if (shipX<=width)
    {
      shipX+=speed;
    }
  } else if (key=='s')
  {
    if (shipY<=height)
    {
      shipY+=speed;
    }
  } 
}
