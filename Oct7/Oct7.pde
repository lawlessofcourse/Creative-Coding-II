Picture myPicture;
Picture myPicture2;
//String of images
int x = 100;
int[] numbers = new int[10];
String[] images = {"pizza.jpg", "param.jpg"};
Picture[] myPictures = new Picture[5];

void setup()
{
  size(1000,1000);
  background(0);
  //for(int i = 0; i < numbers.length; i++)
 // {
 //     numbers[i] = i+1;
 // }
  //numbers[0] = 1;
  //numbers[1] = 2;
  //numbers[2] = 3;
  
  
  //myPicture = new Picture(100,100,"pizza.jpg",100,100);
  
 // myPicture2 = new Picture(300,300,"param.jpg",100,200);
  
  
  //myPictures[0] = myPicture;
  //myPictures[1] = myPicture2;
  
  for(int i = 0; i < myPictures.length; i++)
  {
     myPictures[i] = new Picture((int)random(50,300),
     (int)random(50,300),
     images[(int)random(2)],100, 100);
  }
  
}

void draw()
{
    background(0);
    textSize(48);
    fill(255);
 //   for(int i = 0; i < numbers.length; i++)
  //  {
  //    text(numbers[i], x,(int)random(25,400));
  //    x+=40;
  //  }
   // x = 100;
    
    //text(numbers[0], 100,100);
    //text(numbers[1], 140, 100);
    for(int i = 0; i < myPictures.length; i++)
    {
       myPictures[i].draw(); 
    }
   //myPictures[0].draw();
   //myPictures[1].draw();
}
