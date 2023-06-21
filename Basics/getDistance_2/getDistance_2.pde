Ant ant;

void setup()
{
 size(720, 480);
 ant = new Ant();
}

void draw()
{
 background(42);
 ant.render();
 ant.move();
}

void mousePressed()
{
  if (mouseButton == LEFT)
  {
    ant.pathX = mouseX;
    ant.pathY = mouseY;
  }
}
