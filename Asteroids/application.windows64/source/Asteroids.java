import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Asteroids extends PApplet {

Ship ship;
ArrayList <Rock> rocks = new ArrayList();
int score = 0;
int rockNum = 3;

float num;
boolean left, right, up, shoot;
boolean paused = true;

public void setup()
{
 
 background(0);
 
 ship = new Ship();
 Initiz();
}

public void Initiz()
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

public void update()
{
  if (!paused)
  {
    gameUpdate();
  }
  textUI();
}

public void draw()
{
 background(0);
 
 ship.render();
 for (int i = 0; i < rocks.size(); i++)
   rocks.get(i).render();
 
 update();
}

public void keyPressed()
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

public void keyReleased()
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
class Gun
{
 PVector pos;
 Laser[] laser;
 int Lnum;
 int next;
 long timer;
 
 Gun(PVector pos)
 {
   this.pos = new PVector();
   this.pos.set(pos);
   Lnum = 10;
   laser = new Laser[Lnum];
   for (int i = 0; i < Lnum; i++)
     laser[i] = new Laser(pos);
   
   timer = System.currentTimeMillis();
 }
 
 public void update(PVector pos)
 {
   this.pos.set(pos);
   for (Laser n : laser)
     n.update(pos);
 }
 
 public void reset()
 {
  for (Laser l : laser)
    l.reset();
 }
 
 public void shoot(PVector force)
 {
   if (timer + 250 < System.currentTimeMillis())
   {
     timer = System.currentTimeMillis();
     if (!laser[next].fired)
     {
      laser[next].shoot(force);
     
      next++;
      if (next > Lnum-1)
      {
        //println("test");
        next = 0;
      }
     }
   }
 }
 
 public void render()
 {
   for (Laser n : laser)
     n.render();
 }
}
class Laser
{
 PVector pos;
 PVector dis;
 PVector vel;
 boolean fired;
 float maxDis;
 
 Laser(PVector pos)
 {
   maxDis = 1000;
   vel = new PVector();
   dis = new PVector();
   this.pos = new PVector();
   this.pos.set(pos);
 }
 
 public void reset()
 {
  fired = false;
  dis = new PVector();
 }
 
 public boolean intersects(PVector rockPos, float Di)
 {
   float diffX = rockPos.x - pos.x;
   float diffY = rockPos.y - pos.y;
   float distance = (float)Math.sqrt((diffX * diffX) + (diffY * diffY));
   
   if (distance <= Di)  
     return true;
   else
     return false;
 }
 
 public void update(PVector pos)
 {
   if (maxDis < Math.abs(dis.x) + Math.abs(dis.y))
     reset();
     
   if (fired)
   {
     this.pos.add(vel);
     dis.add(vel);
   }
   else
     this.pos.set(pos);
     
   bounds();
 }
 
 public void bounds()
  {
   if (pos.x < 0)
     pos.x = width;
   else if (pos.y < 0)
     pos.y = height;
   else if (pos.x > width)
     pos.x = 0;
   else if (pos.y > height)
     pos.y = 0;
  }
 
 public void shoot(PVector force)
 {
   fired = true;
   vel.set(force.mult(20));
 }
 
 public void render()
 {
   strokeWeight(3);
   point(pos.x, pos.y);
 }
}
public void gameUpdate()
{
 if (rocks.size() == 0)
 {
  println("Next Level");
  rockNum++;
  Initiz();
  ship.resetN();
  paused = true;
 }
 
 for (Rock r : rocks)
   r.update();
   
 ship.update();
 
 //Ship Collision
 for (Rock r : rocks)
 {
  if (ship.intersects(r.pos, r.di) && !ship.destroyed)
  {
   ship.destroyed();
   //ship.reset(); 
  }
 }
 //Laser Collision
 for (Laser l : ship.gun.laser)
 {
   for (Rock r : rocks)
   {
     if (l.fired && l.intersects(r.pos, r.di))
     {
       switch (r.gen)
       {
         case 1 : score += 20; break;
         case 2 : score += 50; break;
         case 3 : score += 100; break;
       }
       l.reset();
       
       if (r.gen < 3)//(r.di/2 > 50/4)
       {
         PVector force = new PVector();
         force.set(r.vel);
         force.mult(1.25f);
         
         rocks.add(new Rock(r.pos.x, r.pos.y, r.di/2, force.rotate(PI*random(1)), r.gen+1));
         rocks.add(new Rock(r.pos.x, r.pos.y, r.di/2, force.rotate(PI*random(1)), r.gen+1));
       }
       rocks.remove(r);
       break;
     }
   }
 }
}

public void textUI()
{
 textSize(16);
 text("Lives = " + ship.lives, 16, 16);
 text("Score = " + score, 264, 16);
 if (ship.lives <= 0)
 {
   textSize(32);
   text("You Lose", (width/2)-64, height/2-64);
 }
}

class Rock
{
 PVector pos;
 PVector vel;
 float di;
 int[] shape;
 int Nsides;
 int gen;
 
 Rock(float x, float y, float di, PVector vel, int gen)
 {
   this.di = di;
   pos = new PVector(x, y);
   this.vel = new PVector();
   this.vel.set(vel);
   this.gen = gen;
   
   Nsides = (int)random(8, 17);
   shape = new int[Nsides+1];
   for (int i = 0; i <= Nsides; i++)
     shape[i] = (int)random(-di/3, di/3);
     //shape[i] = 0;
 }
 
 public void update()
 {
  pos.add(vel); 
  bounds();
 }
 
  public void bounds()
  {
   if (pos.x < -di/2)
     pos.x = width;
   else if (pos.y < -di/2)
     pos.y = height;
   else if (pos.x > width+(di/2))
     pos.x = 0;
   else if (pos.y > height+(di/2))
     pos.y = 0;
  }
  
  public void RandomShape()
  {
   beginShape();
   PVector firstV = new PVector();
   for (int i = 0; i <= Nsides; i++)
   {
    float angle = map(i, 0, Nsides, 0, TWO_PI);
    float temp = di+shape[i];
    //float temp = s;
    float x = (temp*cos(angle))+pos.x;
    float y = (temp*sin(angle))+pos.y;
    
    //x += shape[i];
    //y += shape[i];
    
    if (i == 0)
      firstV.set(x, y);
    
    if (i == Nsides)
      vertex(firstV.x, firstV.y);
    else
      vertex(x, y);
   }
   endShape();
  }
 
 public void render()
 {
   noFill();
   strokeWeight(1);
   //ellipse(pos.x, pos.y, s, s);
   RandomShape();
 }
}
class Ship
{
  PVector a, b, c;
  PVector vel;
  PVector pos;
  float rotation;
  boolean destroyed;
  float acc;
  int lives;
  int s;
  
  Gun gun;
    
  Ship()
  {
   s = 6;
   lives = 3;
   acc = 0.1f;
   rotation = 0;
   vel = new PVector(0, 0);
   pos = new PVector(width/2, height/2);
   a = new PVector(pos.x, pos.y-(s*2));
   b = new PVector(pos.x-s, pos.y+s);
   c = new PVector(pos.x+s, pos.y+s);
   
   gun = new Gun(pos);
  }
  
  public void resetD()
  {
   if (ship.destroyed && ship.lives > 0)
   {
     pos.set(width/2, height/2);
     gun.reset();
     vel.set(0, 0);
     destroyed = false;
   }
  }
  
  public void resetN()
  {
   pos.set(width/2, height/2);
   gun.reset();
   vel.set(0, 0);
   destroyed = false;
   rotation = 0;
  }
  
  public void destroyed()
  {
   lives--;
   destroyed = true; 
  }
  
  public boolean intersects(PVector rockPos, float Di)
  {
   float diffX = rockPos.x - pos.x;
   float diffY = rockPos.y - pos.y;
   float distance = (float)Math.sqrt((diffX * diffX) + (diffY * diffY));
   
   if (distance <= Di)  
     return true;
   else
     return false;
  }
  
  public void update()
  {
    if (!destroyed)
    {
      if (left)
        rotation += -0.075f;
      if (right)
        rotation += 0.075f;
      if (up)
      {
        PVector force = PVector.fromAngle(rotation-HALF_PI);
        force.mult(acc);
        vel.add(force);
      }
      if (shoot)
      {
       PVector force = PVector.fromAngle(rotation-HALF_PI);
       force.mult(0.25f);
       gun.shoot(force);
       //println("fired");
      }
      
      pos.add(vel);
      move();
      bounds();
      vel.mult(0.99f);
      
      gun.update(pos);
    }
  }
  
  public void turn()
  {
   a.set(Rotate(a, pos, rotation));
   b.set(Rotate(b, pos, rotation));
   c.set(Rotate(c, pos, rotation));
  }
  
  public PVector Rotate(PVector P1, PVector P2, float angle)
  {
    PVector dir = PVector.sub(P1, P2);
    dir.rotate(angle);
    return PVector.add(P2, dir);
  }
  
  public void move()
  {
   a.set(pos.x, pos.y-(s*2));
   b.set(pos.x-s, pos.y+s);
   c.set(pos.x+s, pos.y+s);
   turn();
  }
  
  public void bounds()
  {
   if (pos.x < -s/2)
     pos.x = width;
   else if (pos.y < -s/2)
     pos.y = height;
   else if (pos.x > width+(s/2))
     pos.x = 0;
   else if (pos.y > height+(s/2))
     pos.y = 0;
  }
 
  public void render()
  {
   if (!destroyed)
   {
     noFill();
     stroke(255);
     strokeWeight(1);
     triangle(a.x, a.y, b.x, b.y, c.x, c.y);
     gun.render();
   }
   else
     ellipse(width/2, height/2, s*4, s*4);
  }
}
  public void settings() {  size(720, 480); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Asteroids" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
