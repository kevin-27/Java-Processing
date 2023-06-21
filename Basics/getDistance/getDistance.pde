float x, y;
float velX, velY;
float diffX, diffY;
float speed;
float distance;
float pathX, pathY;

void setup()
{
 size(720, 480);
 x = 256;
 y = 256;
 speed = 3;
 pathX = x;
 pathY = y;
}

void draw()
{
 background(42);
 fill(0, 0, 255);
 rect(x - 8, y - 8, 16, 16);
 move();
}

void mousePressed()
{
  if (mouseButton == LEFT)
  {
    //Moving to click math
    pathX = mouseX;
    pathY = mouseY;
  }
}

void Distance()
{
  diffX = x - pathX;
  diffY = y - pathY;
  distance = (float) Math.sqrt((diffX * diffX) + (diffY * diffY));
}

void move()
{
  Distance();
  
  //Moving to click math
  velX = ((-1 / distance) * diffX) * speed;
  velY = ((-1 / distance) * diffY) * speed;
  x += velX;
  y += velY;
  
  //Stops it from moving in place super fast
  if(diffX > -2 && diffX < 2)
    x = pathX;
  if(diffY > -2 && diffY < 2)
    y = pathY;
}
