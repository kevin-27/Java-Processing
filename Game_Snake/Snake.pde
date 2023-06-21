class Snake
{
 ArrayList<Seg> seg = new ArrayList<Seg>();

 int speed;
 int dir;
 int count;

 Snake(float x, float y)
 {
   speed = 16;
   dir = 5;
   
   seg.add(new Seg(x, y));
 }
 
 void update()
 {
   for (int i = seg.size()-1; i > 0; i--)
  {
    seg.get(i).x = seg.get(i-1).x;
    seg.get(i).y = seg.get(i-1).y;
  }
  
  if (keyCode == LEFT && dir != 1)
    dir = 0;
  if (keyCode == RIGHT && dir != 0)
    dir = 1;
  if (keyCode == UP && dir != 3)
    dir = 2;
  if (keyCode == DOWN && dir != 2)
    dir = 3;
     
  switch (dir)
  {
   case 0: seg.get(0).x -= speed;
     break;
   case 1: seg.get(0).x += speed;
     break;
   case 2: seg.get(0).y -= speed;
     break;
   case 3: seg.get(0).y += speed;
     break;
  }
  
  if (seg.get(0).x < 0 || seg.get(0).x + 16 > width
  || seg.get(0).y < 0 || seg.get(0).y + 16 > height)
  {
    exit();
  }
  
  for (int i = 1; i < seg.size(); i++)
  {
    if (seg.get(i).x == seg.get(0).x 
    && seg.get(i).y == seg.get(0).y)
      exit();
  }
 }
 
 void grow()
 {
   seg.add(new Seg(seg.get(count).x, seg.get(count).y));
   count++;
 }
 
 void render()
 {
   for (Seg i : seg)
   {
     i.render();
   }
 }
}
