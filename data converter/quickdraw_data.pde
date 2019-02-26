size(280,280);
byte[] datashark = loadBytes("shark.npy");
/*byte[] dataBear = loadBytes("bear.npy");
byte[] dataBee = loadBytes("bee.npy");
byte[] datashark = loadBytes("shark.npy");
byte[] dataButterfly = loadBytes("butterfly.npy");
byte[] dataCamel = loadBytes("camel.npy");
byte[] datashark = loadBytes("shark.npy");
byte[] datashark = loadBytes("shark.npy");
byte[] datashark = loadBytes("shark.npy");
byte[] datashark = loadBytes("shark.pny");
byte[] datashark = loadBytes("shark.pny");
byte[] datashark = loadBytes("shark.pny");
byte[] datashark = loadBytes("shark.pny");
byte[] dataElephshark = loadBytes("elephshark.pny");
byte[] datashark = loadBytes("shark.pny");
byte[] datashark = loadBytes("shark.pny");
byte[] datashark = loadBytes("shark.pny");
byte[] datashark = loadBytes("shark.pny");
byte[] datashark = loadBytes("shark.pny");
byte[] datashark = loadBytes("shark.pny");
byte[] datashark = loadBytes("shark.pny");
byte[] datashark = loadBytes("shark.pny");
byte[] datashark = loadBytes("shark.pny");
byte[] datashark = loadBytes("shark.pny");
byte[] datashark = loadBytes("shark.pny");
byte[] datashark = loadBytes("shark.pny");
byte[] datasharke = loadBytes("shark.pny");
byte[] datashark = loadBytes("shark.pny");
byte[] datashark = loadBytes("shark.pny");
byte[] datashark = loadBytes("shark.pny");
byte[] datashark = loadBytes("shark.pny");
byte[] datashark = loadBytes("shark.pny");
byte[] datashark = loadBytes("shark.pny");
byte[] datashark = loadBytes("shark.pny");
byte[] datashark = loadBytes("shark.pny");
byte[] datashark = loadBytes("shark.pny");
byte[] datashark = loadBytes("shark.pny");
byte[] datashark = loadBytes("shark.pny");
byte[] datashark = loadBytes("shark.pny");
byte[] dataSpider = loadBytes("spider.pny");
byte[] datashark = loadBytes("shark.pny");
byte[] datashark = loadBytes("shark.pny");
byte[] datashark = loadBytes("shark.pny");
byte[] datashark = loadBytes("shark.pny");
byte[] datashark = loadBytes("shark.pny");
byte[] datashark = loadBytes("shark.pny");
*/

int total = 20000;
 
byte[] outdatashark = new byte[total * 784];
int outindexshark = 0;



for (int n = 0; n < total; n++){
  //80 bytes of extra information at top of data + which image we are on * the 784 bytes of data per picture 
  int start = 80 + n * 784;
  //create 28 x 28 image
  PImage img = createImage(28,28,RGB);
  //load pixels into an array before writing to image
  img.loadPixels();
  //load value for each pixel in the 28 x 28 image 
  for (int i = 0; i < 784; i++){
    int index = i + start; 
    byte val = datashark[index];
    //writes data to outdata array
    outdatashark[outindexshark] = val; 
    outindexshark++;
    img.pixels[i] = val;
  }
  
  img.updatePixels();
  //modulus 10 for formating
  // divide 10 for formating 
  int x = 28 * (n % 10);
  int y = 28 * (n/10);
  image(img,x,y);
}
//saves array of bytes to binary file
saveBytes("shark.bin", outdatashark);

/*byte[] outdataBear = new byte[total * 784];
int outindexBear = 0;

for (int n = 0; n < total; n++){
  //80 bytes of extra information at top of data + which image we are on * the 784 bytes of data per picture 
  int start = 80 + n * 784;
  //load value for each pixel in the 28 x 28 image 
  for (int i = 0; i < 784; i++){
    int index = i + start; 
    byte val = dataBear[index];
    //writes data to outdata array
    outdataBear[outindexBear] = val; 
    outindexBear++;
  }

}
//saves array of bytes to binary file
saveBytes("bear5000.bin", outdataBear);


byte[] outdataBee = new byte[total * 784];
int outindexBee = 0;
for (int n = 0; n < total; n++){
  //80 bytes of extra information at top of data + which image we are on * the 784 bytes of data per picture 
  int start = 80 + n * 784;
  //load value for each pixel in the 28 x 28 image 
  for (int i = 0; i < 784; i++){
    int index = i + start; 
    byte val = dataBee[index];
    //writes data to outdata array
    outdataBee[outindexBee] = val; 
    outindexBee++;
  }
}
//saves array of bytes to binary file
saveBytes("bee5000.bin", outdataBee);


byte[] outdatashark = new byte[total * 784];
int outindexshark = 0;
for (int n = 0; n < total; n++){
  //80 bytes of extra information at top of data + which image we are on * the 784 bytes of data per picture 
  int start = 80 + n * 784;
  //load value for each pixel in the 28 x 28 image 
  for (int i = 0; i < 784; i++){
    int index = i + start; 
    byte val = datashark[index];
    //writes data to outdata array
    outdatashark[outindexshark] = val; 
    outindexshark++;
  }
}
//saves array of bytes to binary file
saveBytes("shark5000.bin", outdatashark);

byte[] outdataButterfly = new byte[total * 784];
int outindexButter = 0;
for (int n = 0; n < total; n++){
  //80 bytes of extra information at top of data + which image we are on * the 784 bytes of data per picture 
  int start = 80 + n * 784;
  //load value for each pixel in the 28 x 28 image 
  for (int i = 0; i < 784; i++){
    int index = i + start; 
    byte val = dataButterfly[index];
    //writes data to outdata array
    outdataButterfly[outindexButter] = val; 
    outindexButter++;
  }
}
//saves array of bytes to binary file
saveBytes("butterfly5000.bin", outdataButterfly);


}
*/
