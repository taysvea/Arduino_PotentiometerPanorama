
import processing.serial.*;

Serial myPort;        // The serial port

//Image
int yPos = 1; 

PImage Low;
PImage Med; 
PImage High;

PImage Low_Sunrise;
PImage Low_Sunset;
PImage Low_Daytime;
PImage Low_Nighttime;

//PImage Med_Sunrise;
//PImage Med_Sunset;
//PImage Med_Daytime;
//PImage Med_Nighttime;

//PImage High_Sunrise;
//PImage High_Sunset;
//PImage High_Daytime;
//PImage High_Nighttime;




PImage currentImage;
int pointX = 0;
int x;

//ellipse
float penX;
color penColor = color( 60, 120, 20 ); // color of our pen

//change image
boolean buttonPressed;

void setup () {
  size(1400, 800);
  fill( penColor ); // set pen color

  penX = width/2; // starting x position of pen

  // List all the available serial ports
  println( Serial.list() );

  //Check the port!!! 
  myPort = new Serial(this, Serial.list()[0], 9600);

  // don't generate a serialEvent() unless you get a newline character:
  myPort.bufferUntil('\n');

  // set inital background:
  Low = loadImage( "Barn.jpg" ); //load image data
  Med = loadImage ("Farm.jpg");
  High = loadImage ("Landscape.jpg");

  Low_Sunset = loadImage( "Barn_Sunset.jpg" ); //load image data
  Low_Sunrise = loadImage( "Barn_Sunrise.jpg" );
  Low_Daytime = loadImage( "Barn_Daytime.jpg" );
  Low_Nighttime = loadImage( "Barn_Nighttime.jpg" );

  //Med_Sunset = loadImage( "Farm_Sunset.jpg" ); //load image data
  //Med_Sunrise = loadImage( "Farm_Sunrise.jpg" );
  //Med_Daytime = loadImage( "Farm_Daytime.jpg" );
  //Med_Nighttime = loadImage( "Farm_NightTime.jpg" );

  //High_Sunset = loadImage( "Landscape_Sunset.jpg" ); //load image data
  //High_Sunrise = loadImage( "Landscape_Sunrise.jpg" );
  //High_Daytime = loadImage( "Landscape_Daytime.jpg" );
  //High_Nighttime = loadImage( "Landscape_Nighttime.jpg" );

  currentImage = Low;
}
void draw () {
  //Arduino happens in the serialEvent()

  ellipse( penX, 0, 30, 30 );
  image(currentImage, -penX, 0); 
  //ellipse( penX, 0, 30, 30 );

  //int imageWidth = myImage1.width;

  //for (int x = 1; x < 5; x++) {

  //  image(buttonPressed? myImage1: myImage2, -penX, 0); // make an image and load it to the screen
  //  image(buttonPressed? myImage1: myImage2, -penX + (x*imageWidth), 0); //ellipse controlled panorama
  //  image(buttonPressed? myImage1: myImage2, -penX - (x*imageWidth), 0);


  //}
}


void serialEvent (Serial p) {

  // get the ASCII string:

  String inString = p.readString();

  //  println(inString);
  String pairs[] = split( inString, ';' ); // split up string into pairs

  // go through each pair of label and value
  // and assign it to its variable

  for ( int i=0; i<pairs.length; i++) {
    String data[] = split( pairs[i], ':' );

    if ( data.length == 2 ) { // continue only if there are 2 things
      String label = trim( data[0] ); // remove extra whitespace
      String value = trim( data[1] ); // remove extra whitespace

      print(label);
      print(value);
      if ( label.equals( "button1" ) ) {
        if ( value.equals( "1" ) ) {// if button was pressed
          changeImage1();
        }
      }

      if ( label.equals( "button2" ) ) {
        if ( value.equals( "1" ) ) {// if button was pressed
          changeImage2();
        }
      }

      if ( label.equals( "button3" ) ) {
        if ( value.equals( "1" ) ) {// if button was pressed
          changeImage3();
        }
      }


      if ( label.equals( "button4" ) ) {
        if ( value.equals( "1" ) ) {// if button was pressed
          changeImage4();
        }
      }

      if ( label.equals( "button5" ) ) {
       if ( value.equals( "1" ) ) {// if button was pressed
         changeImage5();
       }
      }

      if ( label.equals( "button6" ) ) {
       if ( value.equals( "1" ) ) {// if button was pressed
         changeImage6();
       }
      }

      if ( label.equals( "button7" ) ) {
       if ( value.equals( "1" ) ) {// if button was pressed
         changeImage7();
       }
      }

      if ( label.equals( "x") ) {
        int v = int(value);
        penX = map( v, 0, 1023, 0, width);
      }
    }
  }
}


void changeImage1() {

  currentImage = Low;
  image(Low, -penX, 0); 
  buttonPressed = true;
}

void changeImage2() {

  currentImage = Med;
  image(Med, -penX, 0); 
  buttonPressed = true;
}


void changeImage3() {

  currentImage = High;
  image(High, -penX, 0); 
  buttonPressed = true;
}

void changeImage4() {

  currentImage = Low_Sunrise;
  image(Low_Sunrise, -penX, 0); 
  buttonPressed = true;
}

void changeImage5() {

 currentImage = Low_Sunset;
 image(Low_Sunset, -penX, 0); 
 buttonPressed = true;
}

void changeImage6() {

 currentImage = Low_Daytime;
 image(Low_Daytime, -penX, 0); 
 buttonPressed = true;
}

void changeImage7() {

 currentImage = Low_Daytime;
 image(Low_Daytime, -penX, 0); 
 buttonPressed = true;
}

