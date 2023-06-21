PVector p1, p2;

void setup()
{
 size(480, 480);
 background(0);
 p1 = new PVector(width/2, height/2);
 p2 = new PVector((width/2)+100, height/2);
}

void draw()
{
 background(0);
 fill(255);
 stroke(255);
 
 ellipse(p1.x, p1.y, 64, 64);
 ellipse(p2.x, p2.y, 16, 16);
 
 p2.set(Rotate(p2, p1, 0.025));
}

PVector Rotate(PVector P1, PVector P2, float angle)
{
  PVector dir = PVector.sub(P1, P2);
  dir.rotate(angle);
  return PVector.add(P2, dir);
}
