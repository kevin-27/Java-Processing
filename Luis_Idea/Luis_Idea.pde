
CircleObject[] CircleArray;
int ArraySize = 10;

Snake snake;

void setup()
{
  size(720, 720, P2D);
  background(0);
  CircleArray = new CircleObject[ArraySize];
  
  snake = new Snake();
  
  /*for (int i = 0; i < ArraySize; i++)
  {
    CircleArray[i] = new CircleObject(width/2, height/2, 27);
  }*/
}

void draw()
{
  background(0);
  snake.Update();
  /*for (int i = 0; i < ArraySize; i++)
  {
    CircleArray[i].Update();
  }*/
}

float Distance(float x1, float y1, float x2, float y2)
{
  
  float diff_X = x1 - x2;
  float diff_Y = y1 - y2;
  return (float)Math.sqrt((diff_X * diff_X) + (diff_Y * diff_Y));
}
