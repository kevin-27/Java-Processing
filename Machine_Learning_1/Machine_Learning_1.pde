String target;
Population pop;

void setup()
{
 frameRate(1000);
 size(720, 360);
 target = new String("Greetings fellow Humans");
 pop = new Population(target);
}

void draw()
{
 background(0);
 
 textSize(32);
 text("Best Phrase:", 0, height*0.25);
 text(pop.best.guess, 0, (height*0.25)+32);
 textSize(16);
 
 text("Total Generation: " + pop.gen, 0, (height*0.5));
 text("Average Fitness: " + String.format("%.3f", pop.avarageFit), 0, (height*0.5)+16);
 text("Total Population: " + pop.sizeP, 0, (height*0.5)+32);
 text("Mutation Rate: " + pop.mRate, 0, (height*0.5)+48);
 
 text("All Phrases:", width - 320, 16);
 
 pop.render();
}

String randomString(int size)
{
 String temp = new String("");
 char c;
 for (int i = 0; i < size; i++)
 {
  c = (char)random(32, 126);
  temp += c;  
 }
 return temp;
}
