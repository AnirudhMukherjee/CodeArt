float arcSize = 200;
float sw,alpha;
float yStep = 30;
void setup(){
 size(800,800); 
}

void draw(){
 background(255);
 
 //mouseX = constrain(mouseX,10,width);
 //mouseY = constrain(mouseY,50,height);
 
 stroke(20);
 noFill();
 
 for(float y = -arcSize;y<height+arcSize;y+=yStep){
   sw = map(sin(radians(y+alpha)),-1,1,2,yStep);
   strokeWeight(sw);
   for(float x1 = arcSize/2;x1<width+arcSize;x1+=arcSize){
     arc(y,x1,arcSize/2,arcSize/2,0,PI);
   }
   sw = map(sin(radians(y-alpha)),-1,1,2,yStep);
   strokeWeight(sw);
   for(float x2= 0;x2<width+arcSize;x2+=arcSize){
    arc(x2,y,arcSize/2,arcSize/2,PI,TWO_PI); 
   }
  }
  alpha++;
}
