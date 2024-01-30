int Diff = A0;  
void setup() {
  // declare the ledPin as an OUTPUT:
  Serial.begin(9600);
  pinMode(Diff, OUTPUT);
}

void loop() {
  Serial.println(analogRead(Diff));
     
}
