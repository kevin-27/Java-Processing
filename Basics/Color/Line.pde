class Line
{
 PVector pos1, pos2;
 color col;
 
 Line(PVector p1, PVector p2, color c)
 {
  pos1 = p1;
  pos2 = p2;
  col = c;
 }
 
 void render()
 {
  stroke(col);
  strokeWeight(10);
  line(pos1.x, pos1.y, pos2.x, pos2.y);
 }
}
