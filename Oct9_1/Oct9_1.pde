PImage myImage;
Pizza myPizza;


ArrayList<Pizza> myPizzaArrayList;

PImage myPlayerImage;
Player myPlayer;
int xPlayer = 100;
int yPlayer = 200;


String[] idleImages;
PImage[] myIdleImages = new PImage[10];

int i = 0;
int x = 100;
int y = 100;
int playerWidth = 587;
int playerHeight = 707;
int enemyWidth = 579;
int enemyHeight = 763;

void setup()
{
  idleImages = loadStrings("Idle.txt");
  size(1000,1000);
  createAllAnimationArrays();
  frameRate(30);
  
  myPlayerImage = loadImage("rock.jpg");
  myPlayer = new Player(xPlayer,yPlayer,myPlayerImage);
  
  // reads in the entire text file, puts the lines into an array
  String[] borderCoord = loadStrings("border.txt");
  myPizzaArrayList = new ArrayList<Pizza>();
  myImage = loadImage("pizza.jpg");
  for(int i = 0; i < borderCoord.length; i++)
  {
     // read each individual line and splitting it by comma
     String[] line = borderCoord[i].split(",");
     
     for(int j = 0; j < line.length; j++)
     {
        println(line[j]);
        if(Integer.parseInt(line[j]) == 1)
        {
           myPizza = new Pizza(x,y, myImage);
           myPizzaArrayList.add(myPizza);
          
        }
         x+=100; // move x by 50 px regardless if it's a 1 or 0
     } // end of inner for loop
     y+=100; // moves us down one line
     x = 0; // restart x
  }
  
  /*myPizzaArrayList = new ArrayList<Pizza>();
  myImage = loadImage("pizza.jpg");
  myPizza = new Pizza(100,200, myImage);
  myPizzaArrayList.add(myPizza);
  myPizza = new Pizza(150,300, myImage);
  myPizzaArrayList.add(myPizza);
  myPizza = new Pizza(250,600, myImage);
  myPizzaArrayList.add(myPizza);
  */
}

void draw()
{
  background(0);
  for(int i = 0; i < myPizzaArrayList.size(); i++)
  {
    myPizzaArrayList.get(i).draw();
    
  }
  //xPlayer += 10;
  //yPlayer += 3;
  myPlayer.draw(xPlayer, yPlayer);
}

void createAllAnimationArrays()
{
  for(int i = 0; i < myIdleImages.length; i++)
  {
    myIdleImages[i] = loadImage(idleImages[i]);
  }
}

void keyPressed()
{
    if(keyCode == UP)
    {
      yPlayer -= 5;  
    }
    else if(keyCode == DOWN)
    {
      yPlayer += 5; 
    }
 
}
