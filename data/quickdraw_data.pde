
size(280,280);
byte[] dataAnt = loadBytes("ant.npy");
byte[] dataBear = loadBytes("bear.npy");
byte[] dataBee = loadBytes("bee.npy");
/*byte[] dataBird = loadBytes("bird.npy");
byte[] dataButterfly = loadBytes("butterfly.npy");
byte[] dataCamel = loadBytes("camel.npy");
byte[] dataCat = loadBytes("cat.npy");
byte[] dataCow = loadBytes("cow.npy");
byte[] dataCrab = loadBytes("crab.npy");
byte[] dataCrocodile = loadBytes("crocodile.pny");
byte[] dataDog = loadBytes("dog.pny");
byte[] dataDolphin = loadBytes("dolphin.pny");
*/


int total = 1000;
 
byte[] outdataAnt = new byte[total * 784];
int outindexAnt = 0;

for (int n = 0; n < total; n++){
  //80 bytes of extra information at top of data + which image we are on * the 784 bytes of data per picture 
  int start = 80 + n * 784;
  //create 28 x 28 image
  //PImage img = createImage(28,28,RGB);
  //load pixels into an array before writing to image
  //img.loadPixels();
  //load value for each pixel in the 28 x 28 image 
  for (int i = 0; i < 784; i++){
    int index = i + start; 
    byte val = dataAnt[index];
    //writes data to outdata array
    outdataAnt[outindexAnt] = val; 
    outindexAnt++;
    //img.pixels[i] = val;
  }
  
  //img.updatePixels();
  //modulus 10 for formating
  // divide 10 for formating 
  //int x = 28 * (n % 10);
  //int y = 28 * (n/10);
  //image(img,x,y);
}
//saves array of bytes to binary file
saveBytes("ants1000.bin", outdataAnt);

byte[] outdataBear = new byte[total * 784];
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
saveBytes("bear1000.bin", outdataBear);

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
saveBytes("bee100.bin", outdataBee);
