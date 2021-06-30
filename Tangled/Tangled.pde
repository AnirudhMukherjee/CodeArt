float t = 0;

void setup(){
 size(800,800);
 background(255);
 t+=1/5000; 
 
 for(float x=45;x<width;x+=100){
  beginShape();
  for(float y = -40;y<height+40;y++){
   float a=noise(x,y/width,t)*50;
   float b=noise(x,y/width-t)*33;
   vertex(x+sin(a)*50,y+cos(b)*(cos(a)-sin(x*y))*30);
   
  }
  endShape();
  }
}

void draw(){
 
 }
