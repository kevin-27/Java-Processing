class Arm
{
 Segment[] seg;
 PVector base;
 Arm(PVector p1, PVector p2)
 {
  base = p1.copy();
  base.y++;
  seg = new Segment[7];
  seg[0] = new Segment(p1, p2);
  seg[0].reduce = seg[0].len;
 
  for (int i = 1; i < seg.length; i++)
   seg[i] = seg[i-1].child(); 
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
 
  seg[0].setAngle(base, seg[0].p1);
  for (int i = 1; i < seg.length; i++)
   seg[i].setAngle(seg[i-1].p1, seg[i-1].p2);
 }
}
