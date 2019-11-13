class MyCircle
{
  // attributes
  private int xLocation;
  private int yLocation;
  private int diameter;
  private int change = 1;
  private int yChange = 1;
  // constructor
  public MyCircle(int xLocation, int yLocation, int diameter)
  {
    this.xLocation = xLocation; // assign the local variable xLocation to the class level xLocation by using "this"
    this.yLocation = yLocation;
    this.diameter = diameter;
  }

  // method called draws
  void draw()
  {
    circle(xLocation, yLocation, diameter); 
    // this method is defined below
    checkBoundaries();
    
    // make sure the circle moves
    xLocation+= change;
    yLocation+= yChange;
  }

  // this returns what is currently stored in the xLocation variable
  int getXLocation()
  {
    return xLocation;
  }

  // this returns what is currently stored in the yLocation variable
  int getYLocation()
  {
    return yLocation;
  }
  
  // this returns what is currently stored in the diameter variable
  int getDiameter()
  {
    return diameter;
  }

  // this method checks all four boundaries and makes the shape bounce if it's hit
  void checkBoundaries()
  {
    if (xLocation + diameter/2 < 0 || xLocation > width - diameter/2 )
    {

      change *= -1;
    }
    if (yLocation + diameter/2 < 0 || yLocation > height - diameter/2 )
    {
      // yChange += 2;
      yChange *= -1;
    }

    
  }
  
  // this method compares the current circle to one that is sent in to see if they collided
  void collided(MyCircle otherCircle)
  {
    if (dist(otherCircle.getXLocation(), otherCircle.getYLocation(), xLocation, yLocation) 
    < otherCircle.getDiameter()/2 + diameter/2) 
    {
      change*=-1;
      
    } 
  }
}
