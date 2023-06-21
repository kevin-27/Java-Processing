int[] num;
String numS;

void setup()
{
 size(480, 480); 
 num = new int[7];
 
 for (int i = 0; i < 7; i++)
   num[i] = i;
 numS = new String();
 
 for(int i = 0; i < num.length; i++)
   numS += new String(""+num[i]);
}

void draw()
{
 background(0);
 
 textAlign(CENTER);
 textSize(64);
 
 text("" + numS, width/2 , height/2);
 shift();
}

void shift()
{
 int x = -1, y = -1;
 
 //Step 1
 for(int i = 0; i < num.length-1; i++)
  if (num[i] < num[i+1])
    x = i;
 
 //done
 if (x == -1)
   return;
 
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
 
 //String
 numS = new String();
 for(int i = 0; i < num.length; i++)
   numS += new String(""+num[i]);
}

int[] swap(int[] a, int x, int y)
{
 int temp = a[x];
 a[x] = a[y];
 a[y] = temp;
 return a;
}

void mousePressed()
{
  shift(); 
}
