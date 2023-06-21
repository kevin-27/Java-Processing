int pop = 150;
Flock flock;

void setup()
{
  size(640, 360);
  flock = new Flock();
}

void update()
{
 flock.update();
}

void draw()
{
 background(0); 
 
 flock.render();
   
 update();
}
