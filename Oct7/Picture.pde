class Picture
{
  // variables
    private int x;
    private int y;
    private String imagePath;
    private PImage pizzaImage;
    private int h;
    private int w;
    //constructor
    public Picture(int x, int y, String imagePath, int h, int w)
    {
        this.x = x;
        this.y = y;
        this.h = h;
        this.w = w;
        this.imagePath = imagePath;
        pizzaImage = loadImage(imagePath);
        pizzaImage.resize(w,h);
    }
    
    // methods
    void draw()
    {
       image(pizzaImage,x,y); 
    }
}
