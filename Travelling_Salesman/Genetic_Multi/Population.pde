class Population
{ 
  Unit[] unit;
  float bestDis = 999999999;
  Unit bestUnit;
  float fitnessSum;
  int popSize = 0;
  float mRate = 0.99;
  float mDecay = 0;
  int gen;
  int genCount = 0;
  int genCountD = 0;
  int fitPow;
  boolean elite;
  
  Population(int len, int popSize, float mDecay, int fitPow, boolean elite, int genCount)
  {
   this.popSize = popSize;
   this.mDecay = mDecay;
   this.fitPow = fitPow;
   this.elite = elite;
   this.genCount = genCount;
   genCountD = genCount;
   unit = new Unit[popSize];
   for (int i = 0; i < unit.length; i++)
   {
     unit[i] = new Unit(len);
     unit[i].randomOrder();
   }
   bestUnit = unit[0];
  }
  
  void calcFitness()
  {
   float tempDis;
   fitnessSum = 0;
   for (int i = 0; i < unit.length; i++)
   {
     tempDis = unit[i].calcDistance(fitPow);
     if (tempDis < bestDis)
     {
       bestUnit = new Unit(unit[i].order);
       bestDis = tempDis;
       //unit[i].fitness *= 2;
     }
     fitnessSum += unit[i].fitness;
   } 
  }
  
 //pool
 Unit selection()
 {
   float rand = random(fitnessSum);
   float runningSum = 0;
   int randI = (int)random(unit.length-1);
   
   for (int i = randI; i < unit.length; i++)
   {
    runningSum += unit[i].fitness;
    if (runningSum > rand)
      return unit[i];
   }
 
  
   if (randI > 0)
   {
    runningSum += unit[0].fitness;
    if (runningSum > rand)
      return unit[0];
   }
   
   for (int i = randI-1; i >= 0; i--)
   {
    runningSum += unit[i].fitness;
    if (runningSum > rand)
      return unit[i];
   }
     
   //should never gets here
   println("Error");
   return null;
 }
 
 void nextGen()
 {
   Unit[] tempPool = new Unit[popSize];
   for (int i = 0; i < unit.length; i++)
     tempPool[i] = new Unit(selection().order);
   
   for (int i = 0; i < unit.length; i++)
   {
    unit[i] = new Unit(tempPool[i].order);
    unit[i].mutate(mRate);
   }
   
   //restart with best seed
   if (gen >= genCount)
   {
     mRate = 0.99;
     //elite = true;
     genCount += genCountD;
     for (int i = 0; i < unit.length; i++)
     {
       unit[i] = new Unit(bestUnit.order);
       //unit[i] = new Unit(bestUnit.order.length);
       //unit[i].randomOrder();
     }
   }
   
   if (elite)
     unit[0] = new Unit(bestUnit.order);

   gen++;
   if (mRate > 0.01025)
     mRate -= mDecay;
     //mRate -= 0.001; //1k
     //mRate -= 0.0005; //2.5k
     //mRate -= 0.00025; //5k
     //mRate -= 0.0001; //10k
     //mRate -= 0.00005; //20k
     //mRate -= 0.000025; //40k
 }
}
