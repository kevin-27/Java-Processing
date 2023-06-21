class Lex_Order
{
 //int[] num;
 boolean done;
 int[] shift(int[] num)
 {
   int x = -1, y = -1;
   //Step 1
   for(int i = 0; i < num.length-1; i++)
   if (num[i] < num[i+1])
    x = i;
   
   //done
   if (x == -1)
   {
     done = true;
     return null;
   }
   
   //Step 2
   for(int i = 0; i < num.length; i++)
   if (num[x] < num[i])
     y = i;
     
   //Step 3     
   swap(num, x, y);
   
   //Step 4
   int diff = num.length - x;
   int[] temp = new int[diff];
   
   int count = num.length-1;
   for (int i = 0; i < diff; i++)
   {
   temp[i] = num[count];
   count--;
   }
   
   count = 0;
   for (int i = x+1; i < num.length; i++)
   {
   num[i] = temp[count];
   count++;
  }
  return num;
 }

 int[] swap(int[] a, int x, int y)
 {
  int temp = a[x];
  a[x] = a[y];
  a[y] = temp;
  return a;
 }
}
