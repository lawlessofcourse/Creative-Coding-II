MyCircle myCircle = new MyCircle(100,100,50);
MyCircle myCircle2 = new MyCircle(200,200,50);


void setup()
{
  size(1000,1000);
}

void draw()
{
   myCircle.draw();
   myCircle2.draw();
   myCircle.collided(myCircle2);
}
