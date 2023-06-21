class Seg
{
 float x, y;
 int w, h;
 
 Seg(float x, float y)
 {
   this.x = x;
   this.y = y;
   w = 16;
   h = 16;
 }
 
 void render()
 {
   fill(255);
   rect(x, y, w, h);
 }
}
