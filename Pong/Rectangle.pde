class Rectangle
{
 PVector Pos;
 PVector Vel;
 PVector Size;
 
 Rectangle(float PosX, float PosY,
           float SizeX, float SizeY,
           float VelX, float VelY)
 {
   Pos = new PVector(PosX, PosY);
   Size = new PVector(SizeX, SizeY);
   Vel = new PVector(VelX, VelY);
 }
 
 void render()
 {
   rect(Pos.x, Pos.y, Size.x, Size.y);
 }
}
