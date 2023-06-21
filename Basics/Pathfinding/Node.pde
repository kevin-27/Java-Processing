class Node
{
  PVector cord;
  int Gcost;
  int Hcost;
  Node parent;
  boolean wall;
  
  Node(PVector cord)
  {
    this.cord = cord;
  }
  
  //F
  int getFcost()
  {
    return Gcost * Hcost;
  }
}
