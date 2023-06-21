//Kevin P. Mulcahy
//Pong Game

Rectangle Ball, Paddle_1, Paddle_2;
boolean W_Button, S_Button, Up_Button, Down_Button;
int Score_1, Score_2;

void setup()
{
  size(1080, 720);
  Initialize();
}

void Initialize()
{
  //Ball Velocity is a pertanage of the screen Size
  float BallVelX = width * 0.0075f;
  float BallsVelY = height * 0.0025;
  
  //Position, Size, Velocity
  Ball = new Rectangle
  (width / 2, height / 2, 25, 25, 
   BallVelX, BallsVelY);  
  
  Paddle_1 = new Rectangle
  (75, (height / 2) - 50, 10, 100,  0, 5);
  
  Paddle_2 = new Rectangle
  (width - 75, (height / 2) - 50, 10, 100, 0, 5);
}

void draw()
{
  background(0);
  fill(255);
  
  //Render Objects
  Ball.render();
  Paddle_1.render();
  Paddle_2.render();
   
  //Middle Line
  stroke(255);
  line(width / 2, 0, width / 2, height);
  
  //Update Objects  
  BallUpdate();
  PaddleUpdate();
  AI_UpdatePaddle2();
  
  Slope();
  
  //Render Score
  textSize(24);
  text("" + Score_1, 50, 30);
  text("" + Score_2, width - 75, 30);
}
