Boid boid;

void setup()
{
 size(480, 480); 
 
 boid = new Boid();
}

void draw()
{
 background(0);
 
 ellipse(mouseX, mouseY, 24, 24);
 boid.render();
}
