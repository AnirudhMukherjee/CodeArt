ArrayList<Particle> pts;
boolean onPressed;
PFont f;

void setup() {
  fullScreen();
  smooth();
  colorMode(HSB);
  rectMode(CENTER);

  pts = new ArrayList<Particle>();

  f = createFont("Calibri", 24, true);

  background(255);
}

void draw() {
  if (onPressed) {
    for (int i=0;i<10;i++) {
      Particle newP = new Particle(mouseX, mouseY, i+pts.size(), i+pts.size());
      pts.add(newP);
    }
  }

  for (int i=pts.size()-1; i>-1; i--) {
    Particle p = pts.get(i);
    if (p.dead) {
      pts.remove(i);
    }else{
      p.update();
       p.display();
    }
  }
}
