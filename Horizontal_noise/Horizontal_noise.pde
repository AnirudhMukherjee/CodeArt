PVector[][] points = new PVector[20][64];
int num = 20;

void setup() {
  size(630, 400);
  background(255,255,255);
   int y = 5;
   float offset = 0.3;
   for(int i = 0;i < 20; i++){
  for (int j = 0; j < 64; j++) {
    points[i][j] = new PVector(j*10, y+ 30 * random(-1,1) * noise(offset));
  }
  y+=30;
}

  strokeWeight(2);
  strokeCap(SQUARE);
 
  for (int i = 0; i < 19; i++) {
    stroke(0);
    fill(random(255),random(255),random(255));
    //see that you need at least four points to draw a curve
    //the first and last being handles which determine the curve of the curve
    beginShape();
    for(int x = 0; x<64;x++){
      //line(points[i][x].x,points[i][x].y,points[i][x+1].x,points[i][x+1].y);
      curveVertex(points[i][x].x,points[i][x].y);
    }
    for(int x = 63; x>=0;x--){
      //line(points[i][x].x,points[i][x].y,points[i][x+1].x,points[i][x+1].y);
      curveVertex(points[i+1][x].x,points[i+1][x].y);
    }
    endShape();
  }
      fill(random(255),random(255),random(255));

  beginShape();
  stroke(0);
  vertex(0,0);
  vertex(630,0);
    for(int x = 63; x>=0;x--){
      //line(points[i][x].x,points[i][x].y,points[i][x+1].x,points[i][x+1].y);
      vertex(points[1][x].x,points[1][x].y);
    }
    endShape();
}
 

 
void draw() {
  
 
  //so that you can see where the points are
 
} 
