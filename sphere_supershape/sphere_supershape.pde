import peasy.*;

PeasyCam cam;
PVector[][] globe;
int total = 75;

float offset = 0;

float m=0,m2= 0,n1=0,n2=0,n3=0, n11=0,n12=0,n13=0;
float mchange = 0;


void setup() {
  size(800, 800, P3D);
  cam = new PeasyCam(this, 500);
  colorMode(HSB);
  globe = new PVector[total+1][total+1];
}

float a = 1;
float b = 1;

float supershape(float theta, float m, float n1, float n2, float n3) {
  float t1 = abs((1/a)*cos(m * theta / 4));
  t1 = pow(t1, n2);
  float t2 = abs((1/b)*sin(m * theta/4));
  t2 = pow(t2, n3);
  float t3 = t1 + t2;
  float r = pow(t3, - 1 / n1);
  return r;
}

void draw() {
  //weird sphere
  //m = map(sin(mchange), -1, 1, 3, 6);
  //n1 = map(sin(mchange), -1, 1, 03, 15);
  //n2 = map(sin(mchange), -1, 1, 1, 2);
  //n3 = map(sin(mchange), -1, 1, 5, 7);
  
    m = map(sin(mchange), -1, 1, 5, 20);
  n1 = map(sin(mchange), -1, 1, 20, 100);
  n2 = map(sin(mchange), -1, 1, 4, 24);
  n3 = map(sin(mchange), -1, 1, 5, 35);
  mchange += 0.05;
  
  background(0);
  noStroke();
  lights();
  float r = 200;
  for (int i = 0; i < total+1; i++) {
    float lat = map(i, 0, total, -HALF_PI, HALF_PI);
    float r2 = supershape(lat, m, n1, n2, n3);
    //float r2 = supershape(lat, 2, 10, 10, 10);
    for (int j = 0; j < total+1; j++) {
      float lon = map(j, 0, total, -PI, PI);
      float r1 = supershape(lon, m, n1, n2, n3);
      //float r1 = supershape(lon, 8, 60, 100, 30);
      float x = r * r1 * cos(lon) * r2 * cos(lat);
      float y = r * r1 * sin(lon) * r2 * cos(lat);
      float z = r * r2 * sin(lat);
      globe[i][j] = new PVector(x, y, z);
    }
  }

  //stroke(255);
  //fill(255);
  //noFill();
  offset += 1;
  for (int i = 0; i < total; i++) {
    float hu = map(i, 0, total, 0, 255);
    fill((hu +offset)%600  , 255, 255);
    beginShape(TRIANGLE_STRIP);
    for (int j = 0; j < total+1; j++) {
      PVector v1 = globe[i][j];
      vertex(v1.x, v1.y, v1.z);
      PVector v2 = globe[i+1][j];
      vertex(v2.x, v2.y, v2.z);
    }
    endShape();
  }
}
