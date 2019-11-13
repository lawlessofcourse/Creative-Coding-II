class myPlayer
{
  private int xLocation;
  private int yLocation;
  private int diameter;
  private int xChange = 1;
  private int yChange = 1;
  //constructor
  public myPlayer(int xLocation, int yLocation, int diameter)
  {
    this.xLocation = xLocation;
    this.yLocation = yLocation;
    this.diameter = diameter;
  }
  //display
  void draw(int tempX, int tempY)
  {
    xLocation = tempX;
    yLocation = tempY;
    fill(200, 300, 200);
    circle(xLocation, yLocation, diameter);
  }
  //GETTERS
  int getX()
  {
    return xLocation;
  }
  int getY()
  {
    return yLocation;
  }
  int getDiameter()
  {
    return diameter;
  }
  //methods
  void checkBoundaries()
  {
    
    if (xLocation + diameter/2 < 0 || xLocation > width - diameter/2)
    {
      
      xChange *=-1;
    }
    if (yLocation + diameter/2 < 0 || yLocation > height - diameter/2)
    {
      yChange*=-1;
    }
  }
  
  void gameOver()
    {
    clear();
    background(0);
    textSize(32);
    text("GAME OVER", width/2, height/2);
    xChange = 0;
    yChange = 0;
    fill(0);
    noLoop();   
  }
  
  void collided(myEnemy enemy)
  {
    if (dist(enemy.getX(), enemy.getY(), xLocation, yLocation) 
      < enemy.getDiameter()/2 + diameter/2) 
    {
      diameter = 0;
      gameOver();
      //textSize(32);
      //text("GAME OVER", width/2, height/2);
      //xChange*=0;
      //yChange*=0;
      //noLoop();
    }
  }
}
