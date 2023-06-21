City[] city;
int numC = 8;
Path path;

void setup()
{
 frameRate(1000);
 size(480, 480);
 city = new City[numC];
 
 for (int i = 0; i < numC; i++)
   city[i] = new City(random(width), random(height/2));
   
 path = new Path(city);
}

void draw()
{
 background(0);
 noFill();
 stroke(255);
 strokeWeight(2);
 
 for (City i : city)
   i.render();
   
 pushMatrix();
 translate(0, height/2);
 for (City i : city)
  i.render(); 
 popMatrix();
   
 path.render();
}

void mousePressed()
{
 //path.swap(); 
}
