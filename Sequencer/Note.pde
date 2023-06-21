class Note
{
 float freq;
 float dur;
 float start;
 PVector pos;
 float w, h;
 
 Note(float freq, float start, float dur, float x, float y)
 {
   this.freq = freq;
   this.dur = dur;
   this.start = start;
   pos = new PVector(x, y);
   w = dur*32;
   h = 16;
 }
 
 Note(float freq, float start, float dur)
 {
   this.freq = freq;
   this.dur = dur;
   this.start = start;
   w = dur*32;
   h = 16;
   float x = 0; 
   float y = 0;
   pos = new PVector(x, y);
 }
 
 void render()
 {
  noStroke();
  fill(255, 0, 0);
  rect(pos.x, pos.y, w, h);
 }
 
 boolean intersect(float x, float y)
 {
   if (x > pos.x && x < pos.x + w
       && y > pos.y && y < pos.y + h)
         return true;
   
   return false;
 }
}
