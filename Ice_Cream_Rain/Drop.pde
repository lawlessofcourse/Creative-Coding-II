// Daniel Shiffman
// http://codingtra.in
// http://patreon.com/codingtrain
// Code for: https://youtu.be/KkyIDI6rQJI

class Drop {
  float x;
  float y;
  float z;
  float len;
  float yspeed;
  float ranColor;

  Drop() {
    x  = random(width);
    y  = random(-500, -50);
    z  = random(0, 20);
    len = map(z, 0, 50, 25, 50);
    yspeed  = map(z, 0, 20, 1, 20);
    ranColor = random(0, 360);
  }

  void fall() {
    y = y + yspeed;
    float grav = map(z, 0, 10, 0, 0.02);
    yspeed = yspeed + grav;

    if (y > height) {
      y = random(-200, -100);
      yspeed = map(z, 0, 20, 4, 10);
    }
     
      
  }

  void show() {
    
    colorMode(HSB);
    noFill();
    float thick = map(z, 0, 20, 1, 3);
    noStroke();
   // strokeWeight(thick);
   // stroke(138, 43, 226);
    //line(x, y, x, y+len);
    
    fill(ranColor, 200, 200);
    circle(x, y, y/len*1.5);
    circle(x, y-(y+10), y/len/2);
    fill(40, 250, 200);
    triangle(x+(y/len), y+5, x, y+(y/len)*2, x-(y/len), y+5);
  }
}
