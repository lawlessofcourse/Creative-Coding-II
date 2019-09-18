class BouncingCircles
{
  private int x;
  private int y;
  private int diameter;
  private int xSpeed;
  private int ySpeed;

  private int red;
  private int green;
  private int blue;

  public BouncingCircles(int x, int y, int diameter, 
    int xSpeed, int ySpeed, int red, int green, int blue)
  {
    this.x = x;
    this.y = y;
    this.diameter = diameter;
    this.xSpeed = xSpeed;
    this.ySpeed = ySpeed;
    this.red = red;
    this.green = green;
    this.blue = blue;
  }

  void draw()
  {
    fill(red, green, blue);
    circle(x, y, diameter);
    updateXSpeed();
    updateYSpeed();
  }

  int getX()
  {
    return x;
  }

  int getY()
  {
    return y;
  }

  int getDiameter()
  {
    return diameter;
  }

  void updateXSpeed()
  {
    if ((x-diameter/2) < 0 || (x+diameter/2) > width)
    {
      xSpeed *= -1;
    }

    x += xSpeed;
  }

  void increaseXSpeed(int value)
  {
    xSpeed += value;
  }

  void updateYSpeed()
  {
    if ((y-diameter/2) < 0 || (y+diameter/2) > height)
    {
      ySpeed *= -1;
    }

    y += ySpeed;
  }  
  void alterYSpeed()
  {
    ySpeed *= -1;
  }

  void alterXSpeed()
  {
    xSpeed *= -1;
  }
  void increaseYSpeed(int value)
  {
    ySpeed += value;
  }

  boolean checkCollision(int x1, int y1, int diameter1)
  {
    // get the distance between the two centers of the
    // circles and then compare that to the distances of the
    // two radiuses.  If the distance is smaller, we assume they 
    // have collided
    if (dist(x, y, x1, y1) < diameter/2 + diameter1/2) {
      return true;
    } else
    {  
      return false;
    }
  }
}
