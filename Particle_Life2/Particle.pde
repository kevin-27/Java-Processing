class Particle
{
 PVector pos, vel, acc;
 int r;
 float maxS;
 color col;
 int colID;
 float fric;
 
 Particle()
 {
  r = pSize;
  maxS = random(0.25, 2);
  //pos = new PVector(random(-32, 32) + width/2, random(-32, 32) + height/2);
  pos = new PVector(random(width), random(height));
  vel = new PVector(random(-maxS*3, maxS*3), random(-maxS*3, maxS*3));
  acc = new PVector();
  col = randomColor();
  for (int i = 0; i < colors.length; i++)
    if (col == colors[i])
    {
      colID = i;
      fric = random(0.5, 0.9);
    }
 }
 
 PVector reple(color C, PVector target)
 {
   PVector force = new PVector();
   for (int i = 0; i < colors.length; i++)
    if (C == colors[i])
    {
      float dist = dist(target.x, target.y, pos.x, pos.y);
      if (dist < r*2)
      {
        force = PVector.sub(target, pos);
        float mag = 0.5;
        
        //float percent = dist / distIndex[colID][i].x;
        //percent = 1 - percent;
        //mag = mag * percent;
        //mag = pow(mag, 4);
        //mag /= 10;
        force.setMag(mag);
        return force;
      }
    }
   return force;
 }
 
 void reple(PVector target)
 {
   float dist = dist(pos.x, pos.y, target.x, target.y);
    if (dist < r*2)
    {
      //vel.mult(-1);
      //acc.mult(0);
      PVector force = PVector.sub(target, pos);
      float mag = -0.5;
      force.setMag(mag);
      acc.add(force);
    }
 }
 
 PVector applyForce(color C, PVector target)
 {
   PVector force = new PVector();
   for (int i = 0; i < colors.length; i++)
    if (C == colors[i])
    {
      float dist = dist(target.x, target.y, pos.x, pos.y);
      if (dist > distIndex[colID][i].x && dist < distIndex[colID][i].y)
      {
        force = PVector.sub(target, pos);
        force.setMag(forceIndex[colID][i]/2);
     
        return force;
      }     
    }
   return force;
 }
 
 void update()
 {
  vel.add(acc);
  pos.add(vel); 
  //vel.limit(maxS);
  vel.mult(fric);
  acc.mult(0);
  
  border();
 }
 
 void border()
 {
  if (pos.x < r)
   {
     //vel.x *= -1;
     //pos.x = r;
     pos.x = width - r-1;
   }
   if (pos.x > width - r)
   {
     //vel.x *= -1;
     //pos.x = width - r;
     pos.x = r+1;
   }
   if (pos.y < r)
   {
     //vel.y *= -1;
     //pos.y = r;
     pos.y = height - r-1;
   }
   if (pos.y > height - r)
   {
     //vel.y *= -1;
     //pos.y = height - r;
     pos.y = r+1;
   }
 }
 
 void render()
 {
  stroke(col);
  strokeWeight(r*2);
  point(pos.x, pos.y); 
  
  update();
 }
}
