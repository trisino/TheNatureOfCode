class Mover {
 PVector location;
 PVector velocity;
 PVector acceleration;

 float a;
 float aVelocity;
 float aAcceleration;

 float mass;

 PVector pin_location;
 PVector cord;

 Mover(){ // Default constructor
   mass = random(1,3);
   location = new PVector(random(width),random(height));
   velocity = new PVector(0,0);
   acceleration = new PVector(0,0);
   a = 0.0;
   aVelocity = 0.0;
   aAcceleration = 0.0;

   pin_location = new PVector(width/2,0);
   cord = PVector.sub(location, pin_location);
 } // Default constructor

 Mover(float xpos, float ypos){ // alternative constructor
   mass = random(1,3);
   location = new PVector(xpos,ypos);
   velocity = new PVector(0,0);
   acceleration = new PVector(0,0);
   a = 0.0;
   aVelocity = 0.0;
   aAcceleration = 0.0;

   pin_location = new PVector(width/2,0);
   cord = PVector.sub(location, pin_location);
 }

 void update(){
  velocity.add(acceleration);
  location.add(velocity);
  cord = PVector.sub(location, pin_location);
  acceleration.mult(0);
 }

 void applyForce(PVector f){
  PVector force = PVector.div(f, mass);

  // Compute the magnitude and direction of the reaction in the cord
  PVector vertical = new PVector(0,10); // vertical direction
  PVector swing = cord.copy();
  swing.normalize();
  float theta = PVector.angleBetween(vertical, cord);
  float tau = force.mag() * cos(theta);
  swing.mult(-tau);
  swing.add(force);
  acceleration.add(swing);
 }

 void show(){
  fill(127,100);
  stroke(0);
  strokeWeight(2);
  ellipse(location.x, location.y, mass*20, mass*20);
  pushMatrix();
  translate(pin_location.x, pin_location.y);
  line(0, 0, cord.x, cord.y);
  popMatrix();
 }

 void edges(){
  if (location.x+20 > width) {
    velocity.x *= -1;
    location.x = width-20;
  }
  if (location.x-20 < 0) {
    velocity.x *= -1;
    location.x = 20;
  }
  if (location.y+20 > height) {
    velocity.y *= -1;
    location.y = height-20;
  }
  if (location.y-20 < 0) {
    velocity.y *= -1;
    location.y = 20;
  }

 }

} // class Mover
