class Unit
{
 int[] order;
 float fitness;
 float totalDis;
 Unit(int len)
 {
  order = new int[len];
 }
 
 Unit(int[] order)
 {
  this.order = new int[order.length];
  for (int i = 0; i < order.length; i++)
    this.order[i] = order[i];
 }
 
 void randomOrder()
 {
   int u = 0;
   int p = 0;
   int temp = 0;
   
   for (int i = 0; i < order.length; i++)
    order[i] = i;
    
   for (int i = 0; i < city.length/2; i++)
   {
     u = (int)random(city.length);
     p = (int)random(city.length);
     temp = order[u];
     order[u] = order[p];
     order[p] = temp;
   }
 }
 
 float calcDistance(int fitPow)
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
  totalDis = total;
  fitness = 1 / (total + 1);
  fitness = pow(fitness, fitPow);
  return total;
 }
 
 void mutate(float rate)
 {
  int rand = (int)random((order.length/2)+1);
  int u;
  int p;
  int temp;
  for (int i = 0; i < rand; i++)
  {
    if (random(1) < rate)
    {
      u = (int)random(city.length);
      p = (int)random(city.length);
      temp = order[u];
      order[u] = order[p];
      order[p] = temp;
    }
  }
 }
}
