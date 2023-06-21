Psystem Ps;

void setup()
{
  size(480, 480);
  
  Ps = new Psystem();
}

void draw()
{
  background(0);
  
  Ps.render();
  noFill();
  stroke(0, 127, 127);
  qt(0, 0, width-1, height-1, Ps.part);
}

void qt(float x, float y, float w, float h, ArrayList <Particle> part)
{
  rect(x, y, w, h);
  
  ArrayList <Particle> contained = new ArrayList<Particle>();
  
  for (int i = 0; i < part.size(); i++)
  {
    float pX = part.get(i).pos.x;
    float pY = part.get(i).pos.y;
    float r = part.get(i).s/2;
    
    //Needs better cirlce intersection
    //so the particles can be in two or boxes at once.
    if (pX >= x && pX <= x + w && 
        pY >= y && pY <= y + h)
          contained.add(part.get(i));
          
  }
  
  if (contained.size() >= 4)
  {
    qt(x, y, w/2, h/2, contained);
    qt(x+w/2, y, w/2, h/2, contained);
    qt(x, y+h/2, w/2, h/2, contained);
    qt(x+w/2, y+h/2, w/2, h/2, contained);
    return;
  }
  
  for (int i = 0; i < contained.size(); i++)
     for (int u = 0; u < contained.size(); u++)
       if (contained.get(i).collision(contained.get(u)) && i != u)
       {
         contained.get(i).vel.mult(-1);
         contained.get(i).pos.add(contained.get(i).vel);
         
         contained.get(u).vel.mult(-1);
         contained.get(u).pos.add(contained.get(u).vel);
       }
}
