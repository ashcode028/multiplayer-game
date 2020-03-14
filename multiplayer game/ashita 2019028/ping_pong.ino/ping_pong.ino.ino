int echoPin = 2;
int triggerPin = 3;
int echoPin1 = 8;
int triggerPin1 = 9;
unsigned long pulsetime = 0;
int distanceNew = 0;
unsigned distanceOld = -1;
int distanceNew1 = 0;
unsigned distanceOld1 = -1;

void setup (){
  pinMode (echoPin, INPUT);
  pinMode (triggerPin, OUTPUT);
  pinMode (echoPin1, INPUT);
  pinMode (triggerPin1, OUTPUT);
  Serial.begin(9600);  
}

void loop(){
  digitalWrite(triggerPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(triggerPin, LOW);
  pulsetime = pulseIn(echoPin, HIGH);
  distanceNew = pulsetime / 58;
  delay(10);
   if (distanceOld != distanceNew) {
    Serial.println(distanceNew); 
    distanceOld = distanceNew;
  }
  if(distanceNew < 10){
    Serial.write(1);
  }
  else{
    Serial.write(2);
  }  
  digitalWrite(triggerPin1, HIGH);
  delayMicroseconds(10);
  digitalWrite(triggerPin1, LOW);
  pulsetime = pulseIn(echoPin1, HIGH);
  distanceNew1 = pulsetime / 58;
    delay(10);
  if (distanceOld1 != distanceNew1) {
    Serial.println(distanceNew1); 
    distanceOld1 = distanceNew1;
  }
  if(distanceNew1 < 10){
    Serial.write(3);
  }
  else{
    Serial.write(4);
  }  
  delay(100); 
} 


   
