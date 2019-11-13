void setup()
{
   size(1000,1000); 
}

void draw()
{
  background(0);
   performAction();
   performActionWithParameter(200,200,"This is a message");
}

void performAction()
{
   textSize(32);
   text("Hi there",100,100);
}

void performActionWithParameter(int xLocation, int yLocation, String message)
{
  textSize(32);
   text(message, xLocation, yLocation);
}
