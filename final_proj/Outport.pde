class Outport{    //the outputing ports of splits
  int xcoor;
  int ycoor;
  boolean tHis;     //if it is powered or not
  boolean connected;
  Port conPort;   //the port it is connected to, null if it isn't connected to any
  Light lightp;   //same as above except with light
  Outport (int x, int y){
    this.xcoor=x;
    this.ycoor=y;
    this.tHis=false;
    this.connected=false;
    this.conPort=null;
    this.lightp=null;
    
  }
  void connectp(Port a){   //connects to port
   this.conPort=a;
   a.connectorp=this;
   this.connected=true;
   a.connected=true;
    
    
  }
  
  void connectl(Light p){   //connects to light
    this.lightp=p;
    p.conout=this;
    this.connected=true;    
    p.connected=true;
  
  
}
  
  
}
