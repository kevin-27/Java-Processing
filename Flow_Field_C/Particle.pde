class Particle
{
  PVector pos, vel, acc, previousPos;
  float maxSpeed;
  Particle()
  {
    pos = new PVector(random(1, width-1), 
                      random(1, height-1));
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    maxSpeed = random(2, 8);
    previousPos = pos.copy();
  }
  
  /*void update(PVector flow)
  {
    vel.add(flow);
    vel.limit(1);
    pos.add(vel);
    bounds();
  }*/
  
  void update() {
    pos.add(vel);
    vel.limit(maxSpeed);
    vel.add(acc);
    acc.mult(0);
    bounds();
  }
  void applyForce(PVector force) {
    acc.add(force); 
  }
  
  void render() 
  {
    stroke(color1, color2, color3, 5);
    strokeWeight(1);
    line(pos.x, pos.y, previousPos.x, previousPos.y);
    //point(pos.x, pos.y);
    updatePreviousPos();
  }
  void bounds() 
  {
    if (pos.x <= 0) {
      pos.x = width-1;
      updatePreviousPos();
    }
    if (pos.x >= width) {
      pos.x = 1;    
      updatePreviousPos();
    }
    if (pos.y <= 0) {
      pos.y = height-1;;
      updatePreviousPos();
    }
    if (pos.y >= height) {
      pos.y = 1;
      updatePreviousPos();
    }
  }
  void updatePreviousPos() {
    this.previousPos.x = pos.x;
    this.previousPos.y = pos.y;
  }
  
  /*void render()
  {
   stroke(255, 5);
   strokeWeight(1);
   point(pos.x, pos.y);
   update();
  }
  
  void bounds()
  {
   if (pos.x < 16)
     pos.x = width-16;
   if (pos.x > width-16)
     pos.x = 16;
   if (pos.y < 112)
     pos.y = height-144;
   if (pos.y > height-144)
     pos.y = 112;
  }*/
}
