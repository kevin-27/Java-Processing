class Node
{
  PVector Pos;
  int Size;
  int FillColor;
  boolean Alive;
  PVector Index;
  int Neighbors;
  int StrokeColor;
  boolean Queued;
  
  Node(float posX, float posY, int size)
  {
    Pos = new PVector(posX, posY);
    Size = size;
    FillColor = 0;
    Alive = false;
    Index = new PVector(Pos.x/Size, Pos.y/Size);
    Neighbors = 0;
    StrokeColor = 255;
    Queued = false;
  }
  
  void Update(Node[][] node)
  {
    Neighbors = 0;
    for(int x = -1; x <= 1; x++)
      for(int y = -1; y <= 1; y++)  
      {
        //Doesnt count self
        if(!(x == 0 && y == 0))  
        {
          /*
          //Doesnt go out of bounds
          if(Index.x + x >= 0 && Index.x + x < width/Size &&
             Index.y + y >= 0 && Index.y + y < height/Size)
             {             
               if(node[(int)Index.x + x]
                      [(int)Index.y + y].Alive == true)
                  Neighbors++;
             }*/         
          
          int X, Y;
          
          X = (int)Index.x + x;
          Y = (int)Index.y + y;
          
          //Left
          if(X < 0)
            X = (width/Size)-1;
          
          //Up
          if(Y < 0)
            Y = ((height-22)/Size)-1;
         
          //Right
          if(X > (width/Size)-1)
            X = 0;
          
          //Down
          if(Y > ((height-22)/Size)-1)
            Y = 0;
          
          //Thing
          if(node[X][Y].Alive == true)
             Neighbors++;
        }      
      }
    
    //if(Alive)
      //println(Neighbors);
    CheckNeighbors(Neighbors);
  }
  
  void CheckNeighbors(int neighbors)
  {
    //Rule 1, less then 2 cells
    if(neighbors < 2)
    {
      Queued = false;
    }
    
    //Rule 2, 2 or 4 cells
    if (Alive == true && (neighbors == 2 || neighbors == 4))
    {
      Queued = true;;     
    }
    
    //Rule 3, more then 3 cells
    if(neighbors > 3)
    {
      Queued = false;
    }
    
    //Rule 4, exactly 3 cells
    if(neighbors == 3)
    {
      Queued = true;
    }
  }
  
  void Render()
  {
    fill(FillColor);
    stroke(StrokeColor);
    rect(Pos.x, Pos.y, Size, Size);
  }
}
