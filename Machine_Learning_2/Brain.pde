class Brain
{
 PVector[] dir;
 int step = 0;
 int prevStep = 0;
 
 Brain(int size)
 {
   dir = new PVector[size];
   randomize();
 }
 
 void randomize()
 {
  for (int i = 0; i < dir.length; i++)
     dir[i] = PVector.fromAngle(random(2*PI));
 }
 
 Brain clone()
 {
  Brain clone = new Brain(dir.length);
  for (int i = 0; i < dir.length; i++)
    clone.dir[i] = dir[i].copy();
    
    return clone;
 }
 
 void mutate(float rate)
 {
  //float rate = 0.01;
  for (int i = 0; i < dir.length; i++)
    if (random(1) < rate)
      dir[i] = PVector.fromAngle(random(2*PI));
 }
 
 void mutate(float per, int max, float rate)
 {
  if (max > dir.length)
    max = dir.length;
    
    int min = (int)(max * per);

  for (int i = min; i < 512; i++)
    if (random(1) < rate)
      dir[i] = PVector.fromAngle(random(2*PI));
 }
}
