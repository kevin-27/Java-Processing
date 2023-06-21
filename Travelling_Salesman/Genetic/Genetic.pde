City[] city;
int numC = 20;
Path path;

void setup()
{
 frameRate(1000);
 size(720, 720);
 //fullScreen();
 city = new City[numC];
 
 for (int i = 0; i < numC; i++)
   city[i] = new City(random(width), random(height/2));
   
 intiz();
}

void intiz()
{
  path = new Path(city, 256, 0.00025, 2);
}

void draw()
{
 background(0);
 noFill();
 stroke(255);
 strokeWeight(2);
  
 path.render();
}

void mousePressed()
{
 intiz();
}
