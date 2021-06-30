int spacing =30;
int x = 0, y= 0;
void setup(){
 size(800,800);
 //background(227, 213, 16);
 //background(242, 155, 239);
 background(0, 48, 73);
}

void draw(){
  stroke(234, 226, 183);
  strokeWeight(10);
  color c = color(random(255),random(255),random(255));
  if(random(1) <0.5){
    //stroke(c);//or keep stroke 0
     line(x,y,x+spacing,y+spacing);                
   }
  else{
    //stroke(c);
     line(x,y+spacing,x+spacing,y);
   } 
   x+=spacing;
   
   if(x>width){
    x= 0;
    y+=spacing;
   }

}
