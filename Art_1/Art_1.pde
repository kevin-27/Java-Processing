Group group;
long clock;
boolean started;

void setup()
{
 frameRate(30);
 size(640, 640, P2D);
 started = false;
 
 group = new Group();
 //clock = millis();
}

void draw()
{
 background(0);
 
 if (!started)
 {
  started = true;
  clock = millis();
 }
 
 if (millis() > clock + 100000/frameRate)
  group.Origin();
 
 group.render();
 
 //save each frame as a picture
 //saveFrame("slides11/slide-####.png");
 
 if (millis() > clock + 790000/frameRate)
  exit();
}

void mousePressed()
{
 println(frameRate);
 //group.Origin();
}
