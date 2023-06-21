class Branch
{
  float less;
  PVector a, b;
  int baseL;
  Branch(PVector a, PVector b)
  {
    this.a = a;
    this.b = b;
    less = 0.7;
    baseL = (int)PVector.dist(a, b);
  }
  
  void draw()
  {
   line(a.x, a.y, b.x, b.y); 
  }
  
  Branch branch(boolean bool, float angle)
  {
    PVector dir = PVector.sub(b, a);
    if (bool)
      dir.rotate(PI/angle);
     else
      dir.rotate(-(PI/angle));
    dir.mult(less);
    PVector newEnd = PVector.add(b, dir);
    
    Branch branch =  new Branch(b, newEnd);
    return branch;
  }
}
