class Split{
  int xcoor;
  int ycoor;
  boolean tHis;  //whether if it is powered
  ArrayList <Outport> outputs;  //list of output ports
  Port input;  //its input port
  Split(int x, int y){
    this.xcoor=x;
    this.ycoor=y;
    this.tHis=false;
    this.outputs=new ArrayList<Outport>();
    Port b=new Port(x-30, y);
    this.input=b;
    for (int i=0;i<4;i++){
      Outport a=new Outport(x+30, y-30+i*20);
      this.outputs.add(a);
    }
    
  }
  void appear(){   //appear on screen
    fill(100, 100, 100);
    rect(this.xcoor-30,this.ycoor-30,60, 60);
    fill(255);
    ellipse(this.input.xcoor, this.input.ycoor,12, 12);
    for (int i=0;i<this.outputs.size();i++){
      Outport o=this.outputs.get(i);
      ellipse(o.xcoor, o.ycoor, 12, 12);
      
      if (o.connected){   //connection lines
        if (o.tHis)
          stroke(0, 255, 0);
        else
          stroke(255);
        if (o.conPort!=null){
        //stroke(255);
          line(o.xcoor, o.ycoor, o.conPort.xcoor, o.conPort.ycoor);
          stroke(0);
        }
        else if (o.lightp!=null){
          //stroke(255);
          line(o.xcoor, o.ycoor, o.lightp.xcoor-5, o.lightp.ycoor);
          stroke(0);
        }
        stroke(0);
      }
      
      
    }
    
  }
  //void connectp(Port a){
  //}
  
  
}
