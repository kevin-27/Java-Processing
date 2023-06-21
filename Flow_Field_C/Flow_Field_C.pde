Field ff;

Particle p[];
int pNum = 30000;
//int originY = 112; //112  224
//int endY = 144;//144 288
long timer;
int time = 10000;
int color1 = 255;
int color2 = 255;
int color3 = 255;

void setup()
{
  //size(960, 720, P2D);
  fullScreen(P2D);
  reset();
  timer = millis()+time;
}

void reset()
{
  noiseSeed((long)random(999999999));
  background(0);
  ff = new Field();
  p = new Particle[pNum];
  for (int i = 0; i < pNum; i++)
    p[i] = new Particle();
}

void draw()
{
  if (timer <= millis())
  {
   //reset();
   color1 = (int)random(255);
   color2 = (int)random(255);
   color3 = (int)random(255);

   timer += time; 
  }
  //background(0);
  //fill(0)
  noFill();
  stroke(255);
  strokeWeight(2);
  
  ff.render();
  
  for (int i = 0; i < pNum; i++)
  {
    p[i].render();
    p[i].update();
    p[i].applyForce(ff.flowDir[(int)((p[i].pos.x)/20)]
                          [(int)((p[i].pos.y)/20)]);
                          
    //p[i].update(ff.flowDir[(int)((p[i].pos.x-17)/16)]
                          //[(int)((p[i].pos.y-113)/16)]);
  }
}

/*void mousePressed()
{
  //noiseSeed((long)random(9999999));
  reset();
}*/
