class Boid
{
 int s;
 int mag;
 int radi;
 float r;
 int maxSpeed;
 float maxSteer;
 float rotation;
 PVector pos;
 PVector vel;
 PVector acc;
 PVector a, b, c;
 
 Boid()
 {
  s = 4;
  r = s/2;
  maxSteer = 0.03;
  maxSpeed = 2;
  radi = 50;
  mag = 2;
  //pos = new PVector(random(width), random(height));
  pos = new PVector(width/2, height/2);
  float angle = random(TWO_PI);
  vel = new PVector(cos(angle), sin(angle));
  //vel = new PVector(random(-1, 1), random(-1, 1)); 
  acc = new PVector(0, 0);
  a = new PVector(pos.x, pos.y - s*2);
  b = new PVector(pos.x - s, pos.y + s);
  c = new PVector(pos.x + s, pos.y + s);
 }
 
 void update()
 {
  vel.add(acc);
  vel.limit(maxSpeed);
  pos.add(vel); 
  rotation = vel.heading() + HALF_PI;
  acc.set(0, 0);
  
  turn();
  
  if (pos.x < -r)
    pos.x = width+r;
  else if (pos.y < -r)
    pos.y = height+r;
  else if (pos.x > width+r)
    pos.x = -r;
  else if (pos.y > height+r)
    pos.y = -r;
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
 
 void aline(Boid boid[])
 {
  int total = 0;
  PVector avarage = new PVector();
  for (Boid b : boid)
  {
   float d = dist(pos.x, pos.y, b.pos.x, b.pos.y);
   if (d > 0 && d <= radi)
   {
    total++;
    avarage.add(b.vel);
   }
  }
  if (total > 0)
  {
   avarage.div(total);
   avarage.setMag(mag); //changes the speed
   avarage.sub(vel);
   avarage.limit(maxSteer);
   acc.add(avarage);
  }
 }
 
 void cohesion(Boid boid[])
 {
  int total = 0;
  PVector avarage = new PVector();
  for (Boid b : boid)
  {
   float d = dist(pos.x, pos.y, b.pos.x, b.pos.y);
   if (d > 0 && d <= radi)
   {
    total++;
    avarage.add(b.pos);
   }
  }
  if (total > 0)
  {
   avarage.div(total);
   avarage.sub(pos);
   avarage.setMag(mag); //changes the speed
   avarage.sub(vel);
   avarage.limit(maxSteer);
   acc.add(avarage);
  }
 }
 
 void separation(Boid boid[])
 {
  int total = 0;
  PVector avarage = new PVector();
  for (Boid b : boid)
  {
   float d = dist(pos.x, pos.y, b.pos.x, b.pos.y);
   if (d > 0 && d <= radi-25)
   {
    PVector diff = PVector.sub(pos, b.pos);
    diff.div(d);
    total++;
    avarage.add(diff);
   }
  }
  if (total > 0)
  {
   avarage.div(total);
   avarage.setMag(mag); //changes the speed
   avarage.sub(vel);
   avarage.limit(maxSteer);
   acc.add(avarage.mult(1.5));
  }
 }
 
 void render()
 {
  //ellipse(pos.x, pos.y, s, s);
  triangle(a.x, a.y, b.x, b.y, c.x, c.y);
 }
}
