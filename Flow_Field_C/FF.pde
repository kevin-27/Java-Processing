class Field
{
  PVector flowDir[][];
  int cols, rows;
  float inc = 0.05;
  float zoff = 0;
  
  Field()
  {
    cols = (width/20);
    rows = (height/20);
    
    flowDir = new PVector[cols][rows];
    
  }
  
  void update()
  {
   float xoff = 0;
   for (int x = 0; x < cols; x++)
   {
    float yoff = 0;
    for (int y = 0; y < rows; y++)
    {
      float angle = noise(xoff, yoff, zoff)*TWO_PI*4;
      flowDir[x][y] = PVector.fromAngle(angle);
      flowDir[x][y].setMag(2);
      yoff += inc;
    }
    xoff += inc;
   }
   zoff += 0.005;
 }
  
  void render()
  {
   noFill();
   stroke(255);
   strokeWeight(0.5);
   
   update();
   
   /*for (int i = 0; i < cols; i++)
   {
     for (int p = 0; p < rows; p++)
     {
       //rect(16+16*i, 112+16*p, 16, 16);
       //line(24+16*i, 112+16*p, 24+16*i, 128+16*p);
     }
   }*/
  }
}
