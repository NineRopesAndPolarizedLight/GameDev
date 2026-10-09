// Julian Bryson | 17 Sept 2026 | Godhood
import processing.sound.*;

SoundFile Beam1;
ArrayList<Beam> beams = new ArrayList<Beam>();
ArrayList<Enemy> Enemies = new ArrayList<Enemy>();
ArrayList<Power> powers = new ArrayList<Power>();

Eye e1;
Enemy v1;
Timer enemyDist, puDist;
int score, enemyCount, enemiesOffScreen;
boolean play;
PImage gameOverImage, gameStartImage;

void setup() {
  size(500, 500);
  e1 = new Eye();
  v1 = new Enemy();
  enemyDist = new Timer(2000);
  puDist = new Timer(5000);
  enemyDist.start();
  puDist.start();
  score = 0;
  enemyCount = 0;
  enemiesOffScreen = 0;
  play = false;
  gameOverImage = loadImage("gameOver.png");
  gameStartImage = loadImage("gameStart.png");
  Beam1 = new SoundFile(this, "sound.wav"); // Ensure file extension matches your asset
}

void draw() {
  noCursor();
  
  // Check for start screen
  if (!play) {
    startScreen();
  } else {
    background(0, 30, 70);
    e1.display();
    e1.move(mouseX, mouseY);
  
    // Display and move enemies + collision detection with player (e1)
    for (int i = Enemies.size() - 1; i >= 0; i--) {
      Enemy s = Enemies.get(i);
      s.display();
      s.move();
      
      if (s.isHit(e1)) {
        Enemies.remove(i);
        e1.health -= 10;
      } else if (s.health <= 0) {
        Enemies.remove(i);
        score += s.size;
        score += enemyCount * 10;
      } else if (s.isOffScreen()) {
        Enemies.remove(i);
        enemiesOffScreen += 1;
      }
    }

    // Display and move powerups
    for (int i = powers.size() - 1; i >= 0; i--) {
      Power p = powers.get(i);
      p.display();
      p.move();
      
      if (p.isHit(e1)) {
        if (p.size > 60) {
          e1.health += 10;
        } else {
          e1.size += 100;
        }
        powers.remove(i);
      } else if (p.isOffScreen()) {
        powers.remove(i);
      }
    }
  
    // Display and move beams + collision with enemies
    for (int i = beams.size() - 1; i >= 0; i--) {
      Beam l = beams.get(i);
      l.display();
      l.move();
      
      for (int j = Enemies.size() - 1; j >= 0; j--) {
        Enemy e = Enemies.get(j);
        if (l.isHit(e)) {
          beams.remove(i);
          e.health -= 50;
          break; // Break inner loop after hitting an enemy
        }
      }
      
      if (i < beams.size() && l.isOffScreen()) {
        beams.remove(i);
      }
    }

    // Spawn enemies
    if (enemyDist.isFinished()) {
      enemyDist.start();
      Enemies.add(new Enemy(int(random(width)), -60));
      enemyCount += 1;
    }

    // Spawn powerups
    if (puDist.isFinished()) {
      puDist.start();
      powers.add(new Power(int(random(width)), -60));
    }

    if (e1.health <= 0 || enemiesOffScreen > 9) {
      gameOver();
    }
    
    infoPanel();
  }
}

void mousePressed() {
  if (play) {
    beams.add(new Beam(e1.x, e1.y));
    if (Beam1 != null) {
      Beam1.play();
    }
  }
}

void infoPanel() {
  rectMode(CENTER);
  fill(127, 127);
  rect(width / 2, 20, width, 40);
  fill(255);
  text("Score : " + score, 20, 35);
  
  if (e1.health <= 10) {
    fill(255, 0, 0);
  } else {
    fill(255);
  }
  text("Health : " + e1.health, 400, 35);
  
  if (enemiesOffScreen >= 9) {
    fill(255, 0, 0);
  } else {
    fill(255);
  }
  text("Enemies Missed : " + enemiesOffScreen, 200, 35);
}

void startScreen() {
  imageMode(CENTER);
  background(gameStartImage);
  fill(255);
  if (keyPressed) {
    play = true;
  }
}

void gameOver() {
  imageMode(CENTER);
  background(gameOverImage);
  fill(255);
  noLoop();
}
