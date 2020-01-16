class Switch{
 int xcoor;
 int ycoor;
 boolean tHis;
 boolean connected;
 Light con;
 boolean connectgate;  //if it is connected to a gate
 boolean clock;   //if it is a clock
 Port conPort;
 int timing;    //only used for clock and timer gate
 boolean push;   //if it is a push button
 Switch (int x, int y){
   this.xcoor=x;
   this.ycoor=y;
  
   this.tHis=false;
   this.connected=false;
   this.con=null;
   this.connectgate=false;
   this.conPort=null;
   this.clock=false;
   this.push=false;
   this.timing=0;
 }
void appear(){   //appearing on screen and calculates how it should appear
  
  if (!this.tHis){
     fill(100, 100, 100);
     
  }
   else{
     fill(0, 255, 0);
     
   }
   if (this.push==false)   
     rect(this.xcoor-30,this.ycoor-30,60,60);
   else
     ellipse(this.xcoor,this.ycoor,60,60);
   fill(255);
   textSize(32);
  
   if (this.clock==false &&this.push==false)
    text("S",this.xcoor-8, this.ycoor+13);
    else if (this.clock)
    text("C",this.xcoor-9, this.ycoor+13);
    else if(this.push)
    text("P",this.xcoor-9, this.ycoor+13);
    
    ellipse(this.xcoor+30, this.ycoor-2,12, 12);
    if (this.connected){
      if (this.tHis)
        stroke(0, 255, 0);
      else
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
  
  void update(){   //updates value for clock, see if they should be open
    if (this.clock){
    if (this.timing%201>100)
    this.tHis=true;
    else
    this.tHis=false;
    }
  }

  
}
