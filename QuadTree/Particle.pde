class Particle
{
  PVector pos;
  PVector vel;
  float s;
  
 

  
  Particle(float x, float y)
  {
    pos = new PVector(x, y);
    vel = new PVector(random(-1, 1), random(-1, 1));
    s = 10;
  }
  
  void update()
  {
    pos.add(vel);
    
    walls();
  }
  
  boolean collision(Particle part)
  {
    float xDif = pos.x - part.pos.x;
    float yDif = pos.y - part.pos.y;
    float distance = (float)Math.sqrt(xDif * xDif + yDif * yDif);
    
    return distance <= s/2 + part.s/2;  
  }
  
  void walls()
  {
    if (pos.x - s/2 < 0 || pos.x + s/2 > width)
    {
      vel.x *= -1;
      pos.x += vel.x;
    }
  
    if (pos.y - s/2 < 0 || pos.y + s/2 > height)
    {
       vel.y *= -1;
       pos.y += vel.y;
    }
  }
  
  void render()
  {
    fill(255);
    circle(pos.x, pos.y, s); 
    
    update();
  }
}
