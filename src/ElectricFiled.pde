

Evec[][] filed;
float delta = 20;
ArrayList<Charg> chargers = new ArrayList<Charg>();
//we will add the chargs with the keyword.

Charg hekpingCharg;

Charg movingCharg = null;

void setup() {
  size(1250, 800);
  size(1000 ,1000, P2D);
  filed = getVecFiled(20, (int)(height/delta), (int)(width/delta));
  hekpingCharg = new Charg(0,new PVector(0,0));
}


Evec[][] getVecFiled(int a, int n, int m) {
  Evec[][] arr = new Evec[m][n];
  float x, y;

  for (int i=0; i<m; i++) {
    for (int j=0; j<n; j++) {
      x = a+i*delta;
      y = a+j*delta;
      arr[i][j] = new Evec(new PVector(x, y), new PVector(1, 1));
    }
  }

  return arr;
}


void draw() {
  background(0);
  
  updateFiled();
  updateChargers();
  showFiled();
  drawForceVecs();
  showChargers();
  
  
  
  fill(100);
  rect(width/2-200-5,height-80,390,60,10);
  
  
  hekpingCharg.positiveChargDrawing(width/2-200+110,height-50);
  hekpingCharg.negativeChargDrawing(width/2-200+210,height-50);
  hekpingCharg.testChargDrawing(width/2-200+310,height-50);
  
  
  textSize(28);
  fill(51, 153, 51);
  text("P=>",width/2-200+110-60,height-50+10);
  text("N=>",width/2-200+210-60,height-50+10);
  text("T=>",width/2-200+310-60,height-50+10);
}

void drawForceVecs(){
 for(Charg c : chargers)
   if(c.getSign()==0)
     c.getForceVec(chargers);
}


float dis(float x1, float y1, float x2, float y2) {
  PVector v1 = new PVector(x1, y1); 
  PVector v2 = new PVector(x2, y2); 
  return v1.dist(v2);
}

void updateVecForce(Evec ev){
  
  PVector force = new PVector(0,0);
  PVector fnormal;
  //float dis = 0;
  
  for(int i=0;i<chargers.size();i++){
    fnormal = new PVector(chargers.get(i).getSign()*(ev.getX()-chargers.get(i).getPos().x),chargers.get(i).getSign()*(ev.getY()-chargers.get(i).getPos().y));
    force.add(fnormal.normalize().mult(13000/chargers.get(i).getPos().dist(new PVector(ev.getX(),ev.getY()))));
  }
  ev.setVec(force);
  ev.setMagnitude(force.mag());
}

void updateFiled() {
  for (int i=0; i<filed.length; i++) {
    for (int j=0; j<filed[0].length; j++) {
      //filed[i][j].setVec(new PVector(mouseX-filed[i][j].getX(), mouseY-filed[i][j].getY()));
      updateVecForce(filed[i][j]);
      //filed[i][j].setMagnitude();
    }
  }
}

void updateChargers(){
  if(movingCharg != null)
    movingCharg.pos = new PVector(mouseX,mouseY);
}


void showChargers(){
  for(int i=0;i<chargers.size();i++){
    chargers.get(i).show();
  }
}


void showFiled() {
  for (int i=0; i<filed.length; i++) {
    for (int j=0; j<filed[0].length; j++) {
      filed[i][j].show();
    }
  }
}

void mousePressed(){
  
  for(int i=0;i<chargers.size();i++){
    if(chargers.get(i).getPos().dist(new PVector(mouseX,mouseY)) < Charg.R){
      movingCharg = chargers.get(i);
      
      
    }  
  }
}

void keyPressed(){
  
  if(key == 'P' || key == 'p')
    chargers.add(new Charg(1,new PVector(width/2,height/2)));
  else if(key == 'N' || key == 'n')  
    chargers.add(new Charg(-1,new PVector(width/2,height/2)));
  else if(key == 'T' || key == 't')
    chargers.add(new Charg(0,new PVector(width/2,height/2)));
    
  if(movingCharg != null){
    if(keyCode == ENTER){
      movingCharg = null;
    }else if(keyCode == BACKSPACE){
      chargers.remove(movingCharg);
      movingCharg = null;
    }
  }
}
