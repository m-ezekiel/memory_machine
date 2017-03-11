// Filename: memory_machine.pde
// Author: Mario Ezekiel H. (m-ezekiel.com)
// Date: February 10, 2017
// Psychometric Memory Transcription Machine is a playback/recording device for analyzing keystroke dynamics during invisible writing sessions. 

String title, summary, privacyNotice;

int state = 0; // The current state
final int MAIN_MENU = 0;
final int RECALL_MENU = 1;
final int VIEW_MEMORY = 2;
final int DISCLAIMER = 3;
final int RECORDING = 4;

int playBtnX, playBtnY, playWidth, playHeight;
int recordBtnX, recordBtnY, recordWidth, recordHeight;
int doneBtnX, doneBtnY, doneWidth, doneHeight;
color playColor, recordColor, doneColor, baseColor;
color playHighlight, recordHighlight, doneHighlight;
color currentColor;
boolean playOver = false;
boolean recordOver = false;
boolean doneOver = false;


// Variables for play_fxn
PFont h1, h2, h3, h4;
String[] lines;
int index = 0;
int gap = 10;
int x_pos = 10;
int y_pos = 10;

// Variables for record_fxn
PrintWriter output;
String task = "memory";
char k;


void setup() {
  size(800, 600);
  background(0);

  title = "Psychometric \nMemory \nTranscription \nMachine";

  summary = "The Psychometric Memory Transcription Machine is a \nplayback/recording device for analyzing keystroke \ndynamics during invisible writing sessions. \n\nClick 'View memory' to see the last recorded session \nor click 'Create new' to initiate a new anonymized \nrecord.";

  privacyNotice = "For your privacy and to protect the fidelity of your memories, the screen will remain blank \nas you type.  No text will appear, but everything will be recorded to facilitate future memory \nrecall and language processing analysis. \n\nPlease begin typing to initiate your session and click done to return to the main menu.";

  playBtnX = width/2 - width/3;
  playBtnY = height/2;
  playWidth = width/5;
  playHeight = playWidth/2;
  playColor = color(100);
  playHighlight = color(150);

  recordBtnX = width/2 + width/6;
  recordBtnY = height/2;
  recordWidth = width/5;
  recordHeight = recordWidth/2;
  recordColor = color(100);
  recordHighlight = color(150);

  doneBtnX = width - 100;
  doneBtnY = height - 50;
  doneWidth = width/10;
  doneHeight = doneWidth/2;
  doneColor = color(20);
  doneHighlight = color(100);

  // Load playback information
  lines = loadStrings("anonLetter.txt");
  printArray(PFont.list());
  h1 = loadFont("Monospaced-36.vlw");
  h2 = loadFont("STX-32.vlw");
  h3 = loadFont("Monospaced-14.vlw");
  h4 = loadFont("STXihei-16.vlw");
  textAlign(LEFT, TOP);

  // create new file to write to catch random keypresses
  output = createWriter("data/null.txt");

}

void draw() {
  update(mouseX, mouseY);
  noStroke();
  fill(170);

  switch (state) {
    case MAIN_MENU:

      background(0);
      textFont(h1);
      text(title, 20, 20);
      textFont(h3);
      text(summary, width*5/11, 30);
      cursor();

      if (playOver)
        fill(playHighlight);
      else 
        fill(playColor);
      rect(playBtnX, playBtnY, playWidth, playHeight);
      fill(200);
      textFont(h2);
      text("View \nmemory", playBtnX+5, playBtnY+5);

      if (recordOver)
        fill(recordHighlight);
      else
        fill(recordColor);
      rect(recordBtnX, recordBtnY, recordWidth, recordHeight);
      fill(200);
      textFont(h2);
      text("Create \nnew", recordBtnX+5, recordBtnY+5);

      // DIAGNOSTICS
      // println("MAIN_MENU state");

      break;

    case RECALL_MENU:
      // things
      break;

    case VIEW_MEMORY:
      textFont(h3);
      view_memory();

      // DIAGNOSTICS
      // println("VIEW_MEMORY state");

      break;

    case DISCLAIMER:
      background(0);
      textFont(h3);
      text(privacyNotice, 20, 20);
      println("DISCLAIMER state");
      noLoop();
      break;

    case RECORDING:
      background(0);

      if (mouseX > width*0.8 || mouseY > height*0.6 || mouseY < height*0.4) {
        if (doneOver)
          fill(doneHighlight);
        else 
         fill(doneColor);
        stroke(30);
        rect(doneBtnX, doneBtnY, doneWidth, doneHeight);
        fill(200);
        textFont(h4);
        text("DONE", doneBtnX + 15, doneBtnY + 15);
      }

      fill(120);
      textFont(h3);
      text("Listening...", width/2, height/2);

      // println("RECORDING state");
      break;
  }
}