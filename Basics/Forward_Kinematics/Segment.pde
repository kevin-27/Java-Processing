class Segment
{
 PVector p1, p2;
 int len;
 float offset = random(1000);
 float angle;
 float reduce = 0.75;
 
 Segment(PVector p1, PVector p2)
 {
  this.p1 = p1;
  this.p2 = p2;
  len = (int)(p1.y - p2.y);
 }
 
 Segment child()
 {
  return new Segment(p2, new PVector(p2.x, p2.y-(len*0.75))); 
 }
 
 void setAngle(PVector startP, PVector endP)
 {
    angle = map(noise(offset), 0, 1, -1, 1);
    offset += 0.01;
    
    PVector dir = PVector.sub(endP, startP);
    dir.rotate(angle);
    dir.mult(reduce);
    p1 = endP;
    p2 = PVector.add(p1, dir);
 }
 
 void render()
 {
  line(p1.x, p1.y, p2.x, p2.y);
 }
}
