class Path
{
 City[] city;
 float bestDistance = 1000000000;
 int[] bestOrder;
 Population pop;
 
 Path(City[] city, int popSize, float mDecay, int fitPow)
 {
   this.city = city;
   pop = new Population(city.length, popSize, mDecay, fitPow);
     
   bestOrder = new int[city.length];
 }
 
 void render()
 {
   pop.calcFitness();
   bestOrder = pop.bestUnit.order;
   pop.nextGen();
   totalDis();
   
   for (City i : city)
     i.render();
   
   for (int i = 0; i < pop.unit[3].order.length-1; i++)
     line(city[pop.unit[3].order[i]].pos.x, city[pop.unit[3].order[i]].pos.y,
     city[pop.unit[3].order[i+1]].pos.x, 
     city[pop.unit[3].order[i+1]].pos.y);
   
   pushMatrix();
   translate(0, height/2);
   for (City i : city)
     i.render();
   //Best
   for (int i = 0; i < bestOrder.length-1; i++)
     line(city[bestOrder[i]].pos.x, city[bestOrder[i]].pos.y,
     city[bestOrder[i+1]].pos.x, 
     city[bestOrder[i+1]].pos.y);
   popMatrix();
   
   textSize(16);
   text("Gen = " + pop.gen, 0, 16);
   text("Rate = " + String.format("%.3f", pop.mRate), 128, 16);
   text("Dis = " + pop.bestDis, 0, height);
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
