import java.util.Collections;
import java.util.HashSet;

class Pathing
{
  Node node[][];
  int WIDTH, HEIGHT;
  ArrayList<Node> path = new ArrayList<Node>();
  
  Pathing(PVector startPos, PVector targetPos, Node node[][])
  {
    this.node = node;
    
    WIDTH = node.length;
    HEIGHT = node[0].length;
    
    Node startNode = node[(int)startPos.x][(int)startPos.y];
    Node targetNode = node[(int)targetPos.x][(int)targetPos.y];
    
    ArrayList<Node> openSet = new ArrayList<Node>();
    HashSet<Node> closedSet = new HashSet<Node>();
    openSet.add(startNode);
    
    while (openSet.size() > 0)
    {
      Node currentNode = openSet.get(0);
      
      for (int i = 0; i < openSet.size(); i ++)
      {
        if (openSet.get(i).getFcost() < currentNode.getFcost() 
        || openSet.get(i).getFcost() == currentNode.getFcost() 
        && openSet.get(i).Hcost < currentNode.Hcost)
        {
          currentNode = openSet.get(i);
        }
      }
      
      openSet.remove(currentNode);
      closedSet.add(currentNode);
      
      if (currentNode == targetNode)
      {
        RetracePath(startNode, targetNode);
        return;
      }
      
      for (Node neighbour : getNeighbours(currentNode))
      {
        if (neighbour.wall || closedSet.contains(neighbour))
        {
          continue;
        }
        
        int newMoveCostToNeighbour = currentNode.Gcost + getDistance(currentNode, neighbour);
        if (newMoveCostToNeighbour < neighbour.Gcost || !openSet.contains(neighbour))
        {
          neighbour.Gcost = newMoveCostToNeighbour;
          neighbour.Hcost = getDistance(neighbour, targetNode);
          neighbour.parent = currentNode;
          
          if (!openSet.contains(neighbour))
            openSet.add(neighbour);
        }
      }
    }
  }
  
  ArrayList<Node> getPath()
  {
    return path;
  }
  
  void RetracePath(Node startNode, Node targetNode)
  {
    Node currentNode = targetNode;
    while (currentNode != startNode)
    {
      path.add(currentNode);
      currentNode = currentNode.parent;
    }
    Collections.reverse(path);
  }
  
  int getDistance(Node nodeA, Node nodeB)
  {
    int dstX = (int)Math.abs(nodeA.cord.x - nodeB.cord.x);
    int dstY = (int)Math.abs(nodeA.cord.y - nodeB.cord.y);
    
    if (dstX > dstY)
      return 14 * dstY + 10 * (dstX - dstY); 
    
    return  14 * dstX + 10 * (dstY - dstX); 
  }
  
  ArrayList<Node> getNeighbours(Node curnode)
  {
    ArrayList<Node> neighbours = new ArrayList<Node>();
    
    for (int x = -1; x <= 1; x++)
    {
      for (int y = -1; y <= 1; y++)
      {
        if (x == 0 && y == 0)
          continue;
        
        int checkX = (int)curnode.cord.x + x;
        int checkY = (int)curnode.cord.y + y;
        
        if (checkX >= 0 && checkY >= 0
              && checkX < WIDTH && checkY < HEIGHT)
        {
          neighbours.add(node[checkX][checkY]);
        }
      }
    }
    return neighbours;
  }
}
