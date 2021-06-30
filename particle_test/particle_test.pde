ArrayList<Particle> parr;
float noiseScale = 2000;

void setup(){
 size(1000,500); 
 background(0);
 noStroke();
 parr = new ArrayList<Particle>();
 for(int i = 0;i<10;i++){
   Particle p = new Particle(random(width));
   parr.add(p);
 }
}

void draw(){

  for(int i = 0;i<10;i++){
   parr.get(i).move(); 
   parr.get(i).show();
  }
}

class Particle{
 PVector position;
 PVector vel;
 PVector acc;
 float lifespan;
 
 Particle(float w){
   this.position = new PVector(w,0);
   this.vel = new PVector(0,0);
   this.lifespan = 20;
 }
 
 void show(){
  fill(255);
  ellipse(this.position.x,this.position.y,5,5); 
 }
 
 void move(){
   float angle = noise(this.position.x/noiseScale, this.position.y/noiseScale)*TWO_PI*noiseScale;
   //
   float i = random(1,5);
   //this.vel.y = sin(angle);
   while(i>0){
   this.vel.x = cos(angle)/10;
   this.vel.y = sin(angle)/10;
   this.position.add(this.vel);
   i--;
   }
   
 }
  
}
