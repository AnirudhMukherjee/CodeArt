float phase = 0;
float zoff = 0;
color[] cols = new color[10];
void setup() {
  size(800, 800);
  for(int j = 0;j<10;j++){
    cols[j] = color(random(255),random(255),random(255));
  }
}

void draw() {
  background(255, 102, 247);
  translate(width / 2, height / 2);
  stroke(0);
  strokeWeight(5);
  noFill();
  float rangeLow = 100;
  float rangeHigh = height/1.2;
  for(int i = 9; i >=0;i--){
  beginShape();
  fill(cols[i]);
  float noiseMaxX = map(mouseX, 0, width, 1, 5);
  float noiseMaxY = map(mouseY, 0, height, 1, 5);
  for (float a = 0; a < TWO_PI; a += radians(3)) {
    float xoff = map(cos(a + phase), -1, 1, 0, noiseMaxX);
    float yoff = map(sin(a + phase), -1, 1, 0, noiseMaxY);
    float r = map(noise(xoff, yoff, zoff), 0, 1, rangeLow, rangeHigh);
    float x = r * cos(a);
    float y = r * sin(a);
    vertex(x, y);

  }
  rangeLow -=15;
  rangeHigh-=50;
  endShape(CLOSE);
  }
  phase += 0.003;
  zoff += 0.005;
}
