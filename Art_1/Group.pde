class Group
{
 int s = 0;
 Dot dot[];
 Dot dotOrigin[];
 ArrayList <PVector[]> Line;
 color Color[];
 
 
 Group()
 {
  float angle = TWO_PI + PI;
  int count = 0;
  int pointsArray[] = new int[] {13};
  int numOfshapes = pointsArray.length;
  float r = width/2.1;
  for (int p : pointsArray)
    s += p;
    
  dot = new Dot[s];
  dotOrigin = new Dot[s];
  
  Color = new color[s];
  //for (int i = 0; i < s; i++) 
    //Color[i] = color(random(255), random(255), random(255), 225);
    //Color[i] = color(255 - (255/s)*i, 132 + (255/s)*i, (255/s)*i);
  for (int i = s/2; i < s; i++)
   Color[i] = color(0, (255/s*2)*(i-s/2), 255 - (255/s*2)*(i-s/2), 132);

  int counter = 1;
  for (int i = s/2; i >= 0; i--)
  {
   Color[i] = color(0, (255/s*2)*counter, 255 - (255/s*2)*counter, 132);
   counter++;
  }
  
  for (int n = 0; n < numOfshapes; n++)
  {
   for (int i = 0; i < pointsArray[n]; i++)
   {
    //dot[i] = new Dot(random(width), random(height));
    float x = width/2 + sin(angle) * r;
    float y = height/2 + cos(angle) * r;
    
    dot[count] = new Dot(x, y);
    
    if (pointsArray[0] == 1)
      dot[0] = new Dot(width/2, height/2);
      
    dot[count].pos.set(random(width), random(height));
                     
    angle -= TWO_PI/(pointsArray[n]);
    count++;
   }
   //if (n > 0)
     r *= 1.5;
   angle = TWO_PI + PI;
  }
  
  //if (pointsArray[0] == 1)
  //{
  //  dot[0].pos.set(width/2, height/2);
  //  //dotOrigin[0].pos.set(width/2, height/2);
  //}
    
  Line = new ArrayList<PVector[]>(); 
  Connect();
 }
 
 void Connect()
 {
  int count = 0;
  for (Dot d : dot)
  {
   for (Dot d2 : dot)
   {
    if (d2 != d)
    {
     Line.add(new PVector[2]);
     Line.get(count)[0] = new PVector();
     Line.get(count)[1] = new PVector();
     Line.get(count)[0].set(d.pos);
     Line.get(count)[1].set(d2.pos);
     count++; 
    }
   }
  }
 }
 
 void update()
 {
  int count = 0;
  for (Dot d : dot)
  {
   for (Dot d2 : dot)
   {
    if (d2 != d)
    {
     Line.get(count)[0].set(d.pos);
     Line.get(count)[1].set(d2.pos);
     count++; 
    }
   }
  } 
 }
 
 void Origin()
 {
  for (int i = 0; i < s; i++)
  {
   //dot[i].pos.set(dotOrigin[i].pos); 
   //PVector target = PVector.sub(dotOrigin[i].pos, dot[i].pos);
   //dot[i].seekTarget();
   dot[i].back = !dot[i].back;
   dot[i].timer = millis() + 500;
   dot[i].num = 0.125;
  }
 }
 
 void Remove()
 {
  for (PVector[] l : Line)
  {
   for (PVector[] l2 : Line)
   {
    
   }
  }
 }
 
 void render()
 {
  strokeWeight(3);
  update();
  
  int count = 0;
  for (PVector[] l : Line)
  {
    stroke(Color[count]);
    //stroke(255, 255);
    count++;
    if (count >= s)
      count = 0;
    line(l[0].x, l[0].y, l[1].x, l[1].y);
  }
  
  for (Dot d : dot)
    d.render();
 }
}
