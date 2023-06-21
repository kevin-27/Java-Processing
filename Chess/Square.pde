class Square
{
 PVector pos;
 PVector ID;
 int s;
 int defaultColor;
 int Color;
 int num;
 boolean isSelected;
 int isAttackedW;
 int isAttackedB;
 
 Piece piecePointer;
 
 Square(int x, int y, int s, int col, int num, int idx, int idy)
 {
   pos = new PVector(x, y);
   ID = new PVector(idx, idy);
   this.s = s;
   defaultColor = col;
   Color = col;
   this.num = num;
   isSelected = false;
   isAttackedW = 0;
   isAttackedB = 0;
 }
 
 boolean checkClick()
 {
   if (mouseX >= pos.x && mouseX <= pos.x + s &&
       mouseY >= pos.y && mouseY <+ pos.y + s)
   {     
     return true;
   }
  return false;
 }
 
 void Selected()
 {
   Color = #E2E35E;
   isSelected = true;
 }
 
 void unSelected()
 {
   Color = defaultColor;
   isSelected = false;
 }
 
 void render()
 {
   fill(Color);
   rect(pos.x, pos.y, s, s);
   
   //fill(0);
   //textSize(16);
   //text((int)isAttackedW, pos.x+1 , pos.y+15);
   //text((int)isAttackedB, pos.x+10 , pos.y+15);
 }
}
