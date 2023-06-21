class Ship
{
  PVector a, b, c;
  PVector vel;
  PVector pos;
  float rotation;
  boolean destroyed;
  float acc;
  int lives;
  int s;
  
  Gun gun;
    
  Ship()
  {
   s = 6;
   lives = 3;
   acc = 0.1;
   rotation = 0;
   vel = new PVector(0, 0);
   pos = new PVector(width/2, height/2);
   a = new PVector(pos.x, pos.y-(s*2));
   b = new PVector(pos.x-s, pos.y+s);
   c = new PVector(pos.x+s, pos.y+s);
   
   gun = new Gun(pos);
  }
  
  void resetD()
  {
   if (ship.destroyed && ship.lives > 0)
   {
     pos.set(width/2, height/2);
     gun.reset();
     vel.set(0, 0);
     destroyed = false;
   }
  }
  
  void resetN()
  {
   pos.set(width/2, height/2);
   gun.reset();
   vel.set(0, 0);
   destroyed = false;
   rotation = 0;
  }
  
  void destroyed()
  {
   lives--;
   destroyed = true; 
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
  
  void update()
  {
    if (!destroyed)
    {
      if (left)
        rotation += -0.075;
      if (right)
        rotation += 0.075;
      if (up)
      {
        PVector force = PVector.fromAngle(rotation-HALF_PI);
        force.mult(acc);
        vel.add(force);
      }
      if (shoot)
      {
       PVector force = PVector.fromAngle(rotation-HALF_PI);
       force.mult(0.25);
       gun.shoot(force);
       //println("fired");
      }
      
      pos.add(vel);
      move();
      bounds();
      vel.mult(0.99);
      
      gun.update(pos);
    }
  }
  
  void turn()
  {
   a.set(Rotate(a, pos, rotation));
   b.set(Rotate(b, pos, rotation));
   c.set(Rotate(c, pos, rotation));
  }
  
  PVector Rotate(PVector P1, PVector P2, float angle)
  {
    PVector dir = PVector.sub(P1, P2);
    dir.rotate(angle);
    return PVector.add(P2, dir);
  }
  
  void move()
  {
   a.set(pos.x, pos.y-(s*2));
   b.set(pos.x-s, pos.y+s);
   c.set(pos.x+s, pos.y+s);
   turn();
  }
  
  void bounds()
  {
   if (pos.x < -s/2)
     pos.x = width;
   else if (pos.y < -s/2)
     pos.y = height;
   else if (pos.x > width+(s/2))
     pos.x = 0;
   else if (pos.y > height+(s/2))
     pos.y = 0;
  }
 
  void render()
  {
   if (!destroyed)
   {
     noFill();
     stroke(255);
     strokeWeight(1);
     triangle(a.x, a.y, b.x, b.y, c.x, c.y);
     gun.render();
   }
   else
     ellipse(width/2, height/2, s*4, s*4);
  }
}
