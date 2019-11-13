
void setup()
{
   size(1000,1000);
}

void draw()
{
  // first number = x, second = y, third = width, fourth = height
  ellipse(100,100,100,150);
  
  // first number = x, second = y, third = diameter
  circle(200,200,125);
  
  // first number = x, second = y, third = width, fourth = height
  rect(300,300,50,100);
  
  // first number = x, second = y, third = width and height
  square(400,400,75);
  
  // first two numbers are x,y of the bottom left, then x,y of top point, then x,y of bottom right corner
  triangle(550,550, 600, 450 ,650,550);
}
