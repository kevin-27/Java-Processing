Segment seg;

void setup()
{
 size(480, 480);
 
 seg = new Segment(new PVector(width/2, height/2), 
  new PVector(width/2, (height/2)-100));
}

void draw()
{
 background(0);
 stroke(255);
 strokeWeight(4);
 
 seg.render();
 seg.follow(mouseX, mouseY);
}
