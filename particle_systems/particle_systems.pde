ParticleSystem ps;

void setup(){
  size(640,360);
  ps = new ParticleSystem(new PVector(width/2,height/2));
}

void draw(){
  background(0);
  ps.addParticle();
  ps.run();
}

class ParticleSystem{
  ArrayList<Particle> particles; 
  PVector origin;
  
  ParticleSystem(PVector position){
   origin = position.copy();
   particles = new ArrayList<Particle>();
  }
  
  void addParticle(){
   particles.add(new Particle(origin));
  }
  
  void run(){
   for(int i = particles.size()-1;i>=0;i--){
    Particle p = particles.get(i);
    p.run();
    if(p.isDead()) particles.remove(i);
   }
  }
}

class Particle{
 PVector position;
 PVector velocity;
 PVector acceleration;
 float lifespan;
 float size;
 color pColor;
 
 Particle(PVector l){
  acceleration = new PVector(random(-1,1),random(-0.5,0.5));
  velocity = new PVector(random(-3,3),random(-2,0));
  position = l.copy();
  lifespan = 255.0;
  size = 1;
  pColor = color(random(255),random(255),random(255));
 }
 
 void run(){
  update();
  display();
 }
 
 void update(){
  velocity.add(acceleration);
  position.add(velocity);
  lifespan-=1.0;
  //size-=0.1;
 }
 
 void display(){
   stroke(255,lifespan);
   fill(pColor,lifespan);
   ellipse(position.x,position.y,size, size);
 }
 
 boolean isDead(){
  if(lifespan<0.0){
   return true; 
  }
  else return false;
 }
}
