class Blob
{
  float x;
  float y;
  float lastX;
  float lastY;
  float direction;
  color col;
  float s;

  public Blob(float x, float y)
  {
    this.x = x;
    this.y = y;
    for (int i = 0; i<20; i++)
    {
      lastX = mouseX+random(-100, 100);
      lastY = mouseY+random(-100, 100);
      col = c[floor(random(c.length))];
      s = random(1, 5);
      x = getPosX();
      y = getPosY();
    }
  }

  void draw()
  {
    direction = random(0.1, 1) * (random(1) > 0.5 ? 1 : -1);

    float py = slopeY();
    float px = slopeX();

    x += direction * px;
    y += direction * py;

    px = getPrintX();
    py = getPrintY();


    line(x, y, lastX, lastY);
    lastX = x;
    lastY = y;
    
    
  }
  float slopeY()
  {
    float f = 0.0;
    switch(variation) {
    case 0:
      f = sin(x);
    case 1:
      f = sin(x*5)*y*0.3;
    case 2:
      f = cos(x*y);
    case 3:
      f = sin(x)*cos(y);
    case 4:
      f = cos(x)*y*y;
    case 5:
      f = log(abs(x))*log(abs(y));
    case 6:
      f = tan(x)*cos(y);
    case 7:
      f = -sin(x*0.1)*3;//orbit
    case 8:
      f = (x-x*x*x)*0.01;//two orbits
    case 9:
      f = -sin(x);
    case 10:
      f = -y-sin(1.5*x) + 0.7;
    case 11:
      f = sin(x)*cos(y);
    }
    return f;
  }
  float slopeX()
  {
    float f = 0.0;
    switch(variation) {
    case 0:
      f = cos(y);
    case 1:
      f = cos(y*5)*x*0.3;
    case 2: 
    case 3: 
    case 4: 
    case 5: 
    case 6:
      f = 1;
    case 7:
      f = sin(y*0.1)*3;//orbit
    case 8:
      f = y/3;//two orbits
    case 9:
      f = -y;    
    case 10:
      f = -1.5*y;
    case 11:
      f = sin(y)*cos(x);
    }
    return f;
  }
  float getPosX()
  {
    return (x-centerX)/xScale;
  }
  float getPosY()
  {
    return (y-centerY)/yScale;
  }
  float getPrintX()
  {
    return xScale*x+centerX;
  }
  float getPrintY()
  {
    return yScale*y+centerY;
  }
}
