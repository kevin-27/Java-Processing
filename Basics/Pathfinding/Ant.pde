class Ant
{
 float x, y;
 float velX, velY;
 float diffX, diffY;
 float targetX, targetY;
 float distance;
 float speed;
 ArrayList<Node> path = new ArrayList<Node>();
 
 Ant()
 {
   x = (((width/16)/2) - 7) * 16;
   y = (((height/16)/2)) * 16;
   targetX = x;
   targetY = y;
   speed = 3;
 }
 
 void update()
 {
   if (path.isEmpty() != true)
        move();
 }
 
 void getDistance()
 {
  //target node
  targetX = (int)path.get(0).cord.x * 16;
  targetY = (int)path.get(0).cord.y * 16;
  
  //Gets the distance
  diffX = x - targetX;
  diffY = y - targetY;
  distance = (float) Math.sqrt((diffX * diffX) + (diffY * diffY));
 }
 
 void move()
 {
  getDistance();
  
  //Moving
  velX = ((-1 / distance) * diffX) * speed;
  velY = ((-1 / distance) * diffY) * speed;
  x += velX;
  y += velY;
  
  //Stops it from moving in place super fast
  if(diffX > -2 && diffX < 2)
    x = targetX;
  if(diffY > -2 && diffY < 2)
    y = targetY;
    
  //Next node
  if(diffX == 0 && diffY == 0)
  {
    path.remove(0);
  }
 }
 
 void setTarget(PVector mouse, Node node[][])
 {
   PVector startPos = new PVector((int)x /  16, (int)y /  16);
   PVector targetPos = new PVector((int)mouse.x /  16, (int)mouse.y /  16);
   Pathing pathing = new Pathing(startPos, targetPos, node);
   path = pathing.getPath();
 }
 
 void render()
 {
   fill(0, 0, 255);
   rect(x, y, 16, 16);
 }
}
