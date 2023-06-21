class Arm
{
 Segment[] seg;
 PVector base;
 Arm(PVector p1, PVector p2)
 {
  base = p1.copy();
  base.y++;
  seg = new Segment[9];
  seg[0] = new Segment(p1, p2);
  seg[0].reduce = seg[0].len;
 
  for (int i = 1; i < seg.length; i++)
   seg[i] = seg[i-1].child(); 
 }
 
 void update()
 {
  seg[seg.length-1].follow(mouseX, mouseY);
  for (int i = seg.length-2; i >= 1; i--)
    seg[i].follow(seg[i+1].p1.x, seg[i+1].p1.y);
  
  seg[0].baseFollow(seg[1].p1.x, seg[1].p1.y);
  for (int i = 1; i < seg.length; i++)
    seg[i].setBack(seg[i-1].p2.x, seg[i-1].p2.y); 
 }
 
 void render()
 {
  int weight = seg.length+1;
  strokeWeight(weight);
  for (int i = 0; i < seg.length; i++)
  {
   strokeWeight(weight);
   weight--;
   seg[i].render();
  }
  update();
 }
}
