void Scene2() {
  if (loop) {
    time = millis();
    loop = false;
  }
  translate(-worldCamera.pos.x, -worldCamera.pos.y);
  worldCamera.draw();
  background(0, 200, 0);
  for (float grassX = 0; grassX <= 600000; grassX += 4160)
  {
    image(grass, grassX, 0, 4160, 3920);
  }
  rectMode(CENTER);
  fill(0);
  rect(400, height/2, 6000000, 200);
  image(img, carX, height/2-90, 164, 64);
  fill(255, 255, 255);
  for (stripeX = 60; stripeX < 60200; stripeX +=120) {
    rect(stripeX, height/2, 70, 20);
  }
  println(score);
  textSize(32);
  text("Score: "+score, carX, 50); 
  text("Concentration " +currentAttention, carX, 85);
  speed = map(currentAttention, 0, 100, 0, 50); // mapping the concentration 0-100 to 0-50
  carX += speed;
  score += speed;
  println(millis() - time); // comment out after testin
  if (millis() - time > 45000) { //this is the exit function for the time, so when you add the time selector in the begining, replace 60000 with a var.
    mp = 3;
  }
}
