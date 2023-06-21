ArrayList <Branch> tree;

int gen, gensize, size, index, offset;
boolean stop;
int smallest = 4;
int baseL = 144;
float angle = PI;
//float angle = 0.024390172;
long timer;
int maxgen;


void setup()
{
 frameRate(30);
 size(720, 720);
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
  maxgen = 11;
  
  tree = new ArrayList <Branch> (1);
  tree.add(new Branch(new PVector(width/2, height - 192), 
                      new PVector(width/2, height - 192 - baseL), -1));
}

void mousePressed()
{
  //Initialize();
  
  //maxgen++;
  //stop = false;
  //angle = -angle;
  println("Angle = " + angle);
}

void update()
{
  //angle = (float)Math.sin(angle);
  angle += 0.005;
  println("" + angle);
  for (int i = 1; i < tree.size(); i+=2)
  {
      tree.get(i).setAngle(tree.get(tree.get(i).parentID).a, 
                           tree.get(tree.get(i).parentID).b, -angle);
                           
      tree.get(i+1).setAngle(tree.get(tree.get(i+1).parentID).a, 
                             tree.get(tree.get(i+1).parentID).b, angle);
  }
  
  if (!stop && System.currentTimeMillis() > (timer + 0))
  {
    timer += 0;
    
    //not sure why it needs offset
    for (int i = index; i < size-offset; i++)
    {
      tree.add(tree.get(i).branch(true, angle, i));
      tree.add(tree.get(i).branch(false, angle, i));
      
      gensize += 2;
    }
    
    index = size-offset;
    size += gensize;
    gensize = 0;
    offset = 1; 
    
    gen++;
    println("Gen = " + gen);
    if (gen >= maxgen)
      stop = true;
    //if (tree.get(tree.size()-1).baseL <= smallest)
      //stop = true;
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
     
 //saveFrame("output/Tree-####.png");
}
