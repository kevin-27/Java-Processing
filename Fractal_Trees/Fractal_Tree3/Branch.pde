class Branch
{
  //float angle;
  float less;
  PVector a, b;
  int baseL;
  Branch(PVector a, PVector b)
  {
    this.a = a;
    this.b = b;
    //angle = 5.75;
    less = 0.7;
    baseL = (int)PVector.dist(a, b);
  }
  
  void setAngle(float angle)
  {
    PVector dir = PVector.sub(b, a);
    
    dir.rotate(PI/angle);

    b = PVector.add(a, dir);
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
