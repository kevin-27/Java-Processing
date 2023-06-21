class Grid
{
 Node[][] node;
 Grid()
 {
   node = new Node[width/16][height/16];
   
   for(int x = 0; x < width/16; x++)
      for(int y = 0; y < height/16; y++)
        node[x][y] = new Node(new PVector(x, y));
        
   for (int i = 0; i < 7; i++)
     node[(width/16)/2][i+12].wall = true;
 }
 
 void render()
 {
   fill(0);
   for (int i = 0; i < width / 16; i++)
       line(i * 16, 0, i * 16, height);
       
   for (int i = 0; i < height / 16; i++)
       line(0, i * 16, width, i * 16);
       
   for (int i = 0; i < width / 16; i++)
     for (int p = 0; p < height / 16; p++)
       if (node[i][p].wall)
         rect(i * 16, p * 16, 16, 16);
 }
}
