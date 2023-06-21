class Segment
{
 PVector p1, p2;
 int len;
 float angle;
 
 Segment(PVector p1, PVector p2)
 {
  this.p1 = p1;
  this.p2 = p2;
  len = (int)(p1.y - p2.y);
 }
 
 void calcP2()
 {
  float dx = len * cos(angle);
  float dy = len * sin(angle);
  p2.set(p1.x + dx, p1.y + dy);
 }
 
 void follow(float x, float y)
 {
  //this spins it
  PVector target = new PVector(x, y); 
  PVector dir = PVector.sub(target, p1);
  angle = dir.heading();
  
  //this moves p1
  dir.setMag(len);
  dir.mult(-1);
  p1 = PVector.add(target, dir);
  
  //this moves p2
  calcP2();
 }
  
 void render()
 {
  line(p1.x, p1.y, p2.x, p2.y);
 }
}
