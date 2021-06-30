color BLACK = color(27, 27, 27);
color WHITE = color(235, 235, 235, 7);
color RED = color(181, 32, 10, 7);
color GOLDEN = color(218, 185, 32, 7);
color GREEN = color(32, 181, 10, 7);
color CYAN = color(20, 255, 255, 7);
color PURPLE = color(255, 20, 255, 7);
float extra_variance;
color COLORS[] = { WHITE, RED, GOLDEN, GREEN, CYAN, PURPLE};

ArrayList<PVector> regular;
ArrayList<PVector> deformed;

void setup(){
  size(1024,1024);
  frameRate(100);
  strokeWeight(3);
  noStroke();
  extra_variance = 0;
  background(255);
  regular = new ArrayList<PVector>();
  deformed = new ArrayList<PVector>();
}

void draw(){
  noFill();
  stroke(0);
  regular_polygon(width/2,height/2, 375,5);
  deform(7,300+extra_variance,5);
  beginShape();
  for(PVector p : deformed){
   vertex(p.x,p.y); 
  }
  endShape();
}

void regular_polygon(float x,float y,float radius, int n_sides){
  float sec = TWO_PI/n_sides;
  ArrayList<Float> ang = new ArrayList<Float>();
  for(int i =0;i<n_sides;i++){
   ang.add(sec *i);
  }
  
  for(float a: ang){
    PVector p = new PVector(x + cos(a) * radius,
            y + sin(a) * radius);
    regular.add(p);
    print(p);
  }
}

void deform(float depth, float var, float evar){
  for(int i =1;i<regular.size();i++){
    PVector prev = regular.get(i-1);
    deformed.add(prev);
    subd(prev,regular.get(i), depth, var/10, evar);
  }
}

void subd(PVector p1, PVector p2, float d, float var, float e_var){
  if(d<=0) return;
  float mx = (p1.x + p2.x) / 2;
  float my = (p1.y + p2.y) / 2;
  float nx = map(noise((p1.x + p2.x + frameCount) / 10.0), 0, 1, -2.5, 2.5);
  float ny = map(noise((p1.y + p2.y + frameCount) / 10.0), 0, 1, -2.5, 2.5);
  
  nx = mx + nx * var;
  ny = my + ny * var;
  PVector np = new PVector(nx,ny);
  
  float nd = d-1;
  float nv = var/e_var;
  subd(p1,np,nd,nv,e_var);
  deformed.add(np);
  subd(np,p2,nd,nv,e_var);
  
}
