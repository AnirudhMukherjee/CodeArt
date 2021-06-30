
void setup(){
 size(400,400);
 background(227, 213, 16);            
}

void draw(){
  stroke(0);
  for(int x=0;x<width;x+=10){
  for(int y=0;y<height;y+=10){
  if(random(1) <0.5){
     line(x,y,x+10,y+10);                
   }
  else{
     line(x,y+10,x+10,y);
   } 
  }  
  }  
}
