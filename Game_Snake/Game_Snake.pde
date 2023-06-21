Snake snake;
Food food;

void setup()
{
 size(480, 480);
 snake = new Snake(aline(width/2), aline(height/2));
 food = new Food(aline(random(width-16)), 
                 aline(random(height-16)));
 frameRate(5);
}

void draw()
{
 background(0);
 snake.render();
 food.render();
 snake.update();
 
 if (snake.seg.get(0).x == food.x && snake.seg.get(0).y == food.y)
 {
   food.move();
   snake.grow();
 }
 
 textSize(16);
 fill(255);
 text("Score : " + snake.count, 32, 32);
}

int aline(float num)
{
 return ((int)(num/16))*16; 
}
