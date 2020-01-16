class Gate{
  int xcoor;
  int ycoor;
  int type;
  ArrayList <Port>inputs;
  IntList portcoor;
  boolean outputs;
  boolean connected;
  Port conPort;
  Light con;
  int timing;
  
  Gate(int x, int y, int t){
    this.xcoor=x;
    this.ycoor=y;
    this.type=t;
    
    this.outputs=false;
    this.connected=false;
    this.conPort=null;
    this.con=null;
    this.portcoor=new IntList();
    this.inputs=new ArrayList<Port>();
    this.timing=0;
    if (t==10){
      for (int i=0;i<4;i++){
        Port a =new Port (x-30, y-30+i*20);
        this.inputs.add(a);
        
      }
      for (int j=1;j<4;j++){
        Port a =new Port (x-30+j*20, y-30);
        this.inputs.add(a);
      }
    }
    else if (t!=1){
    this.portcoor.append(y-30);
    this.portcoor.append(y+30);
    Port a =new Port(x-30, this.portcoor.get(0));
    this.inputs.add(a);
    a =new Port(x-30, this.portcoor.get(1));
    this.inputs.add(a);
    }
    else if (t==1){
      this.portcoor.append(y);
    
      Port a=new Port(x-30, y);
    
      this.inputs.add(a);
      a.owner=this;
    }
    
    
  }

  void appear(){
  
  
   fill(200, 177, 0);
   rect(this.xcoor-30,this.ycoor-30,60,60);
   fill(255);
   textSize(20);
   if (this.type==0)
    text("AND",this.xcoor-20, this.ycoor+8);
   else if (this.type==1)
   text("NOT",this.xcoor-20, this.ycoor+8);
   else if (this.type==2)
   text("OR",this.xcoor-17, this.ycoor+8);
   else if (this.type==10)
   text("T",this.xcoor-6, this.ycoor+11);
    for (int i=0;i<this.inputs.size();i++){
      if (this.inputs.get(i).tHis)
      fill(255, 255, 0);
      else
      fill(255);
    ellipse(this.inputs.get(i).xcoor, this.inputs.get(i).ycoor,12, 12);
    }
    fill(255);
    ellipse(this.xcoor+30, this.ycoor-2,12, 12);
    if (this.connected){
      
      stroke(255);
      try{
    line(this.xcoor+30, this.ycoor, this.con.xcoor-6, this.con.ycoor+4);
      }
      catch (Exception e){
        line(this.xcoor+30, this.ycoor,this.conPort.xcoor,this.conPort.ycoor);
        
      }
    stroke(0);
    }
}

 void connect (Light a){
    this.con=a;
    a.congate=this;
    this.connected=true;
    a.connected=true;
 }

 void addinput(){
   if (this.inputs.size()<7){
   Port added=new Port(this.xcoor-30, 0);
   this.inputs.add(added);
   if (this.inputs.size()<=4){
   for (int i=0;i<this.inputs.size();i++){
     this.inputs.get(i).ycoor=this.ycoor-30+i*(60/(this.inputs.size()-1));
   }
   }
   else if (this.inputs.size()>4 && this.inputs.size()<8){
     for (int i=0;i<4;i++){
     this.inputs.get(i).ycoor=this.ycoor-30+i*(60/(4-1));
   }
     for (int j=4;j<this.inputs.size();j++){
       int a=j-3;
       this.inputs.get(j).xcoor=this.xcoor-30+a*(60/(this.inputs.size()-4));
       this.inputs.get(j).ycoor=this.ycoor-30;
     }
   }
   }
 }
 void removeinput(){
   if (this.inputs.size()>2 || (this.type==1 && this.inputs.size()==2)){
   this.inputs.remove(this.inputs.size()-1);
   if (this.inputs.size()<=4){
   for (int i=0;i<this.inputs.size();i++){
     this.inputs.get(i).ycoor=this.ycoor-30+i*(60/(this.inputs.size()-1));
   }
   }
   else if (this.inputs.size()>4 && this.inputs.size()<8){
     for (int i=0;i<4;i++){
     this.inputs.get(i).ycoor=this.ycoor-30+i*(60/(4-1));
   }
     for (int j=4;j<this.inputs.size();j++){
       int a=j-3;
       this.inputs.get(j).xcoor=this.xcoor-30+a*(60/(this.inputs.size()-4));
       this.inputs.get(j).ycoor=this.ycoor-30;
     }
   }
   }
   
   
 }
 
 void connectg(Port a){
   this.conPort=a;
   a.connectorg=this;
   this.connected=true;
   a.connected=true;
 }
    
}
