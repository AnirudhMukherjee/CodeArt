PImage img;
PImage sorted;

void setup(){
 size(800,900);
 img = loadImage("blader1.jpg");
 sorted = createImage(img.width, img.height, RGB);
 sorted.loadPixels();
 //img.loadPixels();
 //for(int i = 0;i<sorted.pixels.length;i++){
 // sorted.pixels[i] = img.pixels[i];
 //}
 sorted = img.get();
 sorted.loadPixels();
 
 //for(int i = 0; i<sorted.pixels.length;i++){
 // float record = -1;
 // int selectedPixel = i;
 //  for(int j = i+1;j<sorted.pixels.length;j++){
 //   color pix = sorted.pixels[j];
 //   float b = brightness(pix);
 //   if(b>record){
 //    selectedPixel = j;
 //    record = b;
 //   }
 // }
 // color temp;
 // temp = sorted.pixels[i];
 // sorted.pixels[i] = sorted.pixels[selectedPixel];
 // sorted.pixels[selectedPixel] = temp;
 //}
 quickSort(sorted.pixels, 0, sorted.pixels.length-1);
 sorted.updatePixels();
}

void draw(){
 background(0);
 image(img,0,0);
 image(sorted,0,450);
 save("blader.png");
}

public int partition(int a[], int beg, int end)  
    {  
          
        int left, right, temp, loc, flag;     
        loc = left = beg;  
        right = end;  
        flag = 0;  
        while(flag != 1)  
        {  
            while((brightness(a[loc]) <= brightness(a[right])) && (loc!=right))  
            right--;  
            if(loc==right)  
            flag =1;  
            else if(brightness(a[loc])>brightness(a[right]))  
            {  
                temp = a[loc];  
                a[loc] = a[right];  
                a[right] = temp;  
                loc = right;  
            }  
            if(flag!=1)  
            {  
                while((brightness(a[loc]) >= brightness(a[left])) && (loc!=left))  
                left++;  
                if(loc==left)  
                flag =1;  
                else if(brightness(a[loc]) <brightness(a[left]))  
                {  
                    temp = a[loc];  
                    a[loc] = a[left];  
                    a[left] = temp;  
                    loc = left;  
                }  
            }  
        }  
        return loc;  
    }  
    void quickSort(int a[], int beg, int end)  
    {  
          
        int loc;  
        if(beg<end)  
        {  
            loc = partition(a, beg, end);  
            quickSort(a, beg, loc-1);  
            quickSort(a, loc+1, end);  
        }  
    }  
