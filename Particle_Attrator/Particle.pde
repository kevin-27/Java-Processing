class Particle
{
 PVector pos, vel, acc;
 int r;
 float maxS;
 
 Particle()
 {
  r = 4;
  maxS = 2;
  pos = new PVector(random(width), random(height));
  vel = new PVector(random(-maxS, maxS), random(-maxS, maxS));
  acc = new PVector();
 }
 
 void update()
 {
  vel.add(acc);
  vel.limit(maxS);
  pos.add(vel);
  //vel.mult(0.99);
  acc.mult(0);
  
  border();
 }
 
 void border()
 {
  if (pos.x < r)
   {
     vel.x *= -1;
     pos.x += vel.x + 1;
   }
   if (pos.x > width - r)
   {
     vel.x *= -1;
     pos.x += vel.x - 1;
   }
   if (pos.y < r)
   {
     vel.y *= -1;
     pos.y += vel.y + 1;
   }
   if (pos.y > height - r)
   {
     vel.y *= -1;
     pos.y += vel.y - 1;
   }
 }
 
 void render()
 {
  stroke(255);
  strokeWeight(r*2);
  point(pos.x, pos.y); 
  
  update();
 }
}
