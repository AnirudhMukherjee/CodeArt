void setup(){
  size(1024,1024);
  background(255);
  noStroke();
  for(int j =0;j<80;j++){
   float x = random(width);
   float y = random(height);
   float w = random(80);
   float h = random(150);
   for(int i = 1;i<25;i++){
    fill(random(255),random(255),random(255),60-i);
    ellipse(x,y,w+i*2,w+i*2);
   }
  }
}

void draw(){
  
}
