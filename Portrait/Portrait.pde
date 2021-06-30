PImage img;
int xPos, yPos;

void setup(){
 img = loadImage("6.jpg");
 size(1080,1080);
 img.resize(int(img.width ),int(img.height*0.666));
 background(255);
 translate((1080-img.width)/2,(1080-img.height)/2);
 for(int col = 0; col<img.width;col+=2){
   for(int row = 0;row<img.height;row+=2){
     xPos = col;
     yPos = row;
     color c= img.get(col,row);
     push();
     translate(xPos,yPos);
     rotate(radians(random(360)));
     noFill();
     strokeWeight(random(3));
     stroke(color(c));
     curve(xPos,yPos, sin(xPos) * random(60), cos(yPos) * sin(xPos) * random(90), random(10),random(80), cos(yPos) * sin(xPos) * 140, cos(yPos) * sin(yPos) * 50);
     //curve(xPos,yPos, sin(xPos) * random(150), cos(yPos) * sin(xPos) * random(150), random(60),random(80), cos(yPos) * sin(xPos) * 180, cos(yPos) * sin(yPos) * 90);
     pop();
     }
   }
}

void draw(){
  
}

void keyPressed(){
 if(key =='s'){
  saveFrame(str(random(2000))+ ".png"); 
 }
}
