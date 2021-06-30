class Circle {
  float x;
  float y;
  float r;
  float a;
  float r1,g1,b1;
  boolean growing = true;

  Circle(float x_, float y_) {
    x = x_;
    y = y_;
    r = 1;
    r1 = random(256);
    g1 = random(256);
    b1 = random(256);
    a = random(40,60);
  }

  void grow() {
    if (growing) {
      r = r + 2;
    }
  }
  
  boolean edges() {
    return (x + r > width || x -  r < 0 || y + r > height || y -r < 0);
  }

  void show() {
    fill(r1,g1,b1,a);
    ellipse(x, y, r*2, r*2);
  }
}
