class Laser
{
 PVector pos;
 PVector dis;
 PVector vel;
 boolean fired;
 float maxDis;
 
 Laser(PVector pos)
 {
   maxDis = 1000;
   vel = new PVector();
   dis = new PVector();
   this.pos = new PVector();
   this.pos.set(pos);
 }
 
 void reset()
 {
  fired = false;
  dis = new PVector();
 }
 
 boolean intersects(PVector rockPos, float Di)
 {
   float diffX = rockPos.x - pos.x;
   float diffY = rockPos.y - pos.y;
   float distance = (float)Math.sqrt((diffX * diffX) + (diffY * diffY));
   
   if (distance <= Di)  
     return true;
   else
     return false;
 }
 
 void update(PVector pos)
 {
   if (maxDis < Math.abs(dis.x) + Math.abs(dis.y))
     reset();
     
   if (fired)
   {
     this.pos.add(vel);
     dis.add(vel);
   }
   else
     this.pos.set(pos);
     
   bounds();
 }
 
 void bounds()
  {
   if (pos.x < 0)
     pos.x = width;
   else if (pos.y < 0)
     pos.y = height;
   else if (pos.x > width)
     pos.x = 0;
   else if (pos.y > height)
     pos.y = 0;
  }
 
 void shoot(PVector force)
 {
   fired = true;
   vel.set(force.mult(20));
 }
 
 void render()
 {
   strokeWeight(3);
   point(pos.x, pos.y);
 }
}
