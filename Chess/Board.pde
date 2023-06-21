class Board
{
  int sqSize = 64;
  int xOff = 288;
  int yOff = 96;
  int tempCol;
  Square sq[][];
  int selX, selY;
  boolean turn;
  
  //Piece kingW, kingB;
  
  ArrayList <Piece> White;
  ArrayList <Piece> Black;
  
  Piece selPointer;
   
  Board()
  { 
    turn = true;
    int tempCount = 0;
    sq = new Square[8][8];
    for(int y = 0; y < 8; y++)
    {
      for(int x = 0; x < 8; x++)
      {
        if ((y + x + 1) % 2 == 0) 
          tempCol = #585B79;
        else 
          tempCol = #D6D1D1;
          
        sq[x][y] = new Square(xOff + x*sqSize, yOff + y*sqSize, 
                              sqSize, tempCol, tempCount, x, y);
        tempCount++;
      }
    }
    
    White = new ArrayList<Piece>();
    Black = new ArrayList<Piece>();
    
    //Kings
    White.add(new King(sq[4][7].pos, new PVector(4, 7), true));
    sq[4][7].piecePointer = White.get(0);
    Black.add(new King(sq[4][0].pos, new PVector(4, 0), false));    
    sq[4][0].piecePointer = Black.get(0);
    
    //Rooks
    White.add(new Rook(sq[0][7].pos, new PVector(0, 7), true));
    sq[0][7].piecePointer = White.get(1);
    White.add(new Rook(sq[7][7].pos, new PVector(7, 7), true));
    sq[7][7].piecePointer = White.get(2);
    
    Black.add(new Rook(sq[0][0].pos, new PVector(0, 0), false));   
    sq[0][0].piecePointer = Black.get(1);
    Black.add(new Rook(sq[7][0].pos, new PVector(7, 0), false));   
    sq[7][0].piecePointer = Black.get(2);
        
    //Knights
    White.add(new Knight(sq[1][7].pos, new PVector(1, 7), true));
    sq[1][7].piecePointer = White.get(3);
    White.add(new Knight(sq[6][7].pos, new PVector(6, 7), true));
    sq[6][7].piecePointer = White.get(4);
    
    Black.add(new Knight(sq[1][0].pos, new PVector(1, 0), false));   
    sq[1][0].piecePointer = Black.get(3);
    Black.add(new Knight(sq[6][0].pos, new PVector(6, 0), false));   
    sq[6][0].piecePointer = Black.get(4);
    
    //Pawns
    for (int i = 0; i < 8; i++)
    {
      White.add(new Pawn(sq[i][6].pos, new PVector(i, 6), true));
      Black.add(new Pawn(sq[i][1].pos, new PVector(i, 1), false));
      
      sq[i][6].piecePointer = White.get(i+5);
      sq[i][1].piecePointer = Black.get(i+5);
    }       
 
    //Calculate Moves
    possibleMoves();
    //illegalMoves();
  }
  
  void checkClick()
  {
    boolean skip = false;
    for(int y = 0; y < 8; y++)
    {
      for(int x = 0; x < 8; x++)
      {
        if (sq[x][y].checkClick() && selPointer != null)
        {
          if (makeMove(selPointer, new PVector(x, y)))        
          {
            skip = true;
            turn = !turn;
            selPointer = null;
            
            //Calculate Moves
            possibleMoves();
            illegalMoves();
          }
        }      
      }
    }
    
    //Select
    if (!skip)
      for(int y = 0; y < 8; y++)
      {
        for(int x = 0; x < 8; x++)
        {
          sq[y][x].unSelected();
          if (sq[y][x].checkClick())
          {
            if (sq[y][x].piecePointer != null)
            {
              if (turn && sq[y][x].piecePointer.Color)
              {
                sq[y][x].Selected();            
                selPointer = sq[y][x].piecePointer;
              }
              else if (!turn && !sq[y][x].piecePointer.Color)
              {
                sq[y][x].Selected();            
                selPointer = sq[y][x].piecePointer;
              }  
            }
            else
            {
              sq[y][x].Selected();            
              selPointer = sq[y][x].piecePointer;
            }
          }
        }
      }
  }
  
  void illegalMoves()
  {   
    Board boardCopy = new Board();
    boardCopy.set(White, Black);
    boardCopy.possibleMoves();
    
    /*println("-------------------------------------------------------------");
    for(int y = 0; y < 8; y++)
    {
      for(int x = 0; x < 8; x++)
      {
        print(boardCopy.sq[x][y].isAttackedB + " ");        
      }
      println();
    }*/
    
    if (turn) //White
      for (int i = 0; i < White.size(); i++)
      {
        for (int p = 0; p < White.get(i).moves.size(); p++)
        {
          //Does not Check Caslting moves
          if (i == 0 && White.get(i).currSq.x == 4 &&
                        White.get(i).moves.get(p).x == 2)
            break;
            
          if (i == 0 && White.get(i).currSq.x == 4 &&
                        White.get(i).moves.get(p).x == 6)
            break;
            
          //Test move on copy of the board
          boardCopy.makeMove(boardCopy.White.get(i), White.get(i).moves.get(p));
          boardCopy.possibleMoves();             
          
          //White King under attack
          int cordX = (int)boardCopy.White.get(0).currSq.x;
          int cordY = (int)boardCopy.White.get(0).currSq.y;         
          if (boardCopy.sq[cordX][cordY].isAttackedB > 0)
          {
            White.get(i).moves.remove(p);
            p--;
          }
          
          //Reset
          boardCopy.set(White, Black);
          boardCopy.possibleMoves();
        }
      }
    else //Black
    {
      for (int i = 0; i < Black.size(); i++)
      {
        //if (Black.get(i).moves.size() > 0)
        for (int p = 0; p < Black.get(i).moves.size(); p++)
        {
          //Does not Check Caslting moves
          if (i == 0 && Black.get(i).currSq.x == 4 &&
                        Black.get(i).moves.get(p).x == 2)
            break;
            
          if (i == 0 && Black.get(i).currSq.x == 4 &&
                        Black.get(i).moves.get(p).x == 6)
            break;
            
          //Test move on copy of the board
          boardCopy.makeMove(boardCopy.Black.get(i), Black.get(i).moves.get(p));
          boardCopy.possibleMoves();             
          
          //Black King under attack
          int cordX = (int)boardCopy.Black.get(0).currSq.x;
          int cordY = (int)boardCopy.Black.get(0).currSq.y;         
          if (boardCopy.sq[cordX][cordY].isAttackedW > 0)
          {
            Black.get(i).moves.remove(p);
            p--;
          }
          
          //Reset
          boardCopy.set(White, Black);
          boardCopy.possibleMoves();
        }
      }
    }
  }
  
  void possibleMoves()
  {
    //Reset Attacks
    for(int y = 0; y < 8; y++)
      for(int x = 0; x < 8; x++)
      {
        sq[x][y].isAttackedW = 0;
        sq[x][y].isAttackedB = 0;
      }
    
    //Possible Moves
    for(int y = 0; y < 8; y++)
      for(int x = 0; x < 8; x++)
        if (sq[x][y].piecePointer != null)
          sq[x][y].piecePointer.possibleMoves(sq);
          
    //Castling
    White.get(0).addCastlingMoves(sq);
    Black.get(0).addCastlingMoves(sq);
    
    //Remove moves under attack
    //White.get(0).removeKingMoves(sq);
    //Black.get(0).removeKingMoves(sq);
  }
  
  boolean makeMove(Piece selected, PVector target)
  {
    int x = (int)target.x;
    int y = (int)target.y;
    if (selected.checkMoves(new PVector(x, y)))
    {
      selected.firstMove = false;
      
      //Capture Pieces
      if (sq[x][y].piecePointer != null)
      {       
        if (sq[x][y].piecePointer.Color)
          White.remove(sq[x][y].piecePointer);
        else
          Black.remove(sq[x][y].piecePointer);
      }
      
      //Castles
      int num = 7;
      if (!turn)
        num = 0;
      
      //Queen Side
      if (selected.getClass() == King.class &&
          //sq[0][num].piecePointer != null && //not sure why i need this
          selected.currSq.x == 4 &&
          target.x == 2)
      {
        sq[0][num].piecePointer.pos = new PVector(sq[3][num].pos.x, sq[3][num].pos.y);
        sq[0][num].piecePointer.currSq = new PVector(3, num);
        sq[0][num].piecePointer.firstMove = false;
        sq[3][num].piecePointer = sq[0][num].piecePointer;
        sq[0][num].piecePointer = null;
        //println("Castled " + num);
      }
      //King Side
      else if (selected.getClass() == King.class &&
          //sq[7][num].piecePointer != null && //not sure why i need this
          selected.currSq.x == 4 &&
          target.x == 6)
      {
        sq[7][num].piecePointer.pos = new PVector(sq[5][num].pos.x, sq[5][num].pos.y);
        sq[7][num].piecePointer.currSq = new PVector(5, num);
        sq[7][num].piecePointer.firstMove = false;
        sq[5][num].piecePointer = sq[7][num].piecePointer;
        sq[7][num].piecePointer = null;
        //println("Castled " + num);
      }
      
      //en Passant
      if (selected.getClass() == Pawn.class &&
          (selected.currSq.y + 1 < y ||
           selected.currSq.y - 1 > y))
      {
        selected.enPassant = true;
        selected.firstMove = false;
      }
      
      //en Passant Captures
      if (selected.getClass() == Pawn.class &&
          selected.Color &&
          sq[x][y+1].piecePointer != null &&
          sq[x][y+1].piecePointer.enPassant)
      {
        if (sq[x][y+1].piecePointer.Color)
          White.remove(sq[x][y+1].piecePointer);
        else
          Black.remove(sq[x][y+1].piecePointer);
          
        sq[x][y+1].piecePointer = null;
      }           
      else if (selected.getClass() == Pawn.class &&
               !selected.Color &&
               sq[x][y-1].piecePointer != null &&
               sq[x][y-1].piecePointer.enPassant)
      {
        if (sq[x][y-1].piecePointer.Color)
          White.remove(sq[x][y-1].piecePointer);
        else
          Black.remove(sq[x][y-1].piecePointer);
          
        sq[x][y-1].piecePointer = null;
      }
      
      //Alternate Removing enPassant
      if (turn)
      {        
        for (Piece p : Black)
          p.enPassant = false; 
      }
      else
      {              
        for (Piece p : White)
          p.enPassant = false; 
      }                       
    
      //Remove piece from old square
      int prevX = (int)selected.currSq.x;
      int prevY = (int)selected.currSq.y;
      sq[prevX][prevY].piecePointer = null;
      sq[prevX][prevY].unSelected();
      
      //Move piece to new square
      selected.pos = sq[x][y].pos.copy();
      selected.currSq = new PVector(x, y);
      sq[x][y].piecePointer = selected;    
      
      //Return for skip           
      return true;
    }
    return false;
  }
  
  void set(ArrayList<Piece> w, ArrayList<Piece> b)
  { 
    //Set the pieces then set the sq pointers
    White = new ArrayList<Piece>();
    Black = new ArrayList<Piece>();
    
    for (Piece p : w)
    {
      if (p.getClass() == Pawn.class)
      {
        White.add(new Pawn(new PVector(p.pos.x, p.pos.y), new PVector(p.currSq.x, p.currSq.y), true));
        if (p.enPassant)
          White.get(White.size()-1).enPassant = true;
      }
        
      else if (p.getClass() == King.class)
      {
        White.add(new King(new PVector(p.pos.x, p.pos.y), new PVector(p.currSq.x, p.currSq.y), true));
        if (!p.firstMove)
          White.get(White.size()-1).firstMove = false;
      }
        
      else if (p.getClass() == Rook.class)
      {
        White.add(new Rook(new PVector(p.pos.x, p.pos.y), new PVector(p.currSq.x, p.currSq.y), true));
        if (!p.firstMove)
          White.get(White.size()-1).firstMove = false;
      }
      
      else if (p.getClass() == Knight.class)
      {
        White.add(new Knight(new PVector(p.pos.x, p.pos.y), new PVector(p.currSq.x, p.currSq.y), true));
        if (!p.firstMove)
          White.get(White.size()-1).firstMove = false;
      }
    }
    
    for (Piece p : b)
    {
      if (p.getClass() == Pawn.class)
      {
        Black.add(new Pawn(new PVector(p.pos.x, p.pos.y), new PVector(p.currSq.x, p.currSq.y), false));
        if (p.enPassant)
          Black.get(Black.size()-1).enPassant = true;
      }
        
      else if (p.getClass() == King.class)
      {
        Black.add(new King(new PVector(p.pos.x, p.pos.y), new PVector(p.currSq.x, p.currSq.y), false));
        if (!p.firstMove)
          Black.get(Black.size()-1).firstMove = false;
      }
        
      else if (p.getClass() == Rook.class)
      {
        Black.add(new Rook(new PVector(p.pos.x, p.pos.y), new PVector(p.currSq.x, p.currSq.y), false));
        if (!p.firstMove)
          Black.get(Black.size()-1).firstMove = false;
      }
      
      else if (p.getClass() == Knight.class)
      {
        Black.add(new Knight(new PVector(p.pos.x, p.pos.y), new PVector(p.currSq.x, p.currSq.y), false));
        if (!p.firstMove)
          Black.get(Black.size()-1).firstMove = false;
      }
    }
    
    //Clear sq pointers
    for(int y = 0; y < 8; y++)
      for(int x = 0; x < 8; x++)
        sq[x][y].piecePointer = null;

    //Set sq pointers
    int x = 0;
    int y = 0;
    for (Piece p : White)
    {
      x = (int)p.currSq.x;
      y = (int)p.currSq.y;
      sq[x][y].piecePointer = p;
    }
    for (Piece p : Black)
    {
      x = (int)p.currSq.x;
      y = (int)p.currSq.y;
      sq[x][y].piecePointer = p;
    }
  }
  
  void render()
  {
    stroke(0);
    strokeWeight(2);
  
    for(int y = 0; y < 8; y++)
    {
      for(int x = 0; x < 8; x++)
      {          
        sq[x][y].render();       
      }
    }
    
    for (Piece p : White)
      p.render();
    
    for (Piece p : Black)
      p.render();
  }
}
