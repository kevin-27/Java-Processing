class Grid
{
  Node[][] node;
  int WidthSize, HeightSize;
  int Size;
  
  boolean Start;
  
  Grid()
  {
    Size = 20;
    WidthSize = width / Size;
    HeightSize = (height - 22) / Size;
    
    node = new Node[WidthSize][HeightSize];
    for(int x = 0; x < WidthSize; x++)
      for(int y = 0; y < HeightSize; y++)
        node[x][y] = new Node(x * Size, y * Size, Size);
  }
  
  void Update()
  {
    //Update
    if(Start)
    {
      for(int x = 0; x < WidthSize; x++)
        for(int y = 0; y < HeightSize; y++)
          node[x][y].Update(node);
          
      for(int x = 0; x < WidthSize; x++)
        for(int y = 0; y < HeightSize; y++)
        {          
          if(node[x][y].Queued == false)
          {
            node[x][y].Queued = false;
            node[x][y].Alive = false;
            node[x][y].FillColor = 0;
            node[x][y].StrokeColor = 255;
          }
          
          if(node[x][y].Queued == true)
          {
            node[x][y].Queued = false;
            node[x][y].Alive = true;
            node[x][y].FillColor = 255;
            node[x][y].StrokeColor = 0;
          }                 
        }
    }          
  }
  
  void DrawNodes()
  {
    //Draw nodes
    if(mousePressed)
    {
      if(mouseX > 0 && mouseX < width-1 &&
         mouseY > 0 && mouseY < HeightSize*Size)
      {
       node[mouseX/Size][mouseY/Size].Alive = true;
       node[mouseX/Size][mouseY/Size].FillColor = 255;       
       node[mouseX/Size][mouseY/Size].StrokeColor = 0;
      }
    }
  }
  
  void Render()
  {
    for(int x = 0; x < WidthSize; x++)
      for(int y = 0; y < HeightSize; y++)
        node[x][y].Render();
  }
}
