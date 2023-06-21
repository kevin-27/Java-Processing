class City
{
 PVector pos;
 City(float x, float y)
 {
   pos = new PVector(x, y);
 }
 
 void render()
 {
   ellipse(pos.x, pos.y, 8, 8);
 }
}
