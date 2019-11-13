class Pizza
{
   
  // variables
  private int x;
  private int y;
  private PImage myImage;
  
  // constructor
  public Pizza(int x, int y, PImage myImage)
  {
     this.x = x;
     this.y = y;
     this.myImage = myImage;
     myImage.resize(100,100);
  }
  // methods 
  void draw()
  {
     image(myImage,x,y); 
  }
  
}
