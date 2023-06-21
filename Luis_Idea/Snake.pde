class Snake
{
   CircleObject[] CircleArray;
   int ArraySize = 250;
   
   PVector Vel;

   Snake()
   {
     Vel = new PVector(3, 3);
     CircleArray =  new CircleObject[ArraySize];
     
     for (int i = 0; i < ArraySize; i++)
     {
        CircleArray[i] = new CircleObject(width/2, height/2, 27);
     }
     
     CircleArray[0].Vel = Vel.copy();
     //CircleArray[0].Vel.x =  Vel.x;     
   }
   
   void Update()
   {
     Move();
     Render();    
   }
   
   void Move()
   {
     for (int i = 0; i < ArraySize; i++)
     {
       //float dis = 0;
       PVector dir = new PVector();
       if (i > 0)
       {
         /*dis = Distance(CircleArray[i-1].Pos.x,
                              CircleArray[i-1].Pos.y,
                              CircleArray[i].Pos.x,
                              CircleArray[i].Pos.y);*/
                              
         //if (dis > 100)
         //{
         dir = new PVector(CircleArray[i-1].Pos.x - CircleArray[i].Pos.x,
                           CircleArray[i-1].Pos.y - CircleArray[i].Pos.y);
           
         dir.div(10);
         
         CircleArray[i].Vel = dir.copy();
         //}                            
       }
                            
       //if (dis > CircleArray[0].Radius)
       //{                                          
         //CircleArray[i].Vel = CircleArray[i - 1].Vel.copy();
         //CircleArray[i].Vel = dir.copy();
       //}
     }   
   }
   
   void Render()
   {
     for (int i = 0; i < ArraySize; i++)
     {
        CircleArray[i].Update();
     }
   }
}
