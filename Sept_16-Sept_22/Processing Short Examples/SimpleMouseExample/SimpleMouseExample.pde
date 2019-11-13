int xLocation = 50;
int yLocation = 50;

void setup()
{
   size(1000,1000); 
}

void draw()
{
   circle(xLocation, yLocation, 50); 
}

void mousePressed()
{
   xLocation = mouseX;
   yLocation = mouseY;
}
