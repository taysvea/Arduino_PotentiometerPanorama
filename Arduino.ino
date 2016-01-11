// variables for pins
int xPin = A0;
const int buttonPin1 = 7;
const int buttonPin2 = 6;
const int buttonPin3 = 5;
const int buttonPin4 = 4;
const int buttonPin5 = 3;
const int buttonPin6 = 2;
const int buttonPin7 = 1;
const int ledPin = 13;

//variables will change
int buttonPushCounter = 0;
//int buttonPushCounterMax = 4;
int buttonState = 0;
int lastButtonState = 0;


void setup() {
  // turn on internal pull-up resistor
  pinMode( buttonPin1, INPUT);
  pinMode( buttonPin2, INPUT);
  pinMode( buttonPin3, INPUT);
  pinMode( buttonPin4, INPUT);
  pinMode( buttonPin5, INPUT);
  pinMode( buttonPin6, INPUT);
  pinMode( buttonPin7, INPUT);
  pinMode(ledPin, OUTPUT);

  // start Serial
  Serial.begin( 9600 );
}

void loop() {
  // read in values
  int xValue = analogRead( xPin );

  //  int buttonValue = digitalRead( buttonPin );

  int low = digitalRead (buttonPin1);
  int med = digitalRead (buttonPin2);
  int high = digitalRead (buttonPin3);

  int sunrise = digitalRead (buttonPin4);
  int sunset = digitalRead (buttonPin5);
  int daytime = digitalRead (buttonPin6);
  int nighttime = digitalRead (buttonPin7);




  // compare buttonState to previous
  if (buttonState != lastButtonState) {

    //if state change, increment counter
    if (buttonState == HIGH) {



    } else {
      buttonPushCounter++;
      Serial.println("on");
      Serial.print("number of button pushes:   ");
      Serial.println(buttonPushCounter);
    }
  }

  delay(50);


  lastButtonState = buttonState;

  if (buttonPushCounter % 2 == 0) {
    digitalWrite(ledPin, HIGH);
  } else {
    digitalWrite(ledPin, LOW);

  }

  // print out values
  //  Serial.print( "x:" );
  //  Serial.print( xValue );


  Serial.print( "; button1:" );
  Serial.println( low );
  Serial.print( "; button2:" );
  Serial.println( med );
  Serial.print( "; button3:" );
  Serial.println( high );

  Serial.print( "; button4:" );
  Serial.println( sunrise );
  Serial.print( "; button5:" );
  Serial.println( sunset );
  Serial.print( "; button6:" );
  Serial.println( daytime );
  Serial.print( "; button7:" );
  Serial.println( nighttime );

  Serial.print( "x:" );
  Serial.print( xValue );

  // wait a little bit
  delay( 30 );
}

