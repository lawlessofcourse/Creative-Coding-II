class Triangle
{
  float w;
  float hue;
  Triangle()
  {
    posx += 1;
    posy += 1;
    w = 1;
    
  }
  void display(float h, float s, float b, float posx, float posy)
  {
   
    
   stroke(h,s,b);
   strokeWeight(w);

   triangle(0,posy, -posx, -posy, posx, -posy);
   triangle(0-15,posy-15, -posx+15, -posy+15, posx-15, -posy-15);    
   triangle(0+15,posy+15, -posx-15, -posy-15, posx+15, -posy+15);

  }
}
