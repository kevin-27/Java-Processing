class Branch
{
  int lenght;
  PVector a, b;
  boolean grown;
  float angle;
  float less;

  Branch(PVector a, PVector b)
  {
    this.a = a;
    this. b = b;
    grown = false;
    lenght = (int)PVector.dist(a, b);
    
    angle = 5.75;
    less = 0.7;
  }
  
  void draw()
  {
    line(a.x, a.y, b.x, b.y);
  }
  
  Branch branchA()
  {
    PVector dir = PVector.sub(b, a);
    dir.rotate(PI/angle);
    dir.mult(less);
    PVector newEnd = PVector.add(b, dir);
    
    Branch branch =  new Branch(b, newEnd);
    return branch;
  }
  
  Branch branchB()
  {
    PVector dir = PVector.sub(b, a);
    dir.rotate(-(PI/angle));
    dir.mult(less);
    PVector newEnd = PVector.add(b, dir);
    
    Branch branch =  new Branch(b, newEnd);
    return branch;
  }
}
