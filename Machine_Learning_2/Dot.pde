class Dot
{
 Brain brain;
 PVector pos;
 PVector vel = new PVector();;
 PVector acc = new PVector();;
 boolean alive = true;
 boolean won;
 boolean isBest;
 boolean hitWall;
 float fitness;
 
 Dot()
 {
   pos = new PVector((width/2) - 4, height - 64);
   brain = new Brain(512);
 }
 
 void update()
 {
   if (alive)
   {
     move();
     if (pos.x < 0 || pos.x + 8 > width 
     || pos.y < 0 || pos.y + 8 > height)
     {
       alive = false;
       //hitWall = true;
     }
   
   
     if (pos.x > goal.pos.x && pos.x < goal.pos.x + goal.size.x
     && pos.y > goal.pos.y && pos.y < goal.pos.y + goal.size.y)
     {
       alive = false;
       won = true;
     }
     
     if (pos.x > block.pos.x && pos.x < block.pos.x + block.size.x
     && pos.y > block.pos.y && pos.y < block.pos.y + block.size.y)
     {
       alive = false;
       hitWall = true;
     }
     
     if (pos.x > block2.pos.x && pos.x < block2.pos.x + block2.size.x
     && pos.y > block2.pos.y && pos.y < block2.pos.y + block2.size.y)
     {
       alive = false;
       hitWall = true;
     }
   }
 }
 
 void show()
 {
   fill(255);
   
   if (isBest)
     fill(0, 255, 0);
     
   rect(pos.x, pos.y, 8, 8);
 }
 
 void move()
 {
   if (brain.step < brain.dir.length)
   {
     acc = brain.dir[brain.step]; 
     brain.step++;
   }
   
   vel.add(acc);
   vel.limit(5);
   pos.add(vel);
 }
 
  void fitness(int minSteps)
  {
   if (won)
     fitness = 1.0/16.0 + 10000.0/(float)(brain.step * brain.step);
   else
   {
     float goalDist = dist(pos.x - 4, pos.y - 4, 
     goal.pos.x + goal.size.x/2, goal.pos.y + goal.size.y/2);
     fitness = 1.0/((goalDist * goalDist));
     
     if (hitWall)
       fitness /= 2;
     
     if (brain.step > minSteps)
       fitness /= 4;
   }
  }
  
  Dot newGen()
  {
   Dot newGen = new Dot();
   newGen.brain = brain.clone();
   return newGen;
  }
}
