Ant ant;
Grid grid;

void setup()
{
 size(720, 480);
 ant = new Ant();
 grid = new Grid();
}

void draw()
{
 background(73);
 grid.render();
 ant.render();
 ant.update();
}

void mousePressed()
{
  if (mouseButton == LEFT)
  {
    //ant.setPath(mouseX, mouseY);
    ant.setTarget(new PVector(mouseX, mouseY), grid.node);
  }
}
