class Group
{
 Dot  dot[];
 float fitnessSum;
 int gen = 1;
 int best = 0;
 int minSteps = 512;
 int bestSteps = 512;
 int superMutate = 1;
 boolean winner;
 
 Group(int size)
 {
   dot = new Dot[size];
   for (int i = 0; i < dot.length; i++)
     dot[i] = new Dot();
 }
 
 void update()
 {
   for (int i = 0; i < dot.length; i++)
   {
    //if (dot[i].brain.step > minSteps)
      //dot[i].alive = false;
       
    dot[i].update();
   }
 }
 
 void show()
 {
   for (int i = 1; i < dot.length; i++)
    dot[i].show();
    
   dot[0].show();
 }
 
 void fitness()
 {
   for (int i = 0; i < dot.length; i++)
    dot[i].fitness(minSteps);
 }
 
 void fitnessSum()
 {
   fitnessSum = 0;
   for (int i = 0; i < dot.length; i++)
   fitnessSum += dot[i].fitness;
 }
 
 boolean finished()
 {
   for (int i = 0; i < dot.length; i++)
    if (dot[i].alive)
      return false;
      
   return true;
 }
 
 void selection()
 {
  Dot[] newDot = new Dot[dot.length]; 
  setBest();
  fitnessSum();
  
  newDot[0] = dot[best].newGen();
  newDot[0].isBest = true;
  
  for (int i = 1; i < newDot.length; i++)
  {
    Dot oldGen  = oldGen();
    
    newDot[i] = oldGen.newGen();
    newDot[i].brain.prevStep = oldGen.brain.step;
  }
  
  dot = newDot.clone();
  gen++;
  println("Generation = " + gen);
 }
 
 //pool
 Dot oldGen()
 {
   float rand = random(fitnessSum);
   float runningSum = 0;
   
   for (int i = 0; i < dot.length; i++)
   {
    runningSum += dot[i].fitness;
    if (runningSum > rand)
      return dot[i];
   }
   //should never gets here
   return null;
 }
 
 void mutate()
 {
   if (winner)
   {
     for (int i = 1; i < dot.length; i++)
       dot[i].brain.mutate(random(1), dot[i].brain.prevStep, 0.0001);
   }
   else if (superMutate != 3)
   {
     for (int i = 1; i < dot.length; i++)
       dot[i].brain.mutate(0.001);
     superMutate++;
   }
   else if(!winner)
   {
     for (int i = 1; i < dot.length; i++)
     {
       dot[i].brain.mutate(0.9, dot[i].brain.prevStep, 0.99);
     }
     superMutate = 1;
       println("Super Mutate");
   }
 }
 
 void setBest()
 {
  float max = 0;
  int maxIndex = 0;
  for (int i = 0; i < dot.length; i++)
  {
    if (dot[i].fitness > max)
    {
     max = dot[i].fitness;
     maxIndex = i;
    }
  }
  best = maxIndex;
  if (dot[best].won)
  {
    winner = true;
    bestSteps = dot[best].brain.step;
  }
    
  //i dont think limiting the steps is as good a factoring in the steps into the fitness
  if (dot[best].won)
    minSteps = dot[best].brain.step;
 }
}
