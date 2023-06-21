class King extends Piece
{
  King(PVector pos, PVector currSq, boolean Color)
  {
    super(pos, currSq, Color);
  }
  
  void addCastlingMoves(Square sq[][])
  {
    //Castling
    int num = 7;
    if (!Color)
      num = 0;
    
    //Queen Side   
    if (firstMove && 
        sq[0][num].piecePointer != null &&
        sq[0][num].piecePointer.getClass() == Rook.class &&
        sq[0][num].piecePointer.firstMove &&
        sq[1][num].piecePointer == null &&
        sq[2][num].piecePointer == null &&
        sq[3][num].piecePointer == null)
    {
      if (Color)
      {
        if (sq[4][num].isAttackedB == 0 &&
            sq[2][num].isAttackedB == 0 &&
            sq[3][num].isAttackedB == 0)         
              moves.add(new PVector(2, num));
      }              
      else
      {
        if (sq[4][num].isAttackedW == 0 &&
            sq[2][num].isAttackedW == 0 &&
            sq[3][num].isAttackedW == 0)         
              moves.add(new PVector(2, num));
      }
    }
    
    //King Side 
    if (firstMove && 
        sq[7][num].piecePointer != null &&
        sq[7][num].piecePointer.getClass() == Rook.class &&
        sq[7][num].piecePointer.firstMove &&
        sq[6][num].piecePointer == null &&
        sq[5][num].piecePointer == null)
    {
      if (Color)
      {
        if (sq[4][num].isAttackedB == 0 &&        
            sq[5][num].isAttackedB == 0 &&
            sq[6][num].isAttackedB == 0)         
              moves.add(new PVector(6, num));
      }
      else
      {
        if (sq[4][num].isAttackedW == 0 &&        
            sq[5][num].isAttackedW == 0 &&
            sq[6][num].isAttackedW == 0)         
              moves.add(new PVector(6, num));
      }
    } 
  }
  
  void possibleMoves(Square sq[][])
  {  
    moves.clear();
    
    moves.add(new PVector(currSq.x-1, currSq.y+1));
    moves.add(new PVector(currSq.x, currSq.y+1));
    moves.add(new PVector(currSq.x+1, currSq.y+1));
     
    moves.add(new PVector(currSq.x-1, currSq.y));
    moves.add(new PVector(currSq.x+1, currSq.y));
     
    moves.add(new PVector(currSq.x-1, currSq.y-1));
    moves.add(new PVector(currSq.x, currSq.y-1));
    moves.add(new PVector(currSq.x+1, currSq.y-1));
    
    removeOutOfBounds();        
    addAttacks(sq);  
    removeFriendlyFire(sq); 
  }
  
  //remove moves under attack // i dont even use this.
  void removeKingMoves(Square sq[][])
  { 
    int x = 0;
    int y = 0;
    for (int i = 0; i < moves.size(); i++)
    {
      x = (int)moves.get(i).x;
      y = (int)moves.get(i).y;
      
      if (Color && sq[x][y].isAttackedB > 0)
      {
        moves.remove(i);
        i--;
      }      
      else if (!Color && sq[x][y].isAttackedW > 0)
      {
        moves.remove(i);
        i--;
      }
    }
  }
  
  void render()
  {
   super.render();
   if (Color)
     image(kingW_png, pos.x+6, pos.y+4, s, s);
   else
     image(kingB_png, pos.x+6, pos.y+4, s, s);
  }
}

class Pawn extends Piece
{
  Pawn(PVector pos, PVector currSq, boolean Color)
  {
    super(pos, currSq, Color);
  }
  
  void possibleMoves(Square sq[][])
  {
    moves.clear();
    
    int x = (int)currSq.x;
    int y = (int)currSq.y;
          
    if (Color)
    {
      //Move forward
      if (y >= 1 && sq[x][y-1].piecePointer == null)
      {
        moves.add(new PVector(x, y-1));
        
        if (y == 6 && sq[x][y-2].piecePointer == null)
            moves.add(new PVector(x, y-2));
      }
      
      //Captures
      if (x-1 >= 0 && y-1 >= 0)
      {
        if (sq[x-1][y-1].piecePointer != null)
          moves.add(new PVector(x-1, y-1));

        if (sq[x-1][y].piecePointer != null && 
            sq[x-1][y].piecePointer.enPassant)
          moves.add(new PVector(x-1, y-1));
      }
      if (x+1 <= 7 && y-1 >= 0)
      {
        if (sq[x+1][y-1].piecePointer != null)
          moves.add(new PVector(x+1, y-1));
          
        if (sq[x+1][y].piecePointer != null && 
            sq[x+1][y].piecePointer.enPassant)
          moves.add(new PVector(x+1, y-1));
      }   
    }
    else
    {
      //Move forward
      if (y <= 6 && sq[x][y+1].piecePointer == null)
      {
        moves.add(new PVector(x, currSq.y+1));
        
        if (y == 1 && sq[x][y+2].piecePointer == null)      
            moves.add(new PVector(x, y+2));
      }
      
      //Capture
      if (x-1 >= 0 && y+1 <= 7)
      {
        if (sq[x-1][y+1].piecePointer != null)
          moves.add(new PVector(x-1, y+1));

        if (sq[x-1][y].piecePointer != null && 
            sq[x-1][y].piecePointer.enPassant)
          moves.add(new PVector(x-1, y+1));
      }
      if (x+1 <= 7 && y+1 <= 7)
      {
        if (sq[x+1][y+1].piecePointer != null)
          moves.add(new PVector(x+1, y+1));
 
        if (sq[x+1][y].piecePointer != null && 
            sq[x+1][y].piecePointer.enPassant)
          moves.add(new PVector(x+1, y+1));
      }     
    }
    
    removeOutOfBounds();
    
    //Add attacks to board    
    if (Color)
    {
      if (x-1 >= 0 && y-1 >= 0)     
        sq[x-1][y-1].isAttackedW++;

      if (x+1 <= 7 && y-1 >= 0)
        sq[x+1][y-1].isAttackedW++;
    }
    else
    {
      if (x-1 >= 0 && y+1 <= 7)
        sq[x-1][y+1].isAttackedB++;
        
      if (x+1 <= 7 && y+1 <= 7)
        sq[x+1][y+1].isAttackedB++;
    }
    
    removeFriendlyFire(sq);
  }
  
  void render()
  {
   super.render();
   
   if (Color)
     image(pawnW_png, pos.x-14, pos.y+4, s, s); 
   else
     image(pawnB_png, pos.x-14, pos.y+4, s, s); 
  }
}

class Rook extends Piece
{
  Rook(PVector pos, PVector currSq, boolean Color)
  {
    super(pos, currSq, Color);
  }
  
  void possibleMoves(Square sq[][])
  {
    moves.clear();
    
    //Moves Right
    int count = 1;
    while (currSq.x + count < 8)
    {
      if (sq[(int)currSq.x + count][(int)currSq.y].piecePointer == null)
        moves.add(new PVector(currSq.x + count, currSq.y));
        
      else if (sq[(int)currSq.x + count][(int)currSq.y].piecePointer != null &&
          sq[(int)currSq.x + count][(int)currSq.y].piecePointer.Color != Color)
      {
        moves.add(new PVector(currSq.x + count, currSq.y));
        count = 8;
        break;
      }
      
      else if (sq[(int)currSq.x + count][(int)currSq.y].piecePointer != null &&
          sq[(int)currSq.x + count][(int)currSq.y].piecePointer.Color == Color)
      {
        //Adds attack without move
        if (Color)
          sq[(int)currSq.x + count][(int)currSq.y].isAttackedW++;
        else
          sq[(int)currSq.x + count][(int)currSq.y].isAttackedB++;
          
        count = 8;
        break;
      }
      count++;
    }
    //Moves Left
    count = 1;
    while (currSq.x - count > -1)
    {
      if (sq[(int)currSq.x - count][(int)currSq.y].piecePointer == null)
        moves.add(new PVector(currSq.x - count, currSq.y));
        
      else if (sq[(int)currSq.x - count][(int)currSq.y].piecePointer != null &&
          sq[(int)currSq.x - count][(int)currSq.y].piecePointer.Color != Color)
      {
        moves.add(new PVector(currSq.x - count, currSq.y));
        count = 8;
        break;
      }
      
      else if (sq[(int)currSq.x - count][(int)currSq.y].piecePointer != null &&
          sq[(int)currSq.x - count][(int)currSq.y].piecePointer.Color == Color)
      {
        //Adds attack without move
        if (Color)
          sq[(int)currSq.x - count][(int)currSq.y].isAttackedW++;
        else
          sq[(int)currSq.x - count][(int)currSq.y].isAttackedB++;
          
        count = 8;        
        break;
      }
      count++;
    }
    //Move Down
    count = 1;
    while (currSq.y + count < 8)
    {
      if (sq[(int)currSq.x][(int)currSq.y + count].piecePointer == null)
        moves.add(new PVector(currSq.x, currSq.y + count));
        
      else if (sq[(int)currSq.x][(int)currSq.y + count].piecePointer != null &&
          sq[(int)currSq.x][(int)currSq.y + count].piecePointer.Color != Color)
      {
        moves.add(new PVector(currSq.x, currSq.y + count));
        count = 8;
        break;
      }
      
      else if (sq[(int)currSq.x][(int)currSq.y + count].piecePointer != null &&
          sq[(int)currSq.x][(int)currSq.y + count].piecePointer.Color == Color)
      {
        //Adds attack without move
        if (Color)
          sq[(int)currSq.x][(int)currSq.y + count].isAttackedW++;
        else
          sq[(int)currSq.x][(int)currSq.y + count].isAttackedB++;
          
        count = 8;
        break;
      }
      count++;
    }
    //Moves Up
    count = 1;
    while (currSq.y - count > -1)
    {
      if (sq[(int)currSq.x][(int)currSq.y - count].piecePointer == null)
        moves.add(new PVector(currSq.x, currSq.y - count));
        
      else if (sq[(int)currSq.x][(int)currSq.y - count].piecePointer != null &&
          sq[(int)currSq.x][(int)currSq.y - count].piecePointer.Color != Color)
      {
        moves.add(new PVector(currSq.x, currSq.y - count));
        count = 8;
        break;
      }
      
      else if (sq[(int)currSq.x][(int)currSq.y - count].piecePointer != null &&
          sq[(int)currSq.x][(int)currSq.y - count].piecePointer.Color == Color)
      {
        //Adds attack without move
        if (Color)
          sq[(int)currSq.x][(int)currSq.y - count].isAttackedW++;
        else
          sq[(int)currSq.x][(int)currSq.y - count].isAttackedB++;
          
        count = 8;
        break;
      }
      count++;
    }
    
    addAttacks(sq);
  }
  
  void render()
  {
   super.render();
   
   if (Color)
     image(rookW_png, pos.x-10, pos.y+4, s, s); 
   else
     image(rookB_png, pos.x-10, pos.y+4, s, s); 
  }
}

class Knight extends Piece
{
  Knight(PVector pos, PVector currSq, boolean Color)
  {
    super(pos, currSq, Color);
  }
  
  void possibleMoves(Square sq[][])
  {
    moves.clear();
    moves.add(new PVector(currSq.x-1, currSq.y-2));
    moves.add(new PVector(currSq.x+1, currSq.y-2));
    
    moves.add(new PVector(currSq.x-1, currSq.y+2));
    moves.add(new PVector(currSq.x+1, currSq.y+2));
    
    moves.add(new PVector(currSq.x-2, currSq.y-1));
    moves.add(new PVector(currSq.x-2, currSq.y+1));
    
    moves.add(new PVector(currSq.x+2, currSq.y-1));
    moves.add(new PVector(currSq.x+2, currSq.y+1));
    
    removeOutOfBounds();
    addAttacks(sq);
    removeFriendlyFire(sq);
  }
  
  void render()
  {
   super.render();
   
   if (Color)
     image(knightW_png, pos.x-6, pos.y+4, s, s); 
   else
     image(knightB_png, pos.x-6, pos.y+4, s, s); 
  }
}

class Bishop extends Piece
{
  Bishop(PVector pos, PVector currSq, boolean Color)
  {
    super(pos, currSq, Color);
  }
  
  void possibleMoves(Square sq[][])
  {
    
  }
  
  void render()
  {
   super.render();
   
   if (Color)
     image(bishopW_png, pos.x-6, pos.y+4, s, s); 
   else
     image(bishopB_png, pos.x-6, pos.y+4, s, s); 
  }
}

class Queen extends Piece
{
  Queen(PVector pos, PVector currSq, boolean Color)
  {
    super(pos, currSq, Color);
  }
  
  void possibleMoves(Square sq[][])
  {
    
  }
  
  void render()
  {
   super.render();
   
   if (Color)
     image(queenW_png, pos.x-6, pos.y+4, s, s); 
   else
     image(queenB_png, pos.x-6, pos.y+4, s, s); 
  }
}
