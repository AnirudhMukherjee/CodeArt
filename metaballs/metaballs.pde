Blob[] blob= new Blob[10];
void setup(){
  size(1000,1000);
  for(int i = 0;i<blob.length;i++){
  blob[i] = new Blob(random(width),random(height));
  background(255);
  }
}

void draw(){
  background(255);
  
  loadPixels();
  for(int x= 0;x<width;x++){
    for(int y = 0;y<height;y++){
      int index = x + y * width;
      float sum = 0;
      for(Blob b: blob){
      float d= dist(x,y,b.pos.x,b.pos.y);
      sum+= 5* b.r/d;
      }
      if(sum>100)
      pixels[index] = color(255-sum);
    }
  }
  
  updatePixels();
  for(Blob blobs: blob){
  blobs.update();
  //blobs.show();
  }
}
