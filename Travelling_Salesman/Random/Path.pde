class Path
{
 City[] city;
 int[] order;
 float bestDistance = 1000000000;
 int[] bestOrder;
 
 Path(City[] city)
 {
   this.city = city;
   order = new int[city.length];
   
   for (int i = 0; i < order.length; i++)
     order[i] = i;
     
   bestOrder = new int[city.length];
   //bestOrder[0] = 4;
 }
 
 void swap()
 {
   int u = (int)random(city.length);
   int p = (int)random(city.length);
   int temp = order[u];
   order[u] = order[p];
   order[p] = temp;
   
   /*for (int i = 0; i < order.length; i++)
     print("" + order[i]);
     println();*/
 }
 
 void render()
 {
   totalDis();
   for (int i = 0; i < order.length-1; i++)
     line(city[order[i]].pos.x, city[order[i]].pos.y,
     city[order[i+1]].pos.x, 
     city[order[i+1]].pos.y);
   
   swap();
   
   pushMatrix();
   translate(0, height/2);
   //Best
   for (int i = 0; i < bestOrder.length-1; i++)
     line(city[bestOrder[i]].pos.x, city[bestOrder[i]].pos.y,
     city[bestOrder[i+1]].pos.x, 
     city[bestOrder[i+1]].pos.y);
   popMatrix();
 }
 
 void totalDis()
 {
   float distance = 0;
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
   }
 }
}
