class Blob{
 PVector pos;
 float r;
 PVector vel;
 PVector acc;
 
 Blob(float x, float y){
  pos= new PVector(x,y);
  r = random(500,1000);
  vel = PVector.random2D();
  vel.mult(random(5,15));
  acc = new PVector(random(-3,3),random(1,3));
 }
 void update(){
   pos.add(vel);
   vel.add(acc);
   if(pos.x > width || pos.x<0){
    vel.x *=-1; 
   }
   if(pos.y > height || pos.y<0){
    vel.y *=-1;
   }
 }

}
