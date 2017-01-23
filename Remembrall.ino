/* Program works alongside Twitter & Particle IFTTT channels. */

int led1 = D1; 
int led2 = D7; 

void setup() { 

pinMode(led1, OUTPUT); 
pinMode(led2, OUTPUT); 
Spark.function("led_on", led_on); 
Spark.function("led_off", led_off); 

} 

//Call function if #a1 is read from twitter

int led_on(String cmd) { 

digitalWrite(led1, HIGH); 
digitalWrite(led2, HIGH); 

} 

//Call function if #a0 is read from twitter

int led_off(String cmd) { 

digitalWrite(led1, LOW); 
digitalWrite(led2, LOW); 

} 

void loop() { 

}
