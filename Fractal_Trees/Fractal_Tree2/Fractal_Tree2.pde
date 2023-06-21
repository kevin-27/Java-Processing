ArrayList <Branch> tree;

int gen, gensize, size, index, offset;
boolean stop;
int smallest = 4;
int baseL = 196;
float angle = 1.5;
long timer;


void setup()
{
 size(1080, 720);
 timer = System.currentTimeMillis();
 
 Initialize();
}

void Initialize()
{
  gen = 1;
  gensize = 1;
  size = 1;
  index = 0;
  offset = 0;
  stop = false;
  
  tree = new ArrayList <Branch> (1);
  tree.add(new Branch(new PVector(width/2, height - 92), 
                      new PVector(width/2, height - baseL - 92)));
}

void mousePressed()
{
  Initialize();
  angle += 0.25;
}

void update()
{
  if (!stop && System.currentTimeMillis() > (timer + 0))
  {
    timer += 0;
    
    //not sure why it needs offset
    for (int i = index; i < size-offset; i++)
    {
      tree.add(tree.get(i).branch(true, angle));
      tree.add(tree.get(i).branch(false, angle));
      
      gensize += 2;
    }
    
    index = size-offset;
    size += gensize;
    gensize = 0;
    offset = 1; 
    
    gen++;
    println("Gen = " + gen);
    if (gen >= 11 || tree.get(tree.size()-1).baseL <= smallest)
      stop = true;
  }
}

void draw()
{
 update();
 stroke(255);
 background(27); 
 strokeWeight(1);
 
 for (int i = 0; i < tree.size(); i++)
   if(tree.get(i) != null)
     tree.get(i).draw();
}
