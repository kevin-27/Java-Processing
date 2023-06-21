class Branch
{
  float less;
  PVector a, b;
  int baseL;
  int parentID;
  Branch(PVector a, PVector b, int parentID)
  {
    this.a = a;
    this.b = b;
    this.parentID = parentID;
    less = 0.7;
    baseL = (int)PVector.dist(a, b);
  }
  
  void setAngle(PVector newA, float angle)
  {
    
    PVector dir = PVector.sub(b, a);
    a = newA;
    dir.rotate(PI/angle);
    b = PVector.add(a, dir);
  }
  
  void draw()
  {
   line(a.x, a.y, b.x, b.y); 
  }
  
  Branch branch(boolean bool, float angle, int parentID)
  {
    PVector dir = PVector.sub(b, a);
    if (bool)
      dir.rotate(PI/angle);
     else
      dir.rotate(-(PI/angle));
    dir.mult(less);
    PVector newEnd = PVector.add(b, dir);
    
    Branch branch =  new Branch(b, newEnd, parentID);
    return branch;
  }
}
