class Spring {
  PVector anchor;
  PVector head;
  float rest_length;
  float springLen;
  float k;

  Spring(){
    anchor = new PVector(width/2,0);
    k = 0.01;
    rest_length = 200;
  } // default constructor

  void update(){

  } // update() method

  void show(){
    stroke(0);
    strokeWeight(2);
    line(anchor.x, anchor.y, head.x, head.y);
  } // show() method

  void connect(Mover bob){
    head = bob.location.copy();
    PVector springDir = PVector.sub(anchor, head);
    springLen = springDir.mag();
    springDir.normalize();
    PVector springforce = springDir.mult(k * (springLen-rest_length) );
    bob.applyForce(springforce);
  } // connect(Mover bob) method
}
