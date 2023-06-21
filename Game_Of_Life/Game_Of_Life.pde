
Grid grid;
int TimeCount;

void setup()
{
  size(721, 921);
  //frameRate(10);
  
  grid = new Grid();
  TimeCount = millis();
}

void draw()
{
  background(0);
  
  //if (keyPressed) 
    //if (key == 'b' || key == 'B')
      //grid.Start = !grid.Start;
      
  grid.Render();
  grid.DrawNodes();
   
  if (millis() - TimeCount >=  250)
  {
    TimeCount = millis();
    grid.Update();
  }
}

void keyPressed()
{
  if (key == ENTER)
      grid.Start = !grid.Start;
}
 
 
 
 
 
