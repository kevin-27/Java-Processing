class Psystem
{
 ArrayList <Particle> part;
  
 Psystem()
 {
   part = new ArrayList<Particle>();
   
   for (int i = 0; i < 100; i++)
     part.add(new Particle(random(10, width-10),
                         random(10, height-10)));
 }
 
 void update()
 {
   for (int i = 0; i < part.size(); i++)
     for (int u = 0; u < part.size(); u++)
       if (part.get(i).collision(part.get(u)) && i != u)
       {
         part.get(i).vel.mult(-1);
         part.get(i).pos.add(part.get(i).vel);
         
         part.get(u).vel.mult(-1);
         part.get(u).pos.add(part.get(u).vel);
       }
 }
 
 void render()
 {
   for (Particle p : part)
     p.render();
     
   //update();
 }
}
