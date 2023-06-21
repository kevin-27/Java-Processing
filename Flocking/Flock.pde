Boid boid[];

class Flock
{
 Flock()
 {
  boid = new Boid[pop];
    for (int i = 0; i < pop; i++)
      boid[i] = new Boid();
 }
 
 void update()
 {
  for (Boid b : boid)
  {
   b.update(); 
   b.separation(boid);
   b.aline(boid);
   b.cohesion(boid);
  } 
 }
 
 void render()
 {
  for (Boid b : boid)  
   b.render();
 }
}
