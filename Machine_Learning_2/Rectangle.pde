class Rectangle
{
  PVector pos;
  PVector size;
  color hue;
  
  Rectangle(int x, int y, int w, int h, color c)
  {
    pos = new PVector(x, y);
    size = new PVector(w, h);
    hue = c;
  }
  
  void show()
  {
    fill(hue);
    rect(pos.x, pos.y, size.x, size.y);
  }
}
