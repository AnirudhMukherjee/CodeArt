float strokeLength = 35; 
float strokeThickness = 10;
float noiseScale = 0.005;

//String imgNames = ["img_1.jpg", "img_2.jpg", "img_3.jpg"];
PImage img;
int imgIndex = -1;

int drawLength = 250;
int frame =0;


//void preload() {
//  for (let i = 0; i < imgNames.length; i++) {
//    imgs.push(loadImage(imgNames[i]));
//  }
//}


void setup() {
  size(1080, 720);
  background(255);
  img = loadImage("img2.jpg");
}


void draw() {
  //image(img,0,0);
  loadPixels();
  if (frame > drawLength) {
    return;
  }
  
  translate(width / 2 - img.width / 2, height / 2 - img.height / 2);
  
  float count = map(frame, 0, drawLength, 2, 80);
  
  for (int i = 0; i < count; i++) {
    int x = int(random(img.width));
    int y = int(random(img.height));

    int index = (y * img.width + x);
    print(red(img.pixels[index]) + "\n");
    float r = red(img.pixels[index]);
    float g = green(img.pixels[index]);
    float b = blue(img.pixels[index]);
    float a = alpha(img.pixels[index]);

    stroke(r, g, b, a);
    
    float strokeThickness = map(frame, 0, drawLength, 25, 0);
    strokeWeight(strokeThickness);
    

      push();
      translate(x, y);
      float n = noise(x * noiseScale, y * noiseScale);
      rotate(radians(map(n, 0, 1, -180, 180)));
      
      float lengthVariation = random(0.75, 1.25);
      line(0, 0, strokeLength * lengthVariation, 0);
      
      stroke(min(r * 3, 255), min(g * 3, 255), min(b * 3, 255), random(100));
      strokeWeight(strokeThickness * 0.8);
      line(0, -strokeThickness * 0.15, strokeLength * lengthVariation, -strokeThickness * 0.15);
      pop();
  }

  frame++;
}


//function changeImage() {
//  background(255);
  
//  frame = 0;
  
//  noiseSeed(int(random(1000)));
  
//  imgIndex++;
//  if (imgIndex >= imgNames.length) {
//    imgIndex = 0;
//  }
  
//  imgs[imgIndex].loadPixels();
//}
