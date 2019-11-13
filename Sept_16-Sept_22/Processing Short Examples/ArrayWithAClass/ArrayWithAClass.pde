MyCircle[] myCircles = new MyCircle[3];
void setup()
{
  size(1000,1000);
  myCircles[0] = new MyCircle(100,100,50);
  myCircles[1] = new MyCircle(200,100,75);
  myCircles[2] = new MyCircle(300,100,100);
  
}

void draw()
{
  myCircles[0].draw();
  myCircles[1].draw();
  myCircles[2].draw();
}
