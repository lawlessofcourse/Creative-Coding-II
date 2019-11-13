ArrayList<Blob> bloobs;


int[] blobs = new int[100];
color[] c = {#581845, #900C3F, #C70039, #FF5733, #FFC30F};
int intiation = 0;
float xScale, yScale, centerX, centerY;
int variation = 0;
int changeDuration = 3000;
int lastChange = 0;

boolean isShowing = false;

void setup()
{
  size(1280, 720);
  textAlign(width/2, height/2);

  bloobs = new ArrayList<Blob>();



  xScale = width/20;
  yScale = height/20*(width/height);

  centerX = width/2;
  centerY = height/2;
}

void draw()
{ 
  if (isShowing)
  {
    float x = mouseX + random(-100, 100);
      float y = mouseY + random(-100, 100);
    bloobs.add(new Blob(x, y));
      
      for (int i = bloobs.size()-1; i >= 0; i--)
      {
        Blob newBlob = bloobs.get(i);
        newBlob.draw();
      
      }
    
  }

  int length = blobs.length;
  if (length ==0)
  {
    background(#1a0633);
    noStroke();
    fill(255);
    textSize(40);
    text("Press to emmit particles", centerX, centerY);
    return;
  }

  noStroke();
  noStroke();
  fill(26, 6, 51, 10);
  rect(0, 0, width, height);

  //auto change
  int time = millis();
  if (time - lastChange > changeDuration) {
    lastChange = time;
    intiation++;
    if (intiation>11) intiation = 0;
  }
}

void mousePressed()
{
  isShowing = true;
}
