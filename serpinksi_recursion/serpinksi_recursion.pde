void setup(){
 size(800,800);
 background(0);
}

void draw(){
  background(0);
  stroke(255,random(40,60));
  noFill();
  drawCircle(300,200,300);
}

void drawCircle(float x,float y,float r){
 rect(x,y,r,r);
  if(r>2){
 drawCircle(x+r*0.5,y,r*0.5); 
 drawCircle(x-r*0.5,y,r*0.5);
 drawCircle(x,y+r*0.5,r*0.5);
 drawCircle(x,y-r*1.5,r*0.5);
 }
}
