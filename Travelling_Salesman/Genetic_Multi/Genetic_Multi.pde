City[] city;
int numC = 20;
Path[] path;

void setup()
{
 frameRate(1000);
 size(720, 720);
 
 city = new City[numC];
 
 for (int i = 0; i < numC; i++)
   city[i] = new City(random(4, width/3), random(20, (height/4)));
   
 intiz();
}

void intiz()
{
  path = new Path[9];
  
  float mRateD = 0.00025;
  int genCount = ((int)(1/mRateD)+1);
  genCount += genCount/4;
  
  for (int i = 0; i < 9; i++)
    path[i] = new Path(city, 256, mRateD, 2, false, genCount);
    
  /*path[0] = new Path(city, 256, 0.0005, 2, false, 2000);
  path[1] = new Path(city, 256, 0.0005, 2, false, 2000);
  path[2] = new Path(city, 256, 0.0005, 2, false, 2000);
  path[3] = new Path(city, 256, 0.0005, 2, false, 2000);
  path[4] = new Path(city, 256, 0.0005, 2, false, 2000);
  path[5] = new Path(city, 256, 0.0005, 2, false, 2000);
  path[6] = new Path(city, 256, 0.0005, 2, false, 2000);
  path[7] = new Path(city, 256, 0.0005, 2, false, 2000);
  path[8] = new Path(city, 256, 0.0005, 2, false, 2000);*/
  
  /*path[0] = new Path(city, 4096, 0.000025, 1);
  path[1] = new Path(city, 2048, 0.00005, 1);
  path[2] = new Path(city, 1024, 0.0001, 1);
  path[3] = new Path(city, 512, 0.00025, 1);
  path[4] = new Path(city, 256, 0.0005, 1);
  path[5] = new Path(city, 128, 0.001, 1);*/
}

void draw()
{
 background(0);
 noFill();
 stroke(255);
 strokeWeight(2); 
 int index = 0;
 for (int i = 0; i < 3; i++)
 {
   for (int p = 0; p < 3; p++)
   {
     pushMatrix();
     translate((width/3)*p, ((height/4)+20)*i);
     path[index].render();
     popMatrix();;
     index++;
   }
 }
}

void mousePressed()
{
 //intiz();
}
