class Box
{
 PVector pos;
 boolean note;
 float w, h;
 boolean isPressed;
 
 Box(float x, float y, float w, float h)
 {
   pos = new PVector(x, y);
   this.w = w;
   this.h = h;
   isPressed = false;
 }
 
 void update(float x, float y)
 {
   
 }
 
 boolean leftClick(float x, float y)
 {
   if (!isPressed)
     if (intersect(x, y))
     {
       isPressed = true;
       //note = !note;
       return true;
     }
   return false;
 }
 
 boolean intersect(float x, float y)
 {
   if (x > pos.x && x < pos.x + w
       && y > pos.y && y < pos.y + h)
         return true;
   
   return false;
 }
 
 void render()
 {
   stroke(255);
   strokeWeight(1);
   if (!note)
     noFill();
   else
     fill(0, 255, 0);
   
   rect(pos.x, pos.y, w, h);
 }
}
