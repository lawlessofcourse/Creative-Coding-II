//Creative Coding II 8/28/2019
Drop[] drops = new Drop[25];
int dim;
float posx;
float posy;

Triangle[] triangles = new Triangle[100];
float movex;
float movey;

ArrayList<Ball> balls;
int ballWidth = 48;

void setup()
{
  colorMode(HSB);
  size(1080, 720);
  
  for (int i = 0; i < drops.length; i++){
    drops[i] = new Drop();
  }
  for(int i = 0; i < triangles.length; i++)
  {
    triangles[i] = new Triangle();
  }
  
  balls = new ArrayList<Ball>();
  
  // Start by adding one element
  balls.add(new Ball(width/2, height/2, ballWidth));
}

void draw()
{
  colorMode(HSB);
  background(200, 300, 100);
  stroke(140,200,300);
  strokeWeight(20);
  noFill();
  rect(width, height, -width, -height);
  textSize(32);
  text("Jack Lawless", width-225, height - 32);
  text("HW1 Raining Ice Cream", width*0.05, height*0.1);
  noStroke();
  for(int i = 0; i < drops.length; i++){
    drops[i].fall();
    drops[i].show();
  }
  //noFill();
  //stroke(220, 300, 250);
  //strokeWeight(6);
  //rect(0, 0, width, height);
  float r = 0;
  
  if(r>359){
  r = 0;
  }
  pushMatrix();
  translate(width/2, height/2);
  rotate(degrees(r));
  noFill();
  stroke(0);
 
  for(int i = 0; i<triangles.length; i++)
  {
   
   // triangles[i].display(160, 255, 255, movex, movey);
    triangles[i].display(200, 255, 255, -movex, -movey);

  }
  
  if(movex>width/4)
  {
    movex = 0;
    movey = 0;
  }
  movex += 5;
  movey += 5;
  r+=1;
  popMatrix();
  for (int i = balls.size()-1; i >= 0; i--) { 
    // An ArrayList doesn't know what it is storing so we have to cast the object coming out
    Ball ball = balls.get(i);
    ball.move();
    ball.display();
    if (ball.finished()) {
      // Items can be deleted with remove()
      balls.remove(i);
    }
    
  }  
 
}
void mousePressed() {
  // A new ball object is added to the ArrayList (by default to the end)
  balls.add(new Ball(mouseX, mouseY, ballWidth));
}
