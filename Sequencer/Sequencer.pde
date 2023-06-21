import ddf.minim.*;
import ddf.minim.ugens.*;

Minim minim;
AudioOutput out;

Sequence seq;

boolean keyW, keyA, keyS, keyD, enter, shift;

void setup()
{
  size(640, 464);
  
  minim = new Minim(this);
  out = minim.getLineOut();
  
  seq = new Sequence();
}

void update()
{
  seq.update();
}

void draw()
{
  background(0);
  
  seq.render();
  update();
}

Note randomNote()
{
 float f = 220;
 float s = 0;
 float d = 1;
 return new Note(f, s, d);
}

void keyPressed()
{
  if (key == 'p')
    seq.play();
    
  if (keyCode == ENTER)
    enter = true;
  if (keyCode == SHIFT)
    shift = true;
    
  if(key == 'w')
    keyW = true;
  if(key == 'a' || key == 'A')
    keyA = true;
  if(key == 's')
    keyS = true;
  if(key == 'd' || key == 'D')
    keyD = true;
}

void keyReleased()
{
  if (keyCode == ENTER)
    enter = false;
  if (keyCode == SHIFT)
    shift = false;
  
  if(key == 'w')
    keyW = false;
  if(key == 'a' || key == 'A')
    keyA = false;
  if(key == 's')
    keyS = false;
  if(key == 'd' || key == 'D')
    keyD = false;
}
