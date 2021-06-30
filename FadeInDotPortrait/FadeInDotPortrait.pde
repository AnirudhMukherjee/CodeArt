PImage img;
float movx, movy = 0;
void setup(){
  size(500,500);
  img = loadImage("2.jpg");
  img.resize(500, 500);
  frameRate(40);
}

void draw(){
  background(255);
  
  fill(0);
  noStroke();
  
  float tiles = movx/10;
  float tileSize = width/tiles;
  
  translate(tileSize/2, tileSize/2);
  
  for (float x = tiles; x > 0; x--) {
    for (float y = tiles; y > 0; y--) {
      
      color c = img.get(int(x*tileSize),int(y*tileSize));
      float size = map(brightness(c), 0 , 255, 12,0);
      
    ellipse(x*tileSize, y*tileSize, size, size);
    }
  }
  movx+=1;
}
