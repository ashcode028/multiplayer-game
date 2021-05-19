# BASIC PONG game
This was my first attempt with hardware and software simulation in the first few weeks of my college.This was made as a part of my couse curriculum .I made this in the span of 5 days which gives me little self boost till date. 
<p align="center">
  <img src="https://github.com/ashcode028/multiplayer-game/blob/2d8544305ad578cc8d0d12657b254f9d28cc4d1b/pong.jpeg"/>
</p>

## Features	
- single player mode- where player competes with the computer
- multiplayer mode-2 players compete with each other
- The movement of your palm relative to ULTRASONIC SENSORS controls the paddle on the screen.
- [Video](https://youtu.be/lJYia5fLM7w)
##  Working-
* The relative distance between the palm and sensor is sent to arduino(ultrasonic sensor).
* The arduino filters out the garbage distance(upto 95% accuracy),sends the filtered input to processing.
* Processing is built on java platform which uses similar syntax, provides user interface for the game.  
## Softwares Used-
1. Arduino 
2. Processing 3
## SensorS Used-
1.1 Piezo Buzzor
1.2 Ultrasonic sensors
