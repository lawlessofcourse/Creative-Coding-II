class Ball 
{
  float x;
  float y;
  float speedx;
  float speedy;
  float w;
  int colorC;
  int sat;
  int lum;

  Ball()
  {
    speedy = random(0, 5);
    speedx = random(0, 5);
    w = random(10, 50);
    x=random(0, width);
    y=random(0, width);
    colorC = floor(random(160, 220));
    sat = floor(random(200,300));
    lum = floor(random(250,360));
  }

  void move() 
  {
    if (y>height||y<0)
    {
      speedy*=-1;
    } else if (x>width||x<0)
    {
      speedx*=-1;
    }
    x+=speedx;
    y+=speedy;
  }

  void display() 
  {
    blendMode(ADD);
    rectMode(CENTER);
    colorMode(HSB);
    //stroke(colorCount+180, 255, 300);

    if (drawCounter % 2 == 0)
    {
      fill(colorC, sat, lum, 150);
      ellipse(x, y, w, w);
    } else
    {
      fill(colorC, sat, lum, 150);
      rect(x, y, w, w);
    }
  }
}  
