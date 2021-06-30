float d = 9;
float n = 4;
color aColor;

void setup() {
 
  size(400, 400);
}

void draw() {
  float k = n / d;
  background(44, 222, 192);
  translate(width / 2, height / 2);

  beginShape();
  stroke(0);

  //strokeWeight(1);
  for (float a = 0; a < TWO_PI * (d+0.01); a += 0.05) {
    aColor = color(random(255),random(255),random(255));
    fill(aColor);
    float r = 210 * cos(k * a);
    float x = r * cos(a);
    float y = r * sin(a);
    ellipse(x,y,50,50);
  }
  endShape(CLOSE);
}
