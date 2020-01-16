class Outport{
  int xcoor;
  int ycoor;
  boolean tHis;
  boolean connected;
  Port conPort;
  Light lightp;
  Outport (int x, int y){
    this.xcoor=x;
    this.ycoor=y;
    this.tHis=false;
    this.connected=false;
    this.conPort=null;
    this.lightp=null;
    
  }
  void connectp(Port a){
    this.conPort=a;
   a.connectorp=this;
   this.connected=true;
   a.connected=true;
    
    
  }
  
  void connectl(Light p){
    this.lightp=p;
    p.conout=this;
    this.connected=true;
    
    p.connected=true;
  
  
}
  
  
}
