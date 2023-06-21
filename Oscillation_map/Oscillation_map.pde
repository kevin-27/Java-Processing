float h = 0;
float angle = 0;

void setup()
{
  size(256, 256);
}

void draw()
{
  background(27);
  translate(width/2, height/2);
  fill(255);
  noStroke();
  rectMode(CENTER);
  
  h = map(sin(angle), -1, 1, 0, 256);
  rect(0, 0, 8, h);
  rect(0, 0, h, 8);
  
  angle += 0.1;
  println("" + h);
}
