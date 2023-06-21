
PVector a, b ,c, current;

void setup()
{
 size(720, 720);
 background(0);
 
 a = new PVector(width/2 , 0);
 b = new PVector(0, height-1);
 c = new PVector(width-1, height-1);
 current = new PVector(width/2, 1);
 
 stroke(255);
 point(a.x, a.y);
 point(b.x, b.y);
 point(c.x, c.y);
}

void draw()
{ 
  for(int i = 0; i < 10; i++)
  {
    switch ((int)random(1, 4))
    {
     case 1: halfWay(current, a); println("1");
     break;
     case 2: halfWay(current, b); println("2");
     break;
     case 3: halfWay(current, c); println("3");
     break;
    }
    
    point(current.x, current.y);
  }
}

float Distance(PVector P1, PVector P2)
{
  float diffX = P1.x - P2.x;
  float diffY = P1.y - P2.y;
  return (float) Math.sqrt((diffX * diffX) + (diffY * diffY));
}

void halfWay(PVector P1, PVector P2)
{
  float diffX = P1.x - P2.x;
  float diffY = P1.y - P2.y;
  
  float distance = Distance(P1, P2);
  
  current.x += ((-1 / distance) * diffX) * (distance/2);
  current.y += ((-1 / distance) * diffY) * (distance/2);
}
