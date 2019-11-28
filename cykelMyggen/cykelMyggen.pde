
PImage sprite1;
PImage sprite2;
PImage sprite3;
PImage sprite4;
PImage spritel1;
PImage spritel2;
PImage spritel3;
PImage spritel4;
int maxSpeed = 0;
int speed = 0;
int lane = 3;
int x= 5;
int spriteNumber = 1;
float spriteCounter = 0;
int spritexSize = 44*2;
int spriteySize = 47*2;


void setup(){
fullScreen();

sprite1 = loadImage("1.png");
sprite2 = loadImage("2.png");
sprite3 = loadImage("3.png");
sprite4 = loadImage("4.png");
sprite1.resize(spritexSize,spriteySize);
sprite2.resize(spritexSize,spriteySize);
sprite3.resize(spritexSize,spriteySize);
sprite4.resize(spritexSize,spriteySize);

spritel1 = loadImage("l1.png");
spritel2 = loadImage("l2.png");
spritel3 = loadImage("l3.png");
spritel4 = loadImage("l4.png");
spritel1.resize(spritexSize,spriteySize);
spritel2.resize(spritexSize,spriteySize);
spritel3.resize(spritexSize,spriteySize);
spritel4.resize(spritexSize,spriteySize);


}

void draw(){
clear();
background(0);
x+=speed;

switch (spriteNumber){

case 1: {
  if(speed<0)
image(spritel1,x,lane*120);
else
image(sprite1,x,lane*120);}

break;
case 2:{
  if(speed<0)
image(spritel2,x,lane*120);
else
image(sprite2,x,lane*120);
}; break;
case 3:{
  if(speed<0)
image(spritel3,x,lane*120);
else
image(sprite3,x,lane*120);
}break;
case 4:{
  if(speed<0)
image(spritel4,x,lane*120);
else
image(sprite4,x,lane*120);
} break;


}
if(speed>0)
spriteCounter += 0.2*(int)(speed/2);
else
spriteCounter += 0.2 *(int)(-speed/2);

if(spriteCounter >= 1){
spriteNumber +=1;
spriteCounter = 0;
}
if (spriteNumber >= 5)
spriteNumber = 1;

if(speed<0)
text("Speed : "+ -speed,width/2, 50);
else
text("Speed : "+ speed,width/2, 50);

if(speed>0)
if(speed> maxSpeed)
maxSpeed= speed;
println(-speed> maxSpeed);

if(speed<0)
if(-speed> maxSpeed)
maxSpeed= -speed;


text("Highest Speed: " + maxSpeed,width/2,30 );

if(x > 1870 ){
x= 5;
speed= 0;
lane= 3;
}
if(x< 0){
x= 5;
speed= 0;
lane= 3;
}
}


void keyPressed(){
if(keyCode == LEFT){
if(speed >0){
 speed-=2;
  speed = -speed;
}
}
if(keyCode == RIGHT){
if(speed <0){
speed = -speed;
speed-=2;
}
}  

if((keyCode == UP) && (lane != 1))
lane-=1;
if((keyCode == DOWN) && (lane != 7))
lane+= 1;

if(key == ' '){
if(speed < 0)
speed-= 2;
if(speed >= 0)
speed +=2;
}


}
