class CircleObject
{
  float Radius;
  PVector Pos; 
  PVector Vel;  
  PVector Color;
  
  PVector ConstVel;
   
  CircleObject(float PosX, float PosY, float Radius)
  {
    Pos = new PVector(PosX, PosY);
    this.Radius = Radius;
    Vel = new PVector(0, 0);
    Color = new PVector(random(255), random(255), random(255));
    ConstVel = new PVector(3, 3);
  }
  
  void Update()
  {
    Render();
    Move();
    WallBounce();
  }
  
  void Move()
  {
    Pos.x += Vel.x;
    Pos.y += Vel.y;
  }
  
  void WallBounce()
  {
    if (Pos.x + Radius > width || Pos.x - Radius < 0)
    {       
      Vel.x *= -1;
      Pos.x += Vel.x;     
      Vel.x += random(-1, 1);           
      
      Color = new PVector(random(255), random(255), random(255));     
    }
      
    if (Pos.y + Radius > width || Pos.y - Radius < 0)
    {    
      Vel.y *= -1;
      Pos.y += Vel.y;      
      Vel.y += random(-1, 1);
      
      Color = new PVector(random(255), random(255), random(255));      
    }   
  }
  
  void Render()
  {
    fill(Color.x, Color.y, Color.z);
    circle(Pos.x, Pos.y, Radius * 2);
  }
}
