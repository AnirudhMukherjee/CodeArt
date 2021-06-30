int symmetry = 12;
float angle = 360/symmetry;
float strokeSize = 8;
float xoff;

void setup(){
 size(800,800);
 background(0);
}

void keyPressed() {
  if (key == 's' || key == 'S') {
    save("snowflake.png");
    println("snowflake saved!");
  } else if (key == 'c' || key == 'C') {
    background(0);
  }
}

void draw(){
  translate(width/2,height/2);
  float mx = mouseX-width/2;
  float my = mouseY-height/2;
  float pmx = pmouseX - width/2;
  float pmy = pmouseY - width/2;
  
  if(mousePressed){
  int hu1 = int(map(sin(radians(xoff)),-1,1,0,255));
  int hu2 = int(map(cos(radians(xoff)),-1,1,0,255));
  int hu3 = int(map(sin(radians(xoff)),-1,1,0,255));
  
  xoff+=1;
  stroke(hu1,hu2,random(255));
  //float angle = TWO_PI/symmetry;
  for(int i = 0;i<symmetry;i++){
  rotate(radians(angle));
  float sw = strokeSize;
  strokeWeight(sw);
  line(mx,my, pmx, pmy);
  
  pushMatrix();
  scale(-1,1);
  line(mx,my,pmx,pmy);
  popMatrix();
  }
  }
}
