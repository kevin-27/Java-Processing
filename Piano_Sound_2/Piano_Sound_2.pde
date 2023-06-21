import processing.sound.*;

TriOsc triO[];
char button[];
int bNum;
boolean bPressed[];

Env env;

float attackTime = 0.01;
float sustainTime = 0.05;
float sustainLevel = 0.5;
float releaseTime = 0.5;

void setup() {
  size(640, 360);
  background(255);
  
  env  = new Env(this);
  
  bNum = 13;
  button = new char[]{'z', 's', 'x', 'c', 'f', 'v' , 'g', 'b', 'n', 'j', 'm', 'k', ','};
  bPressed = new boolean[bNum];
  
  triO = new TriOsc[bNum];
  for (int i = 0; i < bNum; i++)
  {
    triO[i] = new TriOsc(this);
    triO[i].freq(440 * pow(1.059463, i));
  }
}      

void draw() 
{
  
}

void keyPressed()
{
  for (int i = 0; i < bNum; i++)
  {
   if (key == button[i] && !bPressed[i])
   {
     bPressed[i] = true;
     //triO[i].play();
     env.play(triO[i], attackTime, sustainTime, sustainLevel, releaseTime);
   }
  }
}

void keyReleased()
{
  for (int i = 0; i < bNum; i++)
  {
   if (key == button[i] && bPressed[i])
   {
     bPressed[i] = false;
     //triO[i].stop();
     //triO[i].play();
     //env.play(triO[i], 0.1, 0.1, 0.01, 0.5);
   }
  }
}
