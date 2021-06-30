float strokeLength = 35; 
float strokeThickness = 10;
float noiseScale = 0.005;

String imgNames[] = {"1.jpg"};
PImage imgs[] = new PImage[3];
int imgIndex = -1;

float drawLength = 250;
float frame;
PImage img;

void setup() {
  size(1024, 1024);
  img = loadImage("15.jpg");
  //img.resize(400,700);
  colorMode(RGB);
  background(255);
}


void draw() {
  if (frame > drawLength) {
    return;
  }
  
  translate(
    width / 2 - img.width / 2,
    height / 2 - img.height / 2
  );
  
  float count = map(frame, 0, drawLength, 2, 80);
  
  for (int i = 0; i < count; i++) {
    int x = int(random(img.width));
    int y = int(random(img.height));
    //println(x + " " + y);
    //int index = (y * img.width + x) * 4;


    //int r = img.pixels[index];
    //int g = img.pixels[index + 1];
    //int b = img.pixels[index + 2];
    //int a = img.pixels[index + 3];
    
    color c = img.get(x,y);
    float r = red(c);
    float g = green(c);
    float b = blue(c);
    float a = alpha(c);
    println(r+ " " +g + " " + b);
    stroke(r, g, b, a);
    
    float strokeThickness = map(frame, 0, drawLength, 25, 0);
    strokeWeight(strokeThickness);
    
    pushMatrix();
    pushStyle();
      translate(x, y);
      float n = noise(x * noiseScale, y * noiseScale);
      rotate(radians(map(n, 0, 1, -180, 180)));
      
      float lengthVariation = random(0.75, 1.25);
      line(0, 0, strokeLength * lengthVariation, 0);
      
      stroke(min(r * 3, 255), min(g * 3, 255), min(b * 3, 255), random(100));
      strokeWeight(strokeThickness * 0.8);
      line(0, -strokeThickness * 0.15, strokeLength * lengthVariation, -strokeThickness * 0.15);
    popStyle();
    popMatrix();
    
  }
  
  frame++;
}

void keyPressed(){
 if(key=='s'){
  saveFrame(str(random(5000)) +".png"); 
 }
}
