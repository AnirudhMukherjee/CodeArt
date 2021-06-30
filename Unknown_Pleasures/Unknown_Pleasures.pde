void setup()
{
size(500, 800);
fill(0);
stroke(255);
}

void draw()
{
background(0);
for (int y = 200; y < 730; y += 5) {
beginShape();
for ( int x = 0; x < 500; ++x ) {
float n = noise( x/30.0 - frameCount/50.0 + y);
vertex( x, y - 80.0 / (1.0 + pow(x-250.0, 4) / 17.0e6)*n);
}
vertex( 500, 1000 );
vertex( 0, 1000 );

endShape();
}
}
