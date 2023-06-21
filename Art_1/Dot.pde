class Dot
{
  PVector pos, vel, acc, origin;
  float num = 2;
  long timer;
  int r = 2;
  float mag = 2;
  float maxSpeed = 2;
  float delay;
  
  boolean back = false;
  
  Dot(float x, float y)
  {
   vel = new PVector();
   acc = new PVector();
   pos = new PVector(x, y);
   origin = new PVector(x, y);
   timer = millis();
   delay = 60000;
  }
  
  void update()
  {
   if (back)
   {
     seekTarget(origin, mag);
     arive();
   }
   else if (millis() > timer) //+ delay/frameRate)
   {
    timer += random(45000/frameRate, 90000/frameRate);
    vel.set(random(-num, num), random(-num, num));  
    num += 0.1;
    delay = 0;
   }
   //else if (delay != 0)
   //{
   // seekTarget(new PVector(width/2, height/2), 0.1);
   //}
   
   vel.add(acc);
   vel.limit(maxSpeed);
   pos.add(vel); 
   acc.set(0, 0);
   walls();
  }
  
  void seekTarget(PVector t, float m)
  {
   PVector target = PVector.sub(t, pos);
   target.setMag(m); //changes the speed
   target.sub(vel);
   target.limit(0.03);
   acc.add(target);
  }
  
  void arive()
  {
   //PVector target = new PVector(mouseX, mouseY);
   float dist = dist(pos.x, pos.y, origin.x, origin.y);
   if (dist < 100)
   {
    mag = map(dist, 0, 100, 0, maxSpeed);
   }
   else
    mag = maxSpeed;
 }
  
  void walls()
  {
   //if (pos.x < r || pos.x > width - r)
   //{
   //  vel.x *= -1.1;
   //}
   //if (pos.y < r || pos.y > height - r)
   //{
   //  vel.y *= -1.1;
   //}
   
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
   if (pos.y > width - r)
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
