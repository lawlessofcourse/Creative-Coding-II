class Sparkle {

  private float x;
  private float y;
  private float diameter;
  private float vel;
  private int hue;
  

  public Sparkle(float x, float y, float diameter, float vel)
  {
    this.x = x;
    this.y = y;
    this.diameter = diameter;
    this.vel = vel;
  }

  void update()
  {
    vel = vel + grav;
    y+=vel;
    
    if(y>height||y<0)
    {
      vel*=-1;
    }
    if(vel<0)
    {
      hue = (int)random(0,360);
    }
    
  }

  
  void display()
  {
    fill(hue, 200, 300);
    circle(x, y, diameter);
  }
 

}
