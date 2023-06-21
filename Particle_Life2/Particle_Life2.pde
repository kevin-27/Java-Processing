ArrayList <Particle> part;
float forceIndex[][];
PVector distIndex[][];
int numOfp = 8;
int pSize = 4;

void setup()
{
 size(640, 480);
 
 part = new ArrayList<Particle>();
 forceIndex = new float[numOfp][numOfp];
 distIndex = new PVector[numOfp][numOfp];
 IndexIntiz();
 
 for (int i = 0; i < 250; i++)
   part.add(new Particle());
}

void IndexIntiz()
{
 //randomSeed(16);
 float num = 1;
 for (int i = 0; i < numOfp; i++)
 {
   for (int p = 0; p < numOfp; p++)
   {
     float r1 = random(0, 16);
     float r2 = random(r1, 64);
     forceIndex[i][p] = random(-num, num);
     distIndex[i][p] = new PVector(r1, r2);
     //forceIndex[i][p] = -0.5;
     //distIndex[i][p] = new PVector(16, 64);
   }
 }
}

void update()
{
 for (Particle p : part)
 {
  for (Particle p2 : part)
  {
   if (p != p2)
   {
     //p2.acc.add(p.reple(p2.col, p2.pos)); //adding 0 alot for no reason
     p2.acc.add(p.applyForce(p2.col, p2.pos));
     p2.reple(p.pos);
   }
  }
 }
}

void draw()
{
 background(0); 
 
 for (Particle p : part)
   p.render();
   
 update();
}

void mousePressed()
{
 println(frameRate); 
}
