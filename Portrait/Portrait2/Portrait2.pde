PImage img;
int xPos, yPos;

void setup(){
 img = loadImage("3.jpg");
 size(400,575);
 //img.resize(1200,800);
 background(0);
 //translate(800-img.width,0);
 for(int col = 0; col<img.width;col+=10){
   for(int row = 0;row<img.height;row+=10){
     xPos = col;
     yPos = row;
     color c= img.get(col,row);
     //push();
     //translate(xPos,yPos);
     //rotate(radians(random(360)));
     //noFill();
     //strokeWeight(random(3));
     //stroke(color(c));
     //curve(xPos,yPos, sin(xPos) * random(60), cos(yPos) * sin(xPos) * random(90), random(10),random(80), cos(yPos) * sin(xPos) * 140, cos(yPos) * sin(yPos) * 50);
     //pop();
     fill(c);
     ellipse(xPos,yPos,10,10);
     }
   }
}

void draw(){
  
}
