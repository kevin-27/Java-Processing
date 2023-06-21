class Gun
{
 PVector pos;
 Laser[] laser;
 int Lnum;
 int next;
 long timer;
 
 Gun(PVector pos)
 {
   this.pos = new PVector();
   this.pos.set(pos);
   Lnum = 10;
   laser = new Laser[Lnum];
   for (int i = 0; i < Lnum; i++)
     laser[i] = new Laser(pos);
   
   timer = System.currentTimeMillis();
 }
 
 void update(PVector pos)
 {
   this.pos.set(pos);
   for (Laser n : laser)
     n.update(pos);
 }
 
 void reset()
 {
  for (Laser l : laser)
    l.reset();
 }
 
 void shoot(PVector force)
 {
   if (timer + 250 < System.currentTimeMillis())
   {
     timer = System.currentTimeMillis();
     if (!laser[next].fired)
     {
      laser[next].shoot(force);
     
      next++;
      if (next > Lnum-1)
      {
        //println("test");
        next = 0;
      }
     }
   }
 }
 
 void render()
 {
   for (Laser n : laser)
     n.render();
 }
}
