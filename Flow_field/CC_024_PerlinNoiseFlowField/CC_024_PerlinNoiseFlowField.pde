FlowField flowfield;
ArrayList<Particle> particles;

boolean debug = false;

void setup() {
  size(1200, 800);
  colorMode(HSB,255);
  flowfield = new FlowField(10);
  flowfield.update();

  particles = new ArrayList<Particle>();
  for (int i = 0; i < 10000; i++) {
    PVector start = new PVector(random(width), random(height));
    particles.add(new Particle(start, random(2,10)));
  }
  background(255);
}

void draw() {
  flowfield.update();
  
  if (debug) flowfield.display();
  
  for (Particle p : particles) {
    p.follow(flowfield);
    p.run();
  }
}
