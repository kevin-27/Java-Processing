import java.util.ArrayList;

Board board;

PImage kingW_png, kingB_png;
PImage pawnW_png, pawnB_png;
PImage rookW_png, rookB_png;
PImage knightW_png, knightB_png;
PImage bishopW_png, bishopB_png;
PImage queenW_png, queenB_png;

void setup()
{
  size(1080, 720);
  
  board = new Board();
  kingW_png = loadImage("ChessP.png").get(0, 0, 314, 302);
  pawnW_png = loadImage("ChessP.png").get(314*5, 0, 314, 302);
  rookW_png = loadImage("ChessP.png").get(314*4, 0, 314, 302);
  knightW_png = loadImage("ChessP.png").get(314*3, 0, 314, 302);
  bishopW_png = loadImage("ChessP.png").get(314*2, 0, 314, 302);
  queenW_png = loadImage("ChessP.png").get(314, 0, 314, 302);
  
  kingB_png = loadImage("ChessP.png").get(0, 332, 314, 302);
  pawnB_png = loadImage("ChessP.png").get(314*5, 332, 314, 302);
  rookB_png = loadImage("ChessP.png").get(314*4, 332, 314, 302);
  knightB_png = loadImage("ChessP.png").get(314*3, 332, 314, 302);
  bishopB_png = loadImage("ChessP.png").get(314*2, 332, 314, 302);
  queenB_png = loadImage("ChessP.png").get(314, 332, 314, 302);
}

void draw()
{
  background(127);
  stroke(0);
  strokeWeight(2);
  
  board.render();
}

void mousePressed()
{
  board.checkClick();
}
