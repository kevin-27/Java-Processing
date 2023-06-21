PVector pos;
int s;
int left, right, up, down;
boolean bleft, bright, bup, bdown;

void setup()
{
 size(480, 480);
 s = 64;
 pos = new PVector((width/2)-(s/2), (height/2)-(s/2));
 Reset();
}

void draw()
{
  background(0);
  strokeWeight(4);
  stroke(0);
  
  //Reset();
  //KeyInput();
  ChangeColor();
  
  fill(down);
  rect(pos.x, pos.y, s, s);
  fill(up);
  rect(pos.x, pos.y-s, s, s);
  fill(left);
  rect(pos.x-s, pos.y, s, s);
  fill(right);
  rect(pos.x+s, pos.y, s, s);
}

void keyPressed()
{
 if (key == 'a')
   bleft = true;
 if (key == 'd')
   bright = true;
 if (key == 'w')
   bup = true;
 if (key == 's')
   bdown = true;
}

void Reset()
{
 bleft = false;
 bright = false;
 bup = false;
 bdown = false; 
}

void ChangeColor()
{
 if (bleft)
   left = 75;
 else 
   left = 255;
 if (bright)
   right = 75;
 else 
   right = 255;
 if (bup)
   up = 75;
 else 
   up = 255;
 if (bdown)
   down = 75;
 else 
   down = 255;
}

void keyReleased()
{
 if (key == 'a')
   bleft = false;
 if (key == 'd')
   bright = false;
 if (key == 'w')
   bup = false;
 if (key == 's')
   bdown = false;
}
