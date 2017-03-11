// Filename: play_fxn.pde (ATT: memory_machine.pde)
// Author: Mario Ezekiel H. (m-ezekiel.com)
// Date: February 10, 2017


void view_memory() {
  noCursor();
  frameRate(24);
  // Initialize string array from word vector
  String[] word_vec = split(lines[index], '\t');

  println("index: "+index);
  println("lines.length: "+lines.length);
  // This is some weird hacky code, but it works.
  if (index == lines.length - 1) { 
    state = MAIN_MENU; 
    index = 0;
    x_pos = 10;
    y_pos = 10;
  }

  if (index < lines.length - 1) {
    int word_len = word_vec[0].length();
    float char_IKI = float(word_vec[1]);

    if (char_IKI > 0.275) {frameRate(3);}

    fill(255);
    drawType(word_vec, x_pos, y_pos);
    x_pos += word_len*8 + gap;
    filter(BLUR, 1);

    if (x_pos > width - 60) {
      x_pos = 10;
      y_pos += 20;
    }
    index = index + 1; 
  } 
}

void drawType(String[] s, int x, int y) {
  text(s[0], x, y);
}