Arm arm;

void setup()
{
 size(480, 480);
 //fullScreen();
 arm = new Arm(new PVector(width/2, height), 
  new PVector(width/2, (height)-100));
}

void draw()
{
 background(0);
 stroke(255);
 
 arm.render();
}
