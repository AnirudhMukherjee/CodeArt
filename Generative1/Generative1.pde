float x,y,x1,y1,x2,y2,x3,y3;
float noiseX,noiseY,nx1,ny1,nx2,ny2;

void setup(){
  size(800,800);
  background(255);
}

void draw(){
  
}

void mousePressed(){
  background(255);
  for(int i =0;i<80;i++){
    noiseX = random(width);
    noiseY = random(height);
    x = random(-1,1)*width* noise(frameCount * noiseX)*0.3;
    y = random(-1,1)* height*noise(frameCount * noiseY)*0.2;
    x1 = random(-1,1)*width* noise(frameCount * noiseX)*0.7;
    y1 = random(-1,1)* height*noise(frameCount * noiseY)*0.5;
    x2 = random(-1,1)*width* noise(frameCount * noiseX)*0.7;
    y2 = random(-1,1)* height*noise(frameCount * noiseY)*0.55;
    x3 = random(-1,1)*width* noise(frameCount * noiseX)*0.4;
    y3 = random(-1,1)* height*noise(frameCount * noiseY)*0.8;
    push();
    translate(width/2,height/2);
    stroke(0);
    strokeWeight(random(5));
    //line(0,0,x,y);
    fill(random(255),random(255),random(255));
    beginShape();
    curveVertex(x,y);
    curveVertex(x1,y1);
    curveVertex(x2,y2);
    curveVertex(x3,y3);
    endShape();
    pop(); 
    }
}
