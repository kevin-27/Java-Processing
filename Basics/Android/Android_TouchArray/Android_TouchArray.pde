void setup() {
  fullScreen();
  textFont(createFont("SansSerif", 24));
  textAlign(CENTER, CENTER);
}    

void draw() {
  background(255);
  for (int i = 0; i < touches.length; i++) {
    float d = 250 * touches[i].area;
    fill(0, 255 * touches[i].pressure);
    ellipse(touches[i].x, touches[i].y, d, d);
    fill(255, 0, 0);
    text(touches[i].id, touches[i].x, touches[i].y);
  }  
}
