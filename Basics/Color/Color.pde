color col[];
Line lines[];
int s = 64;

void setup()
{
 size(640, 320);
 col = new color[s];
 for (int i = s/2; i < s; i++)
   col[i] = color(500 - (255/s*2)*(i-s/2), (255/s/2)*(i-s/2)*8, 0);
   
 int count = 0;
 for (int i = s/2; i >= 0; i--)
 {
   col[i] = color(500 - (255/s*2)*count, (255/s/2)*count*8, 0);
   count++;
 }
   
 lines = new Line[s];
 for (int i = 0; i < s; i++)
   lines[i] = new Line(new PVector(4+width/2 - s*5 + i*10, 0),
                       new PVector(4+width/2 - s*5 + i*10, height),
                       col[i]);
}


void draw()
{
 background(0);
 
 for (Line l : lines)
   l.render();
}
