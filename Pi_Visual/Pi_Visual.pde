String pi;
int[] digits;
int[] counts = new int[10];
int index = 0;

color c[] = {#f94144,#f3722c,#f8961e,#f9844a,#f9c74f,#90be6d, #43aa8b,#4d908e,#577590,#277da1};
void setup() {
  size(1025, 1024);
  pi = loadStrings("pi.txt")[0];
  
  //println(pi.length());
  String[] sdigits = pi.split("");

  //println(sdigits.length);
  digits = int(sdigits);

  //printArray(digits);
  background(0);
  stroke(255);
  noFill();
  //translate(width/2, height/2);
  //ellipse(0,0,1000,1000);
}

void draw() {
  
  //translate(width/2, height/2);
  
  //int digit = digits[index];
  //int nextDigit = digits[index+1];
  //index++;
  
  //float diff = TWO_PI/10;
  
  //float a1 = map(digit,0,10,0,TWO_PI) + random(-diff,diff);
  //float a2 = map(nextDigit,0,10,0,TWO_PI) + random(-diff,diff);
  
  //float x1 = 500 * cos(a1);
  //float y1 = 500 * sin(a1);
  
  //float x2 = 200 * cos(a2);
  //float y2 = 200 * sin(a2);
  
  //stroke(255,50);
  //line(x1,y1,x2,y2);
  
  translate(width/2, height/2);
  
  int digit = digits[index];
  int nextDigit = digits[index+1];
  index++;
  
  float diff = TWO_PI/10;
  
  float a1 = map(digit,0,10,0,TWO_PI) + random(-diff,diff);
  float a2 = map(nextDigit,0,10,0,TWO_PI) + random(-diff,diff);
  
  float x1 = 500 * cos(a1);
  float y1 = 200 * cos(a1); //200
  
  float x2 = 200 * sin(a2); //200
  float y2 = 500 * sin(a2);
  stroke(c[digit],50);
  line(x1,y1,x2,y2);

}

void keyPressed(){
 if(key=='s'){
  saveFrame(str(random(10000)) + ".png"); 
 }
}
