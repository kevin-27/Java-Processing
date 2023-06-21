color red = color(255, 0, 0);
color green = color(0, 255, 0);
color blue = color(0, 0, 255);
color yellow = color(255, 255, 0);
color orange = color(255, 132, 0);
color purple = color(255, 0, 255);
color pink = color(255, 0, 132);
color teal = color(0, 255, 255);

color colors[] = new color[] 
{red, green, blue, yellow, orange, purple, pink, teal};

color randomColor()
{
 switch ((int)random(numOfp))
 {
  case 0 : return(red);
  case 1 : return(green);
  case 2 : return(blue);
  case 3 : return(yellow);
  case 4 : return(orange);
  case 5 : return(purple);
  case 6 : return(pink);
  case 7 : return(teal);
 }
 return(color(255));
}
