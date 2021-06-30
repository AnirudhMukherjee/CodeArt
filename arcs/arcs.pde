void setup()
{
  size (800, 800);
  background(0);
  frameRate(30);
}

void draw()
{
  fill(255, 40);
  arc(width/2, height/2, mouseX, mouseY, PI, TWO_PI);
  arc(width/2, height/2, mouseX, mouseY, 0, PI);
}

void mouseClicked()
{
  background(0);
}
