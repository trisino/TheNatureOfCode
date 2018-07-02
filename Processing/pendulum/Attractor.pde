class Attractor {
  PVector location;
  float mass;
  float G;
  PVector dragOffset;

  Attractor(){
    location = new PVector(width/2, height/2);
    mass = 20;
    G = 1;
    dragOffset = new PVector(0.0, 0.0);
  } // constructor

  PVector attract (Mover m){
    PVector force = PVector.sub(location, m.location);
    float d = force.mag();
    d = constrain(d,5,25);
    force.normalize();

    float strength = G *mass * m.mass / (d * d);

    force.mult(strength);

    return force;
  } // attract()

  void show(){
    fill(0,100);
    stroke(0);
    strokeWeight(2);
    ellipse(location.x, location.y, 50, 50);
 }

} // class Attractor
