#define AIN1 A0               // H-bridge A, input pin 1
              // H-bridge A, input pin 2
#define led 17


void setup() {
  // put your setup code here, to run once:
  pinMode(AIN1,OUTPUT);
//  pinMode(led, OUTPUT);

}


void loop() {
  analogWrite(AIN1, 127);     // turn first control pin off
}

void set_coil(int pin1,int pin2){
  digitalWrite(pin2,LOW);     // turn first control pin off
  digitalWrite(pin1,HIGH);    // then turn second control pin on
}
  
  // put your main code here, to run repeatedly:
