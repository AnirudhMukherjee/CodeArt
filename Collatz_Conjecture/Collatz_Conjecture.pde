float a;
int i;
void setup(){
  size(1080,1080);
  background(255);
  for(int i =1;i<=20000;i++){
  a+=0.1;
  i++;
  IntList seq = new IntList();
  int n = i;
    do{
   seq.append(n);
   n = collatz(n); 
  }while(n!=1);
  seq.append(1);
  seq.reverse();
  
  float len = 30;
  float angle = PI/12; //6,12,8 good values
  float angle2;
  resetMatrix();
  translate(width/4,height/1.2);
  for(int j = 0;j<seq.size();j++){
   int val = seq.get(j);
      if (val % 2 == 0) {
        rotate(angle);
      } else {
        rotate(-angle);
      }
      stroke(0, 50);
      line(0, 0, 0, -len);
      //line(a * 10, a * 10, 0, -len); 
      translate(0, -len);
    }
  }
  println("Done");
}

void draw(){

}

int collatz(int n){
 
  if(n%2==0){
   return n/2;
 }
 else{
   return (3*n+1)/2;
 }
}
