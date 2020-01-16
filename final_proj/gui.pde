/* =========================================================
 * ====                   WARNING                        ===
 * =========================================================
 * The code in this tab has been generated from the GUI form
 * designer and care should be taken when editing this file.
 * Only add/edit code inside the event handlers i.e. only
 * use lines between the matching comment tags. e.g.

 void myBtnEvents(GButton button) { //_CODE_:button1:12356:
     // It is safe to enter your event code here  
 } //_CODE_:button1:12356:
 
 * Do not rename this tab!
 * =========================================================
 */

synchronized public void win_draw1(PApplet appc, GWinData data) { //_CODE_:window1:969096:
  appc.background(230);
} //_CODE_:window1:969096:

public void addswitches(GButton source, GEvent event) { //_CODE_:addswitch:390153:
  Switch temps=new Switch(int(random(100, 600)), int(random(100, 600)));
  switchlist.add(temps);
} //_CODE_:addswitch:390153:

public void lightbulb(GButton source, GEvent event) { //_CODE_:addlight:981093:
  Light templ=new Light(int(random(100, 600)), int(random(100, 600)));
  lightlist.add(templ);
  
} //_CODE_:addlight:981093:

public void notgg(GButton source, GEvent event) { //_CODE_:notgate:635071:
  Gate bill=new Gate(int(random(100, 600)), int(random(100, 600)),1);
  gatelist.add(bill);
} //_CODE_:notgate:635071:

public void addinput(GButton source, GEvent event) { //_CODE_:button1:361252:
  if (gateclicked)
  tempgate.addinput();
} //_CODE_:button1:361252:

public void andadd(GButton source, GEvent event) { //_CODE_:buttonand:458575:
  Gate bill=new Gate(int(random(100, 600)), int(random(100, 600)),0);
  gatelist.add(bill);
} //_CODE_:buttonand:458575:

public void addor(GButton source, GEvent event) { //_CODE_:button2:311395:
  Gate bill=new Gate(int(random(100, 600)), int(random(100, 600)),2);
  gatelist.add(bill);
} //_CODE_:button2:311395:

public void addclock(GButton source, GEvent event) { //_CODE_:buttonclock:485249:
  Switch temps=new Switch(int(random(100, 600)), int(random(100, 600)));
  temps.clock=true;
  switchlist.add(temps);
} //_CODE_:buttonclock:485249:

public void inputminus(GButton source, GEvent event) { //_CODE_:buttonminus:591902:
  if (gateclicked)
  tempgate.removeinput();
} //_CODE_:buttonminus:591902:

public void Splitted(GButton source, GEvent event) { //_CODE_:buttonsplit:732394:
  Split useful=new Split(int(random(100, 600)), int(random(100, 600)));
  splitlist.add(useful);
} //_CODE_:buttonsplit:732394:

public void clearing(GButton source, GEvent event) { //_CODE_:buttonclear:724231:
cleare();
  } //_CODE_:buttonclear:724231:

public void Talbot(GButton source, GEvent event) { //_CODE_:Talbotton:419763:
  Gate bill=new Gate(int(random(100, 600)), int(random(100, 600)),10);
  gatelist.add(bill);
} //_CODE_:Talbotton:419763:

public void setone(GButton source, GEvent event) { //_CODE_:buttonset1:562945:
  cleare();
  addsplitsrec(100, layer, layer);
  
  
  
} //_CODE_:buttonset1:562945:

public void xor(GButton source, GEvent event) { //_CODE_:buttonxor:783587:
  Gate bill=new Gate(int(random(100, 600)), int(random(100, 600)),5);
  gatelist.add(bill);
} //_CODE_:buttonxor:783587:

public void preset1layer(GSlider source, GEvent event) { //_CODE_:sliderpreset1:652473:
  float a=source.getValueF();
  layer=int(a);
} //_CODE_:sliderpreset1:652473:

public void notand(GButton source, GEvent event) { //_CODE_:buttonnand:903576:
  Gate bill=new Gate(int(random(100, 600)), int(random(100, 600)),3);
  gatelist.add(bill);
} //_CODE_:buttonnand:903576:

public void notor(GButton source, GEvent event) { //_CODE_:buttonnor:951630:
  Gate bill=new Gate(int(random(100, 600)), int(random(100, 600)),4);
  gatelist.add(bill);
} //_CODE_:buttonnor:951630:

public void exnor(GButton source, GEvent event) { //_CODE_:buttonxnor:250046:
  Gate bill=new Gate(int(random(100, 600)), int(random(100, 600)),6);
  gatelist.add(bill);
} //_CODE_:buttonxnor:250046:

public void reda(GButton source, GEvent event) { //_CODE_:button3:678793:
  Light templ=new Light(int(random(100, 600)), int(random(100, 600)));
  templ.filling=color(255, 0, 0);
  lightlist.add(templ);
} //_CODE_:button3:678793:

public void greena(GButton source, GEvent event) { //_CODE_:button4:613347:
  Light templ=new Light(int(random(100, 600)), int(random(100, 600)));
  templ.filling=color(0, 255, 0);
  lightlist.add(templ);
} //_CODE_:button4:613347:

public void comparing(GButton source, GEvent event) { //_CODE_:buttoncompare:954755:
  Gate bill=new Gate(int(random(100, 600)), int(random(100, 600)),7);
  gatelist.add(bill);
} //_CODE_:buttoncompare:954755:

public void presettwo(GButton source, GEvent event) { //_CODE_:buttonpreset:772569:
  cleare();
  Switch a=new Switch(100, 350);
  a.tHis=true;
  switchlist.add(a);
  Split b=new Split(200, 350);
  Split b2=new Split(400, 200);
  Split b3=new Split(810,200);
  splitlist.add(b);
  splitlist.add(b2);
  splitlist.add(b3);
 
  Gate c=new Gate(300, 200, 10);
  Gate c2=new Gate(500, 200, 1);
  Gate c3=new Gate(500, 350,0);
  Gate c4= new Gate(740, 350, 10);
  Gate c5=new Gate(860, 350, 1);
  Gate c6=new Gate(860, 550, 0);
  Gate c7=new Gate(960, 550, 10);
  
  gatelist.add(c);
  gatelist.add(c2);
  gatelist.add(c3);
  gatelist.add(c4);
  gatelist.add(c5);
  gatelist.add(c6);
  gatelist.add(c7);
  
  Light d=new Light(800, 100);
  Light d2=new Light(850, 100);
  Light d3=new Light(900, 100);
  d.filling=color(255, 0, 0);
  d3.filling=color(0, 255, 0);
  lightlist.add(d);
  lightlist.add(d2);
  lightlist.add(d3);
  
  
  
  for (int i=0;i<4;i++){
  c.removeinput();
  c4.removeinput();
  c7.removeinput();
  }
  a.connectg(b.input);
  b.outputs.get(0).connectp(c.inputs.get(0));
  c.connectg(b2.input);
  b2.outputs.get(0).connectl(d);
  b2.outputs.get(1).connectp(c2.inputs.get(0));
  c2.connectg(c3.inputs.get(0));
  b.outputs.get(1).connectp(c3.inputs.get(1));
  c3.connectg(c4.inputs.get(0));
  c4.connectg(b3.input);
  b3.outputs.get(0).connectl(d2);
  b3.outputs.get(1).connectp(c5.inputs.get(0));
  b.outputs.get(2).connectp(c6.inputs.get(1));
  c5.connectg(c6.inputs.get(0));
  c6.connectg(c7.inputs.get(0));
  c7.connect(d3);
  
  
  
  
} //_CODE_:buttonpreset:772569:

public void pushing(GButton source, GEvent event) { //_CODE_:buttonpush:260860:
  Switch temps=new Switch(int(random(100, 600)), int(random(100, 600)));
  temps.push=true;
  switchlist.add(temps);
} //_CODE_:buttonpush:260860:

synchronized public void win_draw2(PApplet appc, GWinData data) { //_CODE_:window2:773526:
  appc.background(230);
} //_CODE_:window2:773526:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setCursor(ARROW);
  surface.setTitle("Sketch Window");
  window1 = GWindow.getWindow(this, "Tools", 0, 0, 700, 500, JAVA2D);
  window1.noLoop();
  window1.addDrawHandler(this, "win_draw1");
  addswitch = new GButton(window1, 0, 70, 80, 30);
  addswitch.setText("switch");
  addswitch.addEventHandler(this, "addswitches");
  addlight = new GButton(window1, 10, 400, 80, 30);
  addlight.setText("Yellow Light");
  addlight.addEventHandler(this, "lightbulb");
  notgate = new GButton(window1, 0, 130, 80, 30);
  notgate.setText("Not gate");
  notgate.addEventHandler(this, "notgg");
  button1 = new GButton(window1, 327, 248, 80, 30);
  button1.setText("plusinputs");
  button1.addEventHandler(this, "addinput");
  buttonand = new GButton(window1, 0, 170, 80, 30);
  buttonand.setText("And gate");
  buttonand.addEventHandler(this, "andadd");
  button2 = new GButton(window1, 0, 210, 80, 30);
  button2.setText("Or gate");
  button2.addEventHandler(this, "addor");
  buttonclock = new GButton(window1, 90, 70, 80, 30);
  buttonclock.setText("Clock");
  buttonclock.addEventHandler(this, "addclock");
  buttonminus = new GButton(window1, 329, 284, 80, 30);
  buttonminus.setText("minusinput");
  buttonminus.addEventHandler(this, "inputminus");
  buttonsplit = new GButton(window1, 90, 320, 80, 30);
  buttonsplit.setText("Split");
  buttonsplit.addEventHandler(this, "Splitted");
  buttonclear = new GButton(window1, 270, 10, 80, 30);
  buttonclear.setText("clear");
  buttonclear.addEventHandler(this, "clearing");
  Talbotton = new GButton(window1, 180, 250, 80, 30);
  Talbotton.setText("Timer gate");
  Talbotton.addEventHandler(this, "Talbot");
  buttonset1 = new GButton(window1, 390, 70, 80, 30);
  buttonset1.setText("Preset 1");
  buttonset1.addEventHandler(this, "setone");
  buttonxor = new GButton(window1, 180, 170, 80, 30);
  buttonxor.setText("XOR");
  buttonxor.addEventHandler(this, "xor");
  sliderpreset1 = new GSlider(window1, 490, 60, 100, 40, 10.0);
  sliderpreset1.setShowValue(true);
  sliderpreset1.setLimits(1, 1, 5);
  sliderpreset1.setNbrTicks(5);
  sliderpreset1.setStickToTicks(true);
  sliderpreset1.setShowTicks(true);
  sliderpreset1.setNumberFormat(G4P.INTEGER, 0);
  sliderpreset1.setOpaque(false);
  sliderpreset1.addEventHandler(this, "preset1layer");
  buttonnand = new GButton(window1, 0, 250, 80, 30);
  buttonnand.setText("NAND");
  buttonnand.addEventHandler(this, "notand");
  buttonnor = new GButton(window1, 180, 130, 80, 30);
  buttonnor.setText("NOR");
  buttonnor.addEventHandler(this, "notor");
  buttonxnor = new GButton(window1, 180, 210, 80, 30);
  buttonxnor.setText("XNOR");
  buttonxnor.addEventHandler(this, "exnor");
  label1 = new GLabel(window1, 100, 40, 80, 20);
  label1.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label1.setText("Inputs");
  label1.setOpaque(false);
  label2 = new GLabel(window1, 90, 120, 80, 20);
  label2.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label2.setText("Logic Gate");
  label2.setOpaque(false);
  label3 = new GLabel(window1, 90, 380, 80, 20);
  label3.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label3.setText("Outputs");
  label3.setOpaque(false);
  label4 = new GLabel(window1, 490, 50, 110, 20);
  label4.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label4.setText("Number of layers for preset 1");
  label4.setOpaque(false);
  label6 = new GLabel(window1, 320, 197, 90, 45);
  label6.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label6.setText("Adding input port on logic gates");
  label6.setOpaque(false);
  label7 = new GLabel(window1, 431, 214, 250, 110);
  label7.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label7.setText("Click on a logic gate to select it, then click plusinputs and minus inputs to add and remove the number of input port. Click anywhere else in the display screen to diselect. (Can not be used for NOT gate and comparator gate)");
  label7.setOpaque(false);
  button3 = new GButton(window1, 100, 400, 80, 30);
  button3.setText("Red Light");
  button3.addEventHandler(this, "reda");
  button4 = new GButton(window1, 190, 400, 80, 30);
  button4.setText("Green Light");
  button4.addEventHandler(this, "greena");
  buttoncompare = new GButton(window1, 180, 283, 80, 30);
  buttoncompare.setText("Comparator gate");
  buttoncompare.addEventHandler(this, "comparing");
  buttonpreset = new GButton(window1, 390, 110, 80, 30);
  buttonpreset.setText("Preset 2");
  buttonpreset.addEventHandler(this, "presettwo");
  buttonpush = new GButton(window1, 180, 70, 80, 30);
  buttonpush.setText("Push Button");
  buttonpush.addEventHandler(this, "pushing");
  label11 = new GLabel(window1, 260, 70, 130, 50);
  label11.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label11.setText("Preset 1 can lag the program due to its large amount of items");
  label11.setOpaque(false);
  window2 = GWindow.getWindow(this, "Instruction", 0, 0, 400, 400, JAVA2D);
  window2.noLoop();
  window2.addDrawHandler(this, "win_draw2");
  label5 = new GLabel(window2, 103, 134, 210, 160);
  label5.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label5.setText("To connect two things, hold down left click on the output port of the first item (Ex: switch) and drag the line appeared to the input port of the second item(Ex: lightbulb). Does not work vice versa. To delete connections, click on one of the ports of the connection. ");
  label5.setOpaque(false);
  label8 = new GLabel(window2, 140, 140, 130, 20);
  label8.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label8.setText("How to connect things:");
  label8.setOpaque(false);
  label9 = new GLabel(window2, 80, 340, 250, 40);
  label9.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label9.setText("To delete things, drag the control you want to delete to the bottom right corner where it says trash");
  label9.setOpaque(false);
  label10 = new GLabel(window2, 120, 40, 160, 20);
  label10.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label10.setText("Click on switches to turn it on");
  label10.setOpaque(false);
  label12 = new GLabel(window2, 68, 61, 286, 88);
  label12.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label12.setText("To add inputs, logic gates, or outputs, click on the tools window and click on the item you want. It will appear at a random position on your screen and you can drag it around. ");
  label12.setOpaque(false);
  window1.loop();
  window2.loop();
}

// Variable declarations 
// autogenerated do not edit
GWindow window1;
GButton addswitch; 
GButton addlight; 
GButton notgate; 
GButton button1; 
GButton buttonand; 
GButton button2; 
GButton buttonclock; 
GButton buttonminus; 
GButton buttonsplit; 
GButton buttonclear; 
GButton Talbotton; 
GButton buttonset1; 
GButton buttonxor; 
GSlider sliderpreset1; 
GButton buttonnand; 
GButton buttonnor; 
GButton buttonxnor; 
GLabel label1; 
GLabel label2; 
GLabel label3; 
GLabel label4; 
GLabel label6; 
GLabel label7; 
GButton button3; 
GButton button4; 
GButton buttoncompare; 
GButton buttonpreset; 
GButton buttonpush; 
GLabel label11; 
GWindow window2;
GLabel label5; 
GLabel label8; 
GLabel label9; 
GLabel label10; 
GLabel label12; 
