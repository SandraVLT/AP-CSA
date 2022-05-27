Table list;
int rows;
int cols;
int row;
int col;


void setup(){
  size(1400, 800);
 background(0,0,0);
 list =  loadTable("https://raw.githubusercontent.com/SandraVLT/AP-CSA/main/songs_normalize.csv", "header");
 rows = list.getRowCount();
 cols = list.getColumnCount();
 row = 0;
}

void getInfo (){
  background(0,0,0);
  fill(255, 255, 255);
  textSize(40);
  text("Title: " + list.getString(row, 1), 300, 100);
  text("Artist: " + list.getString(row, 0), 300, 200);
  text("Explicit: " + list.getString(row, 3), 300, 300);
  text("Year: " + list.getString(row, 4), 300, 400);
  text("Popularity: " + list.getString(row, 5) + "/89", 300, 500);
  
  int y = height/9 + 4*height/5 - 50;
  
  int pw = floor(map(list.getInt(row, 5), 0, 89, 0, 89*height/95));
  fill(255, 0, 0);
  rect(width/9, 25, 50, 89*height/95);
  fill(0, 255, 0);
  rect(width/9, 25, 50,pw);
  textSize(20);
  fill(0,0,255);
  text("Press the P key to move to previous song in the list. Press N key to move to next song. Press the R key to move to a random song. Bar shifts to match the popularity rating of each song." ,3*width/5, height/3, 300, 500);
  }
  

void keyPressed(){
 if ((key == 'n') && (row < rows)){
   row += 1;
   getInfo();
 }
 if (key == 'r'){
   row = floor(random(1, rows));
   getInfo();
 }
 if ((key == 'p') && (row > 1)){
   row -= 1;
   getInfo();
 }
}

void draw(){
 getInfo();
}
