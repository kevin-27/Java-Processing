class Selector
{
  PVector pos;
  float w, h;
  
  Selector(float x, float y, float w, float h)
  {
    pos = new PVector(x, y);
    this.w = w;
    this.h = h;
  }
  
  void update()
  {
    if (keyW)
    {
      pos.y += -h;
      keyW = false;
    }
    if (keyS)
    {
      pos.y += h;
      keyS = false;
    }
    if (keyA && shift)
    {
      if (w > 8)
        w -= 8;
      keyA = false;
    }
    else if (keyA)
    {
      pos.x += -w;
      keyA = false;
    }
    if (keyD && shift)
    {
      w += 8;
      keyD = false;
    }
    else if (keyD)
    {
      pos.x += w;
      keyD = false;
    }
  }
  
  boolean rectIntersect(float X2, float Y2, float W2, float H2)
  {
    if ((pos.x < X2 + W2) &&
        (pos.y < Y2 + H2) &&
        (X2 < pos.x + w) &&
        (Y2 < pos.y + h))
    {
        return true;
    }
    
    return false;
  }
  
  void render()
  {
    noFill();
    stroke(0, 255, 0);
    strokeWeight(3);
    rect(pos.x,pos.y, w, h);
  }
}
