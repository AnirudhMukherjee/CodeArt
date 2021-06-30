PImage img;

void setup(){
size(800,533);
img = loadImage("2.jpg");
frameRate(150);
img.resize(800,533);
//image(bild,0,0);
background(0);
}

void draw() {
  noStroke();
 float cs = 80;
  
  int x = int(random(width));
  int y = int(random(height));
  fill(img.get(x,y));
  ellipse(x,y,random(1,35), random(1,35));
  
}
