class Trees
{
   private int x;
   private int y;
   private PImage tree;
   
   public Trees(int x, int y)
   {
     this.x = x;
     this.y = y;
      tree = loadImage("tree.jpg"); 
   }
   
   void draw()
   {
       image(tree,x,y);
   }
}
