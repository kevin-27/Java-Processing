ArrayList <Particle> part;
ArrayList <Attractor> att;

void setup()
{
  size(640, 480);

  part = new ArrayList<Particle>();
  att = new ArrayList<Attractor>();

  for (int i = 0; i < 25; i++)
    part.add(new Particle());
}

void update()
{
  for (Attractor a : att)
  {
    for (Particle p : part)
    {
      PVector force = PVector.sub(a.pos, p.pos);
      force.setMag(0.05);
      p.acc.add(force);
    }
  }
}

void draw()
{
  background(0); 

  for (Particle p : part)
    p.render();

  for (Attractor a : att)
    a.render();
    
  update();
}

void mousePressed()
{
  att.add(new Attractor(mouseX, mouseY));
}
