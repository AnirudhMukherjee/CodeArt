color[] colors = {#cdb4db, #ffc8dd, #ffafcc, #bde0fe, #a2d2ff};

void setup() {
  size(800, 800);
  
  translate(width/2, height/2);
  rotate(random(-1, 1)*PI*0.25);
  translate(-width/2, -height/2);
  
  background(255);
  
  for (int i = 0; i < 2400; i++) {
    float x = randomGaussian() * width;
    float y = randomGaussian() * height;
    float w = (random(250) * random(random(1))) + 5;
    float h = w + (random(-1, 1) * 50);
    float rnd = int(random(4));
    float ang = (int(random(4)) * TAU / 4);

    push();
    translate(x, y);
    rotate(ang);
    int index = int(random(colors.length)); 
    fill(colors[index]);
    stroke(0, 20);
    if (rnd == 0) {
      circle(0, 0, w);
    }
    if (rnd == 1) {
      square(0, 0, w);
    }
    if (rnd == 2) {
      if (random(1) < 0.5) ellipse(0, 0, w, h);
      else rect(0, 0, w, h);
    }
    if (rnd == 3) {
      rect(0, 0, w * 3, random(2, 10));
    }
    pop();
  }
}

void draw() {

}
