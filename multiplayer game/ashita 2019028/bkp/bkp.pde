import processing.serial.*; // Importing the library to use serial port.
Serial myPort; //Create object from Serial class.
int x, y, h, w, speedX, speedY;
int val, paddleXL, paddleYL, paddleH, paddleW, paddleS; //This will set the left paddle size and its speed in Y direction only,
int paddleXR, paddleYR; //This will set the Right paddle size.
boolean upL, downL, upR, downR; //This values are in TRUE or FALSE to know the key pressed or not.
int scoreL=0; // This will set the score for left player.
int scoreR=0; // This will set the score for right player.
int winScore=5; //This value is the winning score means player getting this value first will WIN :)
color colorL=color(230,230,250);
color colorR=color(230,230,250);
boolean modeSelected=false;
boolean singlePlayer=true;

void setup(){
  myPort = new Serial(this, Serial.list()[0], 9600);
  myPort.bufferUntil(10);
  size(600,600);
  textSize(30);
  textAlign(CENTER,CENTER);
  rectMode(CENTER);
  paddleXL=10;
  paddleYL=height/2;
  paddleXR=width-10;
  paddleYR=height/2;
  paddleH=120;
  paddleW=20;
  paddleS=100;
  x=width/2; // Staring possition of ball in x-coorinate
  y=height/2; // Staring possition of ball in y-coorinate
  h=50; // size of ball
  w=50; //Size of ball h and W to be eaqual for circle otherwise it will be an ellipse.
  speedX=2;
  speedY=3;
}

void draw(){
 background(205,92,92);
 if(myPort.available()>0){
  val = myPort.read(); 
 }
 if(modeSelected)
 {
  movingBAll();
  bounceBack();
  movingPaddle();
  paddleCONCT();
  score();
  gameOver();
 }
 else
 {
   if(singlePlayer)
     text("Single Player",width/2-30, height/2);
   else
     text("Multi Player", width/2-30, height/2);
     
   if(mousePressed)
   {
     modeSelected=true;
   }
   
   if(keyPressed)
   {
     if(key=='m' || key=='M')
       singlePlayer=!singlePlayer;
   }
 }
}

void movingBAll(){
 fill(175,238,238);
 ellipse(x,y,w,h);
 x=x+speedX;
 y=y+speedY;
 }
 
 
void bounceBack(){
 if(x > width-w/3){
 reStart();
 speedX = -speedX;
 scoreL=scoreL+1;}
 else if(x<0+w/3){
 scoreR=scoreR+1;
 reStart();
 }
 else if(y>height-h/3){
 speedY=-speedY;
 }
 else if(y<0+h/3){
 speedY=-speedY;
 }
 } 
 
void movingPaddle(){
 fill(colorL);
 rect(paddleXL,paddleYL,paddleW,paddleH);
 fill(colorR);
 rect(paddleXR,paddleYR,paddleW,paddleH);
  if(val==1){
  paddleYL=paddleYL-paddleS;
  }
  if(val==2){
  paddleYL=paddleYL+paddleS;
  }
  
  if(!singlePlayer)
  {
    if(val==3){
    paddleYR=paddleYR-paddleS;
    }
    if(val==4){
    paddleYR=paddleYR+paddleS;
    }
  }
  else
  {
    int temp=int(random(2));
    
    if(temp==0)
    {
      if(paddleYR<y)
        paddleYR++;
      else
        paddleYR--;
    }
  }
  
  if(paddleYL - paddleH/2 < 0){
  paddleYL = paddleYL + paddleS;
  }
  if(paddleYL + paddleH/2 > height){
  paddleYL = paddleYL - paddleS;
  }
  if(paddleYR - paddleH/2 < 0){
  paddleYR = paddleYR + paddleS;
  }
  if(paddleYR + paddleH/2 > height){
  paddleYR = paddleYR - paddleS;
  }
  
}


void paddleCONCT(){
if(x-w/2<paddleXL+paddleW/2 && y-h/2 < paddleYL+paddleH/2 && y+h/2 > paddleYL-paddleH/2){
 if(speedX < 0){
 speedX = -speedX;} 
}
 if(x+w/2 > paddleXR - paddleW/2 && y+h/2 > paddleYR - paddleH/2 && y-h/2 < paddleYR + paddleH/2){
 if(speedX > 0){
   speedX=-speedX;}
}
}

 void score(){
 fill(0);
 text("PLAYER 1",100,15);
 text("PLAYER 2",width-100,15);
 fill(255,255,255);
 text(scoreL,100,40);
 text(scoreR,width-100,40);
 }
 
 void gameOver(){
 if(scoreL == winScore){
 gameOverPage("Player 1 wins",colorL);
 }
 if(scoreR == winScore){
 gameOverPage("Player 2 wins",colorR);
 }
 }
 
 void gameOverPage(String msg, color c){
 speedX=0;
 speedY=0;
 background(245,222,179);
 text("GAME OVER",width/2,height/3-40);
 text("CLICK TO RESTART",width/2,height/3-80);
 text(msg,width/2,height/3);
 if(mousePressed){
 scoreR=0;
 scoreL=0;
 speedX=2;
 speedY=3;
 }
 }
 
 void reStart(){
 x=width/2;
 y=height/2;
 h=50;
 w=50;
 speedX=2;
 speedY=3;
 }
 
 
 
