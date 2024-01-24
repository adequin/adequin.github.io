int referencePin = A7;  
int resistorValue = 30000;
int i;
void setup() {
  // declare the ledPin as an OUTPUT:
  Serial.begin(9600);
}

void loop() {
  for (i = 0; i<20; i++){
    if (analogRead(referencePin) == 0){
      Serial.println(referencePin);
    }
    
    referencePin = "A" + String(i);
  }

  Serial.println("cycle restart");
  delay(1000);        
}
