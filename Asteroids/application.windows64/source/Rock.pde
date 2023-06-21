class Rock
{
 PVector pos;
 PVector vel;
 float di;
 int[] shape;
 int Nsides;
 int gen;
 
 Rock(float x, float y, float di, PVector vel, int gen)
 {
   this.di = di;
   pos = new PVector(x, y);
   this.vel = new PVector();
   this.vel.set(vel);
   this.gen = gen;
   
   Nsides = (int)random(8, 17);
   shape = new int[Nsides+1];
   for (int i = 0; i <= Nsides; i++)
     shape[i] = (int)random(-di/3, di/3);
     //shape[i] = 0;
 }
 
 void update()
 {
  pos.add(vel); 
  bounds();
 }
 
  void bounds()
  {
   if (pos.x < -di/2)
     pos.x = width;
   else if (pos.y < -di/2)
     pos.y = height;
   else if (pos.x > width+(di/2))
     pos.x = 0;
   else if (pos.y > height+(di/2))
     pos.y = 0;
  }
  
  void RandomShape()
  {
   beginShape();
   PVector firstV = new PVector();
   for (int i = 0; i <= Nsides; i++)
   {
    float angle = map(i, 0, Nsides, 0, TWO_PI);
    float temp = di+shape[i];
    //float temp = s;
    float x = (temp*cos(angle))+pos.x;
    float y = (temp*sin(angle))+pos.y;
    
    //x += shape[i];
    //y += shape[i];
    
    if (i == 0)
      firstV.set(x, y);
    
    if (i == Nsides)
      vertex(firstV.x, firstV.y);
    else
      vertex(x, y);
   }
   endShape();
  }
 
 void render()
 {
   noFill();
   strokeWeight(1);
   //ellipse(pos.x, pos.y, s, s);
   RandomShape();
 }
}
