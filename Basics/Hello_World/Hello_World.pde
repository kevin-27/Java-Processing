int count = 0;
long timer;

void setup() {
  // put setup code here
    size(400, 400);
    frameRate(60);
    timer = System.currentTimeMillis();
}

void draw() {
  // put drawing code here
    background(51);
    
    fill(255, 0, 0);
    rect(200, 200, 50, 50);
    
    count++;
    
    if (System.currentTimeMillis() > (timer + 1000))
    {
      timer += 1000;
      println(count);
    }
}
