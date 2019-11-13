int count = 0;
double number = 0;
void setup()
{
   size(1000,1000);  
   frameRate(10);
}

void draw()
{
  background(0);
  textSize(32);
  text(count,100,100);
  count+=1;
  
  text(number + "",200,200);
  number += .1;
}
