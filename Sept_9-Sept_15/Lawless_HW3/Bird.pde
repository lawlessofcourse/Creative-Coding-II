class Bird
{
  float x1;
  float x2;
  float x3;
  float y1;
  float y2;
  float y3;
  float x4;
  float y4;
  float flap;
  float speed;
  float hue;


  public Bird(float xcpoint, float ycpoint, float vel)
  {
    x1 = xcpoint+10;
    y1 = ycpoint+10;
    x2 = xcpoint+50;
    y2 = ycpoint+40;
    x3 = xcpoint+60;
    y3 = ycpoint+10;
    x4 = xcpoint+45;
    y4 = ycpoint+25;
    speed=vel;
  }
  void update()
  {
    if(y1<y2+5){
    flap +=0.5;
    }else 
    {
      flap-=0.5;
     
    }
    y1+=flap;
    y3+=flap;
    
    
    if(x3>width||x3<0){
      speed*=-1;
    }

    x1+=speed;
    x2+=speed;
    x3+=speed;
    x4+=speed;
  }
  void display(int h)  
  {
    colorMode(HSB);
    fill(h, 200, 300);
    beginShape();
    vertex(x1, y1);
    vertex(x2, y2);
    vertex(x3, y3);
    vertex(x4, y4);
    endShape(CLOSE);
  }
}
