class myEnemy
{
  private int xLocation;
  private int yLocation;
  private int diameter;
  private int xChange = 1;
  private int yChange = 1;
  //constructor
  public myEnemy(int xLocation, int yLocation, int diameter)
  {
    this.xLocation = xLocation;
    this.yLocation = yLocation;
    this.diameter = diameter;
  }
  //display
  void draw()
  {
    fill(360,360,360);
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
    if (xLocation - diameter/2 < 0 || xLocation > width - diameter/2)
    {
      xChange *=-1;
    }
    if (yLocation - diameter/2 < 0 || yLocation > height - diameter/2)
    {
      yChange*=-1;
    }
  }
  void updateLocation(myPlayer player)
  {
    if(xLocation<player.getX())
    {
      xLocation += xChange;
    }else
    {
      xLocation -= xChange;
    }
    if(yLocation<player.getY())
    {
      yLocation += yChange;
    }
    else
    {
     yLocation -= yChange;
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
  
  void collided(myPlayer player)
  {
    if (dist(player.getX(), player.getY(), xLocation, yLocation) 
      < player.getDiameter() + diameter) 
    {
      
      //diameter=0;
      gameOver();
      
    }
  }
  

  
  void clicked()  
  {
    float d = dist(mouseX, mouseY, this.xLocation, this.yLocation);
    if(d < diameter)
    {
      diameter=0;
    }
  }
  
 
}
