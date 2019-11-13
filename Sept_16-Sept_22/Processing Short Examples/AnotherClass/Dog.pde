class Dog
{
   private MyCircle head;
   private MyCircle body;
   private MyCircle leg1;
   private MyCircle leg2;
   private MyCircle leg3;
   private MyCircle leg4;
   
   public Dog(MyCircle head, MyCircle body, MyCircle leg1, MyCircle leg2, MyCircle leg3, MyCircle leg4)
   {
      this.head = head;
      this.body = body;
      this.leg1 = leg1;
      this.leg2 = leg2;
      this.leg3 = leg3;
      this.leg4 = leg4;
      
   }
   
   void draw()
   {
      head.draw();
      body.draw();
      leg1.draw();
      leg2.draw();
      leg3.draw();
      leg4.draw();
   }
}
