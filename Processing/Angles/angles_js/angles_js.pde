 void setup(){
   size(640,360);
 }

 void draw() {
   background(255);

   rectMode(CENTER);
   stroke(0);
   fill(127);

   translate(width/2, height/2);
   rotate(PI/4);
   rect(0,0,64,36);
 }
