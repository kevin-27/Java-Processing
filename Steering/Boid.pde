class Boid
{
 PVector a, b, c;
 PVector pos, vel, acc;
 int s;
 float rotation;
 float mag;
 float maxSpeed;
 
 Boid()
 {
  s = 8;
  pos = new PVector(width/2, height/2);
  vel = new PVector();
  acc = new PVector();
  maxSpeed = 4;
  mag = maxSpeed;
  a = new PVector(pos.x, pos.y - s*2);
  b = new PVector(pos.x - s, pos.y + s);
  c = new PVector(pos.x + s, pos.y + s);
 }
 
 void update()
 {
  seek();
  arive();
  move();
 }
 
 void seek()
 {
  PVector target = new PVector(mouseX, mouseY);
  PVector dir =  PVector.sub(target, pos);
  
  dir.setMag(mag); //changes the speed
  dir.sub(vel);
  dir.limit(0.1);
  acc.add(dir);
 }
 
 void arive()
 {
  PVector target = new PVector(mouseX, mouseY);
  float dist = dist(pos.x, pos.y, target.x, target.y);
  if (dist < 100)
  {
   mag = map(dist, 0, 100, 0, maxSpeed);
  }
  else
   mag = maxSpeed;
 }
 
 void move()
 {
  pos.add(vel); 
  vel.add(acc);
  vel.limit(3);
  rotation = vel.heading() + HALF_PI;
  acc.set(0, 0);
  
  turn();
 }
 
 void turn()
 {
  a.set(pos.x, pos.y - s*2);
  b.set(pos.x - s, pos.y + s);
  c.set(pos.x + s, pos.y + s);
  
  a.set(Rotate(a, pos, rotation));
  b.set(Rotate(b, pos, rotation));
  c.set(Rotate(c, pos, rotation));
 }
 
 PVector Rotate(PVector P1, PVector P2, float angle)
 {
  PVector dis = PVector.sub(P1, P2);
  dis.rotate(angle);
  return PVector.add(P2, dis);
 }
 
 void render()
 {
  noFill();
  stroke(255);
  triangle(a.x, a.y, b.x, b.y, c.x, c.y);
  update();
 }
}
