int referencePin = A0; 
int sensePin1 = A8;  
int sensePin2 = A9;
int resistorValue = 1000;

void setup() {
  Serial.begin(9600);
  pinMode(referencePin, INPUT);
  pinMode(sensePin1, INPUT);
  pinMode(sensePin2, INPUT);
}


void loop() {
  int referenceValue = analogRead(referencePin);
  int senseval1 = analogRead(sensePin1);
  int senseval2 = analogRead(sensePin2);

  int difference1 = referenceValue - senseval1;
  int difference2 = referenceValue - senseval2;
  Serial.println(referenceValue);
  Serial.println(difference1);
  Serial.println(difference2);
  Serial.println("STOP");
  Serial.println("");
  delay(1000);        
}
