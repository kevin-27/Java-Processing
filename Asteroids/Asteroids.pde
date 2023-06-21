Ship ship;
ArrayList <Rock> rocks = new ArrayList();
int score = 0;
int rockNum = 3;

float num;
boolean left, right, up, shoot;
boolean paused = true;

void setup()
{
 size(720, 480);
 background(0);
 
 ship = new Ship();
 Initiz();
}

void Initiz()
{
  float x = 0;
  float y = 0;
  int alt = 0;
  for (int i = 0; i < rockNum; i++)
  {
   alt = -1 + (int)random(2) * 2;
   x = width/2 + random(48, width/2)*alt;
   alt = -1 + (int)random(2) * 2;
   y = height/2 + random(48, height/2)*alt;
   
   rocks.add(new Rock(x, y, 50, 
   new PVector(random(-1, 1), random(-1, 1)), 1));
  }
}

void update()
{
  if (!paused)
  {
    gameUpdate();
  }
  textUI();
}

void draw()
{
 background(0);
 
 ship.render();
 for (int i = 0; i < rocks.size(); i++)
   rocks.get(i).render();
 
 update();
}

void keyPressed()
{
 if (key == 'a')
   left = true;
 if (key == 'd')
   right = true;
 if (key == 'w')
   up = true;
 if (key == ' ' || key == '1')
   shoot = true;
}

void keyReleased()
{
 if (key == 'a')
   left = false;
 if (key == 'd')
   right = false;
 if (key == 'w')
   up = false;
 if (key == ' ' || key == '1')
   shoot = false;
 if (keyCode == ENTER)
 {
   ship.resetD();
   paused = false;
 }
}
