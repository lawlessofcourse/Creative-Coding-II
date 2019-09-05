//Ripple by oggy
final int count = 110;
final int step = 16;
final float DIST = 100;
final float DISTORTION = 30;
Part[][] parts = new Part[count][count];
Boolean mode = true;

void setup() {
  size(1080, 1080, P2D);
  int dx = (width-count*step)/2;
  for (int i = 0; i < count; i ++) {
    for (int j = 0; j < count; j ++) {
      parts[i][j] = new Part(i*step+dx, j*step+dx);
    }
  }
}

void draw() {
  colorMode(HSB);
  background(160, 200, 100);
  PVector m = new PVector(width/2, height/2); 
  for (int i = 0; i < count; i ++) {
    for (int j = 0; j < count; j ++) {
      parts[i][j].update(m);
    }
  }
}



void mousePressed() {
  mode = !mode;
}
