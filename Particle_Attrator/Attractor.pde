class Attractor
{
 PVector pos;
  
 Attractor(float x, float y)
 {
  pos = new PVector(x, y);
 }
 
 void render()
 {
  stroke(0, 255, 0);
  strokeWeight(8);
  point(pos.x, pos.y);
 }
}
