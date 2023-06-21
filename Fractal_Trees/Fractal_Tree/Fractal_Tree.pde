int baseL;
long timer;
int count = 1;

ArrayList < Branch > tree;

void setup()
{
  size(1080, 720);
  
  baseL = 192;
  timer = System.currentTimeMillis();
  
  PVector a = new PVector(1080/2, 720);
  PVector b = new PVector(1080/2, 720 - baseL);
  
  tree = new ArrayList < Branch > (1);
  tree.add(new Branch(a, b));
}

void update()
{
  if (tree.get(tree.size()-1).lenght >= 4)
  {
    if (System.currentTimeMillis() > (timer + 250))
    {
      timer += 250;
      
      for (int i = tree.size()-1; i >= 0; i--)
      {
        if (!tree.get(i).grown)
        {
          tree.add(tree.get(i).branchA());
          tree.add(tree.get(i).branchB());
          
          tree.get(i).grown = true;
          
          println("Count = " + count++);
        }
      }
    }
  }
}

void draw()
{
  update();
  background(27);
  stroke(255);
  //strokeWeight(1);
  
  for (int i = 0; i < tree.size(); i++)
    if(tree.get(i) != null)
      tree.get(i).draw();
}
