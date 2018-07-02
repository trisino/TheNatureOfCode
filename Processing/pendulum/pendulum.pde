Mover m;

void setup(){
  size(600,400);
  m = new Mover();
}

void show(){
  background(255);
  m.update();
  m.show();
}
