//import peasy.*;

float angle = 0;
//PeasyCam cam;
ArrayList<PVector> vectors = new ArrayList<PVector>();

float beta = 0;
float mu = 0;
int nmeridian = 6;
int nlongitude = 11;
void setup(){
 size(800,800,P3D); 
 //colorMode(HSB);
 //cam = new PeasyCam(this, 400);
 
}

void draw(){
 background(0);
 translate(width/2,height/2);
 //do rotations
  rotateY(angle);
  angle += 0.03;
  //float r = 200*1.2 * 0.6 * sin(0.5 * PI + 6 * beta);
  //float theta = 4 * beta;
  //float phi = 0.2 * PI * sin(6 * beta);
  //float x = r * cos(phi) * cos(theta);
  //float y = r * cos(phi) * sin(theta);
  //float z = r * sin(phi);
  float x = 10 * (cos(mu) + cos(3*mu)) + cos(2*mu) + cos(4*mu);
     float y = 6 * sin(mu) + 10 * sin(3*mu);
     float z = 4 * sin(3*mu) * sin(5*mu/2) + 4*sin(4*mu) - 2 * sin(6*mu);
   //mu = i * TWOPI / (double)NSEGMENTS;
  //float x = cos(mu) * (1 + cos(nlongitude*mu/(float)nmeridian) / 2.0);
  // float y = sin(mu) * (1 + cos(nlongitude*mu/(float)nmeridian) / 2.0);
  // float z = sin(nlongitude*mu/(float)nmeridian) / 2.0;
  vectors.add(new PVector(10*x,10*y,10*z));
  mu+=0.05; 

  beta+=0.01;
  noFill();

  strokeWeight(10);
  beginShape();
  //for(PVector v: vectors){
  // float d = v.mag();
  // stroke(d,d*10,200);
  // vertex(v.x,v.y,v.z); 
  //}
  
  for(int i =0;i<vectors.size();i++){
    float d = vectors.get(i).mag();
    float hu = map(i,0,vectors.size(),0,255);
    stroke(255, d, 255);
    vertex(vectors.get(i).x,vectors.get(i).y,vectors.get(i).z);
    
  }
  endShape();
}
