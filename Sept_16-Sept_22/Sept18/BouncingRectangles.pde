class BouncingRectangles
{
  private int x;
  private int y;
  private int rectWidth;
  private int rectHeight;
  private int xSpeed;
  private int ySpeed;

  private int red;
  private int green;
  private int blue;

  public BouncingRectangles(int x, int y, int rectWidth, int rectHeight, 
    int xSpeed, int ySpeed, int red, int green, int blue)
  {
    this.x = x;
    this.y = y;
    this.rectWidth = rectWidth;
    this.rectHeight = rectHeight;
    this.xSpeed = xSpeed;
    this.ySpeed = ySpeed;
    this.red = red;
    this.green = green;
    this.blue = blue;
  }

  void draw()
  {
    fill(red, green, blue);
    rect(x, y, rectWidth, rectHeight);
  }

  void updateX(int x)
  {
   // make it so they don't leave the bounds
     this.x += x;
  }
  void updateY(int y)
  {
      this.y += y;
    
  }

  
}
