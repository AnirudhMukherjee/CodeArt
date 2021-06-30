float colors[];
color cor;

void setup(){
 size(800,800);
 colorMode(HSB,360,100,100);
 background(color(180,80,10));
 colors = new float[24];
}

void draw(){
 color main_c = color(360,80,10);
 float f1 = 1;
 noStroke();
 fill(main_c,35);
 rect(0,0,width,height);
 float dx = noise(14+ frameCount * 0.02);
 float dy = noise(15+ frameCount * 0.03);
 
 for(int i = 0;i<24;i++){
  colors[i] =  f1;
  f1+=15;
 }
 
 strokeWeight(2);
 stroke(color(0,30,60));
 for(float c : colors){
   cor = color(c, 100);
        fill(cor);
        pushMatrix();
        translate(height / 2, width / 2);
        rotate(radians(frameCount / 3));
        rotate(radians(c));
        arc(
            map(dx, 0, 1, 0, 20),
            map(dy, 0, 1, 80, 110),
            600, 500,
            0,
            PI / 24,
            PIE
        );
        popMatrix();
 }
 
 pushMatrix();
    translate(height / 2, width / 2);
    fill(color(0, 80, 60));
    ellipse(0, 0, map(dx, 0, 1, 90, 110), map(dy, 0, 1, 90, 110));
    popMatrix();
 
  
}
