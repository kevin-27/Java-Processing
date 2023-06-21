void AI_UpdatePaddle2()
{
  float BallCenter = Ball.Pos.y + Ball.Size.y / 2;
  float PaddleCenter = Paddle_2.Pos.y + Paddle_2.Size.y / 2;
  
  if (BallCenter > PaddleCenter)
  {
    Paddle_2.Pos.y += Paddle_2.Vel.y;
  }
  
  if (BallCenter < PaddleCenter)
  {
    Paddle_2.Pos.y -= Paddle_2.Vel.y;
  }
}

void InterceptBall()
{
  
}

// y - y1 = m * (x - x1) not helpful
void Slope()
{
  float BallCenterX = Ball.Pos.x + Ball.Size.x / 2;
  float BallCenterY = Ball.Pos.y + Ball.Size.y / 2;
  
  float SlopeX = Ball.Pos.x + Ball.Vel.x * 150;
  float SlopeY = Ball.Pos.y + Ball.Vel.y * 150;
  
  line(BallCenterX, BallCenterY, 
       SlopeX, SlopeY);       
}
