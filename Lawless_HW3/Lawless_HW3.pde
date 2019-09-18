
Sparkle[] sparks = new Sparkle[50];
Bird[] bird = new Bird[10];

float grav = 1.8;
float w;
float velocity;
int hue;
void setup()
{ 
  size(800,800);
  w = width/sparks.length;
  for(int i=0; i<sparks.length; i++)
  {
    sparks[i] = new Sparkle(i*w,0,(float)random(1,25),(float)random(1,3));
  }
  for(int i=0; i<bird.length;i++)
  {
    bird[i] = new Bird(random(1, width-1), random(0, height/3), random(1,5));
  }
}

void draw()
{
  colorMode(HSB);
  background(140, 100, 225);
  for(int i=0; i<sparks.length; i++)
  {
    sparks[i].update();
    sparks[i].display();
    //float r  = map(sparks[i], 0,1,100,width);
  }
  for(int i=0; i<bird.length;i++)
  {
    bird[i].update();
    bird[i].display(floor(random(160, 240)));
  }
 

}
