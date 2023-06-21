void keyPressed()
{
  if (key == 'w')
    W_Button = true;
    
  if (key == 's')
    S_Button = true; 
    
  if (keyCode == UP)
    Up_Button = true;
    
  if (keyCode == DOWN)
    Down_Button = true; 
}

void keyReleased()
{
  if (key == 'w')
    W_Button = false;
    
  if (key == 's')
    S_Button = false;
    
  if (keyCode == UP)
    Up_Button = false;
    
  if (keyCode == DOWN)
    Down_Button = false;
}

void PaddleUpdate()
{
  if (W_Button)
    Paddle_1.Pos.y -= Paddle_1.Vel.y;
    
  if (S_Button)
    Paddle_1.Pos.y += Paddle_1.Vel.y;
    
  if (Up_Button)
    Paddle_2.Pos.y -= Paddle_2.Vel.y;
    
  if (Down_Button)
    Paddle_2.Pos.y += Paddle_2.Vel.y;
}

//Function that does all the cool stuff
void BallUpdate()
{
  //Move Ball
  Ball.Pos.x += Ball.Vel.x;
  Ball.Pos.y += Ball.Vel.y;
  
  BallCollisionWalls();
  BallPaddleCollision();
  
}

void BallCollisionWalls()
{
  //Left Side
  if (Ball.Pos.x < 0)
    {
      //Reverse Velocity 
      Ball.Vel.x *= -1; 
      
      //Reset Ball to Middle
      Ball.Pos = new PVector((width / 2) - (Ball.Size.x / 2), 
                             (height / 2) - (Ball.Size.y / 2));
      
      //Score Update
      Score_2++;
      
    }
    
  //Right Side  
  if (Ball.Pos.x + Ball.Size.x > width)
    {
      //Reverse Velocity 
      Ball.Vel.x *= -1; 
      
      //Reset Ball to Middle
      Ball.Pos = new PVector(width / 2, height / 2);
      
      //Score Update
      Score_1++;
    }
    
  if (Ball.Pos.y < 0 ||
      Ball.Pos.y + Ball.Size.y > height )
    {
      Ball.Vel.y *= -1;
      
      //Score Update
      //Score_1++;
    }
}

void BallPaddleCollision()
{
  //Paddle_1
  if (RectangleCollision(Ball.Pos, Ball.Size, 
                         Paddle_1.Pos, Paddle_1.Size))
  {
    Ball.Vel.x *= -1;
    Ball.Pos.x = Paddle_1.Pos.x + Paddle_1.Size.x;
  }
  
  //Paddle_2
  if (RectangleCollision(Ball.Pos, Ball.Size, 
                         Paddle_2.Pos, Paddle_2.Size))
  {
    Ball.Vel.x *= -1;
    Ball.Pos.x = Paddle_2.Pos.x - Ball.Size.x;
  }
}

boolean RectangleCollision(PVector Rect_1_Pos, PVector Rect_1_Size, 
                           PVector Rect_2_Pos, PVector Rect_2_Size)
{
  if (Rect_1_Pos.x < Rect_2_Pos.x + Rect_2_Size.x
   && Rect_1_Pos.x + Rect_1_Size.x > Rect_2_Pos.x
   && Rect_1_Pos.y < Rect_2_Pos.y + Rect_2_Size.y
   && Rect_1_Pos.y + Rect_1_Size.y > Rect_2_Pos.y)
  {   
    return true;
  }
  return false;
}

//Old Dookie Code
/*void BallCollisionPaddle_1()
{
  if (Ball.Pos.x < Paddle_1.Pos.x + Paddle_1.Size.x
   && Ball.Pos.x + Ball.Size.x > Paddle_1.Pos.x
   && Ball.Pos.y < Paddle_1.Pos.y + Paddle_1.Size.y
   && Ball.Pos.y + Ball.Size.y > Paddle_1.Pos.y)
  {   
    Ball.Vel.x *= -1;
    Ball.Pos.x = Paddle_1.Pos.x + Paddle_1.Size.x;
  }
}*/
