class MyCircle
{
    // attributes
   private int xLocation;
   private int yLocation;
   private int diameter;
   private int yDirection = 5; // this variable is determines which way to move the ball (up or down)
   
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
      updateYLocation();
   }
   
   // this custom method changes the direction of the movement
   void updateYLocation()
   {
      // checks to see if we are above zero (the top) or beyond the height (the bottom)
      if((yLocation - diameter/2) < 0 || yLocation >= (height - diameter/2))
      {
        yDirection *= -1;
      }
      // always add the direction (either positive to go down or negative to go up)
      yLocation += yDirection;
   }
  
}
