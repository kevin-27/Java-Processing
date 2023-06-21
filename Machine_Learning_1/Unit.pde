class Unit
{
 String guess;
 float fitness;
 int len;
 
 Unit(int len)
 {
  guess = new String("");
  fitness = 0;
  this.len = len;
 }
 
 void rString()
 {
  guess = randomString(len);
 }
 
 void mutate(float rate)
 {
  char[] temp = guess.toCharArray();
  for (int i = 0; i < len; i++)
    if (random(1) < rate)
      temp[i] = (char)random(32, 126);
  guess = new String(String.valueOf(temp));
 }
 
 Unit crossover(Unit partner)
 {
  Unit child = new Unit(len);
  int mid = floor(random(len));
  
  for ( int i = 0; i < len; i++)
  {
   if (i > mid)
     child.guess += guess.charAt(i);
   else 
     child.guess += partner.guess.charAt(i);
  }
  return child;
 }
}
