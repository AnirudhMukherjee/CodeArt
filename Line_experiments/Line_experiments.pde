int total = 500;
ArrayList<PVector> points;
PImage img;
void setup(){
  size(1024,721);
  background(255, 237, 43);
  img = loadImage("1.jpg");
  points = new ArrayList<PVector>();
  for(int x = 0;x<img.width;x++){
    for(int y =0;y<img.height;y++){
     color c = img.get(x,y);
     if(red(c) < 255 && green(c)<255 && blue(c)<255){
       points.add(new PVector(x,y));
     }
    }
  }
}

void draw(){
 stroke(123,31,51);
 strokeWeight(2);
 int p1 =(int)random(points.size());
 int p2 =(int)random(points.size());
 PVector p11 = points.get(p1);
 PVector p22 = points.get(p2);
 line(p11.x,p11.y,p22.x,p22.y);
}
