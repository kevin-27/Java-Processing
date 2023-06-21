class Population
{
 Unit[] unit;
 int sizeP = 2048;
 int sizeW;
 String target;
 ArrayList<Unit> pool = new ArrayList<Unit>();
 float mRate = 0.01;
 Unit best;
 int gen;
 float avarageFit;
 
 Population(String target)
 {
  this.target = new String(target);
  unit =  new Unit[sizeP];
  sizeW = target.length();
  best = new Unit(sizeW);
  
  for (int i = 0; i < sizeP; i++)
  {
    unit[i] = new Unit(sizeW);
    unit[i].rString();
  }
 }
 
 void calcFitness()
 {
  float sum;
  for (int i = 0; i < sizeP; i++)
  {
    sum = 0;
    for (int p = 0; p < sizeW; p++)
     if (unit[i].guess.charAt(p) == target.charAt(p))
     {
       sum++;
       //if (unit[i].guess.charAt(p) == ' ')
         //sum += 0.5;
     }
    
    unit[i].fitness = sum / sizeW;
    unit[i].fitness = pow(unit[i].fitness, 4);
    //println("" + unit[i].fitness);
  }
 }
 
 void selection()
 {
  ArrayList<Unit> pool = new ArrayList<Unit>();
  
  //finds best fitness
  float maxFit = 0;
  for (int i = 0; i < sizeP; i++)
    if (unit[i].fitness > maxFit)
    {
      maxFit = unit[i].fitness;
      if (unit[i].fitness > best.fitness)
        best = unit[i];
    }
      
   //addes to pool
   for (int i = 0; i < sizeP; i++)
   {
    float fitness = map(unit[i].fitness, 0, maxFit, 0, 1);
    int num = floor(fitness * 100);
    for (int p = 0; p < num; p++)
      pool.add(unit[i]);
   }
   this.pool = pool;
 }
  
 void newGeneration()
 {
  Unit parentA;
  Unit parentB;
  Unit child;
  unit[0] = best;
  for (int i = 1; i < sizeP; i++)
  {
   parentA = pool.get(floor(random(pool.size())));
   parentB = pool.get(floor(random(pool.size())));
   child = parentA.crossover(parentB);
   child.mutate(mRate);
   unit[i] = child;
  }
  gen++;
  
  //clones
  /*for (int i = 1; i < sizeP; i++)
  {
   parentA = pool.get(floor(random(pool.size())));
   child = new Unit(sizeW);
   child.guess = parentA.guess;//.crossover(parentA);
   child.mutate(mRate);
   unit[i] = child;
  }*/
 }
 
 void avarageFit()
 {
  avarageFit = 0;
  for (int i = 0; i < sizeP; i++)
   avarageFit += unit[i].fitness; 
  
  avarageFit /= sizeP;
 }
 
 void render()
 {
  for (int i = 0; i < 20; i++)
    text(unit[i].guess, width - 320, 16 * (i+2));
    
  if (!best.guess.equals(target))
  {
    calcFitness();
    avarageFit();
    selection();
    newGeneration();
  }
 }
}
