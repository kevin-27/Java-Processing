class Path
{
 City[] city;
 float bestDistance = 1000000000;
 int[] bestOrder;
 Population pop;
 
 Path(City[] city, int popSize, float mDecay, int fitPow, boolean elite, int genCount)
 {
   this.city = city;
   pop = new Population(city.length, popSize, mDecay, fitPow, elite, genCount);
     
   bestOrder = new int[city.length];
 }
 
 void render()
 {
   pop.calcFitness();
   bestOrder = pop.bestUnit.order;
   pop.nextGen();
   totalDis();
   
   /*for (City i : city)
     i.render();
   
   for (int i = 0; i < pop.unit[3].order.length-1; i++)
     line(city[pop.unit[3].order[i]].pos.x, city[pop.unit[3].order[i]].pos.y,
     city[pop.unit[3].order[i+1]].pos.x, 
     city[pop.unit[3].order[i+1]].pos.y);*/
   
   pushMatrix();
   //translate(0, 16);
   for (City i : city)
     i.render();
   //Best
   for (int i = 0; i < bestOrder.length-1; i++)
     line(city[bestOrder[i]].pos.x, city[bestOrder[i]].pos.y,
     city[bestOrder[i+1]].pos.x, 
     city[bestOrder[i+1]].pos.y);
   
   textSize(32);
   text("Gen = " + pop.gen, 0, 32);
   text("Rate = " + String.format("%.3f", pop.mRate), 256, 32);
   text("Dis = " + String.format("%.2f", pop.bestDis), 0, 64);
   popMatrix();
 }
 
 void totalDis()
 {
   /*float distance = 0;
   float total = 0;
   for (int i = 0; i < order.length-1; i++)
   {
     distance = dist(city[order[i]].pos.x, city[order[i]].pos.y,
     city[order[i+1]].pos.x, 
     city[order[i+1]].pos.y);
     total += distance;
   }
   if (total < bestDistance)
   {
    bestDistance = total;
    for (int i = 0; i < bestOrder.length; i++)
      bestOrder[i] = order[i];
      
    print("New Best = ");
    for (int i = 0; i < bestOrder.length; i++)
     print("" + bestOrder[i]);
     print(" Distance = " + total);
     println();
   }*/
 }
}
