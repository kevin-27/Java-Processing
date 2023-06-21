class Sequence
{
 PVector pos;
 ArrayList <Box> box[];
 ArrayList <Note> note;
 int noteCount;
 int mCount;
 int xOff;
 
 Selector sel;
 
 String noteName[] = {"Bb", "B", "C", "Db", "D", 
                     "Eb", "E", "F", "Gb", "G", "Ab", "A"};
 
 Sequence()
 {
   note = new ArrayList<Note>();
   box = new ArrayList[25];
   for (int i = 0; i < box.length; i++)
     box[i] = new ArrayList<Box>();
   
   for (int i = 0; i < box.length; i++)
     for (int p = 0; p < 4; p++)
     {
       int len = 32;
         box[i].add(new Box(32+p*len, 32+i*16, len, 16));
     }
   
   Box b = box[0].get(0);
   sel = new Selector(b.pos.x, b.pos.y, b.w, b.h);
 }
 
 void addMeasure()
 {
   for (int i = 0; i < box.length; i++)
   {
     int len = 32; //(32*5)+mCount*len
     int temp = box[i].size()-1;
       box[i].add(new Box(box[i].get(temp).pos.x+32, 32+i*16, len, 16));
   }
   mCount += 1;
 }
 
 void play()
 {
  //note.clear();
  out.setTempo(90);
  out.pauseNotes();
  
  for (int i = 0; i < note.size(); i++)
  {
    float f = note.get(i).freq;
    float s = note.get(i).start;
    float d = note.get(i).dur;
    out.playNote(s, d, new Tri(f, 0.5));
  }
  
  out.resumeNotes();
 }
 
 void update()
 {
   AddRemoveNote();
   sel.update();
   
   if (sel.pos.y > height - 32-1)
     sel.pos.y += -16;
   else if (sel.pos.y < 32-1)
     sel.pos.y += 16;
   
   if (sel.pos.x > width - 32-1)
   {
    xOff += 32;
    sel.pos.x += -32;
    for (int i = 0; i < box.length; i++)
      for (Box b : box[i])
        b.pos.x += - 32;
        
    for (Note n : note)
      n.pos.x += -32;
   }
   
   if (sel.pos.x < 32-1)
   {
    sel.pos.x += 32;
    
    if (box[0].get(0).pos.x < 32)
    {
      xOff += -32;
      for (int i = 0; i < box.length; i++)
        for (Box b : box[i])
          b.pos.x += 32;
      
      for (Note n : note)
        n.pos.x += 32;
    }
   }
   
   if (sel.pos.x > box[0].get(box[0].size()-1).pos.x+32-1)
     addMeasure();
 }
 
 void AddRemoveNote()
 {
  boolean add = true;
   if (enter)
   {
     //remove note
     for (Note n : note)
     {
      if (sel.rectIntersect(n.pos.x, n.pos.y, n.w, n.h))
      {
        note.remove(n);
        add = false;
        enter = false; 
        break;
      }
     }
     
     if (add)
     {
       //add note
       float f = 110 * pow(1.059463, 24-(sel.pos.y - 32)/16);
       float s = (sel.pos.x - 32+xOff)/32; //this 32 needs to be var
       float d = sel.w/32;
       float posx = sel.pos.x;
       float posy = sel.pos.y;
       note.add(new Note(f, s, d, posx, posy));
       enter = false;
     }
   }
 }
 
 boolean checkIfNote(float x, float y)
 {
   for (Note n: note)
     if (n.intersect(x, y))
       return true;
       
   return false;
 }
 
 void render()
 {
   for (Note n : note)
     if(n.pos.x >= 32 && n.pos.x <= width - 32-1)
       n.render();
   
   for (int i = 0; i < box.length; i++)
     for (Box b : box[i])
       if(b.pos.x >= 32 && b.pos.x <= width - 32-1)
         b.render();
   
   fill(255);
   int temp = 1;  
   for (Box b : box[0])
   {
     if(b.pos.x >= 32 && b.pos.x <= width - 32-1)
       text(temp, b.pos.x+15, b.pos.y-1);
     temp++;
   }
   
   int count = 11;
   for (int i = 0; i < box.length; i++)
   {
     text(noteName[count], 10, 48+(i*16));
     count--;
     if (count < 0)
       count = 11;
   }
   
   stroke(0, 0, 255);
   strokeWeight(2);
   line(32, 0, 32, height);
   line(0, 32, width, 32);
   line(width - 32, 0, width - 32, height);
   line(0, height - 32, width, height - 32);
   
   sel.render();
 }
}
