class Mover {
 PVector location;
 PVector velocity;
 PVector acceleration;

 float a;
 float aVelocity;
 float aAcceleration;

 float mass;
 float cord_rest_length = 0;
 float cord_stiffness = 10;

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
   cord_rest_length = cord.mag();
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
   cord_rest_length = cord.mag();
 }

 void update(){
  // Compute the magnitude and direction of the spring reaction of the cord
  float elongation = cord_rest_length - cord.mag();
  PVector spring_force = cord.copy();
  spring_force.normalize();
  spring_force.mult(elongation);

  // Compute the reaction of the cord to the component of the force in its direction
  PVector vertical = new PVector(0,10); // vertical direction
  PVector swing = cord.copy();
  swing.normalize();
  float theta = PVector.angleBetween(vertical, cord);
  float tau = acceleration.mag() * cos(theta);
  swing.mult(-tau);
  swing.add(acceleration);
  swing.add(spring_force);
  velocity.add(swing);
  location.add(velocity);
  cord = PVector.sub(location, pin_location);
  acceleration.mult(0);
 }

 void applyForce(PVector f){
  PVector force = PVector.div(f, mass);
  acceleration.add(force);
 }

 void show(){
  fill(127,100);
  stroke(0);
  strokeWeight(2);
  ellipse(location.x, location.y, mass*20, mass*20);
  pushMatrix();
  translate(pin_location.x, pin_location.y);
  PVector trim = cord.copy();
  trim.normalize();
  trim.mult(-10);
  PVector new_cord = PVector.add(cord, trim);
  line(0, 0, new_cord.x, new_cord.y);
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
