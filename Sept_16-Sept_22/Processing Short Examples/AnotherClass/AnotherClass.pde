MyCircle head = new MyCircle(100,100,50);
MyCircle body = new MyCircle(150,125,100);
MyCircle leg1 = new MyCircle(125,180,10);
MyCircle leg2 = new MyCircle(150,180,10);
MyCircle leg3 = new MyCircle(175,180,10);
MyCircle leg4 = new MyCircle(200,180,10);
Dog myAbstractDog = new Dog(head,body,leg1,leg2,leg3,leg4);

void setup()
{
  size(1000,1000);
}

void draw()
{
  
  myAbstractDog.draw();
}
