class Piece
{
 int s;
 PVector pos;
 PVector currSq;
 boolean Color;
 boolean firstMove;
 boolean enPassant;
 
 ArrayList <PVector> moves;
 
 Piece(PVector pos, PVector currSq, boolean Color)
 {
   this.pos = pos.copy();
   this.currSq = currSq.copy();
   s = 64;
   this.Color = Color;
   moves = new ArrayList<PVector>();
   firstMove = true;
   enPassant = false;
 }
 
 void possibleMoves(Square sq[][])
 {
    
 }
 
 void removeKingMoves(Square sq[][])
 { 
    
 }
 
 void addCastlingMoves(Square sq[][])
 {
   
 }
 
 void addAttacks(Square sq[][])
 {
  //Add attacks to board    
    int x = 0;
    int y = 0;
    for (PVector m : moves)
    {
      x = (int)m.x;
      y = (int)m.y;
            
      if (Color)
        sq[x][y].isAttackedW++;
      else
        sq[x][y].isAttackedB++;     
    } 
 }
 
 void removeFriendlyFire(Square sq[][])
 {
  //Remove moves on own pieces
  int x = 0;
  int y = 0;
  for (int i = 0; i < moves.size(); i++)
  {
    x = (int)moves.get(i).x;
    y = (int)moves.get(i).y;
    if (sq[x][y].piecePointer != null &&
        sq[x][y].piecePointer.Color == Color)
    {
      moves.remove(i);
      i--;
    }
  }   
 }
 
 void removeOutOfBounds()
 {
    //Removes out of bounds moves
    for (int i = 0; i < moves.size(); i++)
    {      
      if (moves.get(i).x < 0 || moves.get(i).x > 7 ||
          moves.get(i).y < 0 || moves.get(i).y > 7)
      {
        moves.remove(i);
        i--;
      } 
    }
 }
 
 boolean checkMoves(PVector target)
 {
   for (PVector m : moves)
   {
     if (target.x == m.x && target.y == m.y)
       return true;
   }
   //println("cant move");
   return false; 
 }  
 
 void render()
 {    
   fill(255, 255, 0);
 }
}
