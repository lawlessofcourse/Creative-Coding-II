class MyCircle
{
    // attributes
   private int xLocation;
   private int yLocation;
   private int diameter;
   
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
   }
  
}
