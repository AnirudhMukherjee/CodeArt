float r = 1;
void setup(){
  size(1080,1080);
  background(255);
  noFill();
  //strokeWeight(1);
  stroke(0);
  translate(width/4,height/4);
  for(;r<2000;r+=0.5){
    if(random(-5,5)>0)
    stroke(random(255),random(255),random(255),random(40,80));
    ellipse(0,0,r,r);
    print(r);
  }
}

void draw(){
  
}
