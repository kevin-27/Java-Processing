void gameUpdate()
{
 if (rocks.size() == 0)
 {
  println("Next Level");
  rockNum++;
  Initiz();
  ship.resetN();
  paused = true;
 }
 
 for (Rock r : rocks)
   r.update();
   
 ship.update();
 
 //Ship Collision
 for (Rock r : rocks)
 {
  if (ship.intersects(r.pos, r.di) && !ship.destroyed)
  {
   ship.destroyed();
   //ship.reset(); 
  }
 }
 //Laser Collision
 for (Laser l : ship.gun.laser)
 {
   for (Rock r : rocks)
   {
     if (l.fired && l.intersects(r.pos, r.di))
     {
       switch (r.gen)
       {
         case 1 : score += 20; break;
         case 2 : score += 50; break;
         case 3 : score += 100; break;
       }
       l.reset();
       
       if (r.gen < 3)//(r.di/2 > 50/4)
       {
         PVector force = new PVector();
         force.set(r.vel);
         force.mult(1.25);
         
         rocks.add(new Rock(r.pos.x, r.pos.y, r.di/2, force.rotate(PI*random(1)), r.gen+1));
         rocks.add(new Rock(r.pos.x, r.pos.y, r.di/2, force.rotate(PI*random(1)), r.gen+1));
       }
       rocks.remove(r);
       break;
     }
   }
 }
}

void textUI()
{
 textSize(16);
 text("Lives = " + ship.lives, 16, 16);
 text("Score = " + score, 264, 16);
 if (ship.lives <= 0)
 {
   textSize(32);
   text("You Lose", (width/2)-64, height/2-64);
 }
}
