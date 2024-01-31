
int Diff = A0;  
const int maxCount = 1000;
static int sensorVals[maxCount];
int Index = 0;

void setup() {
  Serial.begin(9600);
  pinMode(Diff, INPUT);
  Serial.println("begin");
  while(!Serial);
}

void loop() {
  if (Index < maxCount){
    sensorVals[Index] = analogRead(Diff);
    delay(100);
    Serial.print("getting data");
    Serial.print(", ");
    Serial.print(sensorVals[Index]);
    Serial.print(", ");
    Serial.println(Index);
    Index++;
  }
  if (Index == maxCount){
    Serial.println("Stored Data");
    for(int i = 0; i<maxCount; i++){
      Serial.println(sensorVals[i]);
      delay(100);
    }
    Index++;
  }
  

}
