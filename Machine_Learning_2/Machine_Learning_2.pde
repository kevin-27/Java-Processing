Rectangle goal;
Rectangle block;
Rectangle block2;
Group group;

void setup()
{
 size(512, 512);
 
 goal = new Rectangle((width/2) - 16, 64, 32, 32, color(255, 0, 0));
 block = new Rectangle(0, (height - 192), 384, 16, color(0, 0, 255));
 block2 = new Rectangle(width - 384, (height - 320), 384, 16, color(0, 0, 255));
 group = new Group(256);
}

void update()
{
  group.update();
  
  if (group.finished())
  {
   group.fitness();
   group.selection();
   group.mutate();
  }
}

void draw()
{
  background(27);
  goal.show();
  block.show();
  block2.show();
  group.show();
  
  update();
}
