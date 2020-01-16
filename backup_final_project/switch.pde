class Switch{
 int xcoor;
 int ycoor;
 boolean tHis;
 boolean connected;
 Light con;
 boolean connectgate;
 boolean clock;
 Port conPort;
 int timing;
 Switch (int x, int y){
   this.xcoor=x;
   this.ycoor=y;
  
   this.tHis=false;
   this.connected=false;
   this.con=null;
   this.connectgate=false;
   this.conPort=null;
   this.clock=false;
   this.timing=0;
 }
void appear(){
  
  if (!this.tHis){
     fill(100, 100, 100);
     
  }
   else{
     fill(0, 255, 0);
     
   }
   rect(this.xcoor-30,this.ycoor-30,60,60);
   fill(255);
   textSize(32);
   if (this.clock==false)
    text("S",this.xcoor-8, this.ycoor+13);
    else
    text("C",this.xcoor-9, this.ycoor+13);
    ellipse(this.xcoor+30, this.ycoor-2,12, 12);
    if (this.connected){
      stroke(255);
      try{
    line(this.xcoor+30, this.ycoor, this.con.xcoor-6, this.con.ycoor+4);
    stroke(0);
      }
      catch (Exception e){
        
        line(this.xcoor+30, this.ycoor, this.conPort.xcoor, this.conPort.ycoor);
        stroke(0);
      }
    }
}
  
  void connect(Light a){
    this.con=a;
    a.con=this;
    this.connected=true;
    a.connected=true;
    
  }
  void connectg(Port a){
    this.conPort=a;
    a.connector=this;
    this.connected=true;
    a.connected=true;
    this.connectgate=true;
  }
  
  void update(){
    if (this.clock){
    if (this.timing%201>100)
    this.tHis=true;
    else
    this.tHis=false;
    }
  }
 //boolean didUserClickMe() {
   
 //}
  
}
