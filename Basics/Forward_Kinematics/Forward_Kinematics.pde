Arm arm;

void setup()
{
 size(480, 480);
 
 arm = new Arm(new PVector(width/2, height), 
  new PVector(width/2, height-80));
}

void draw()
{
 background(0);
 stroke(255);
 
 arm.render();
}
