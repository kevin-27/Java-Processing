class Food
{
 float x, y;
 
 Food(float x, float y)
 {
   this.x = x;
   this.y = y;
 }
 
 void move()
 {
   x = aline(random(width-16));
   y = aline(random(height-16));
 }
 
 void render()
 {
   fill(255, 0, 0);
   rect(x, y, 16, 16);
 }
}
