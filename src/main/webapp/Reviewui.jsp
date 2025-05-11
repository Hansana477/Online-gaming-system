<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Game Review - NextPlay</title>
  <link rel="stylesheet" href="css/stylehf.css">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Orbitron:wght@500&display=swap');

    body {
      margin: 0;
      font-family: 'Orbitron', sans-serif;
      background-color: #0b0b0b;
      color: #00f9ff;
    }

    .header {
      background-color: #111;
      padding: 1rem;
      text-align: center;
      font-size: 2rem;
      border-bottom: 2px solid #00f9ff;
    }

    .section-title {
      text-align: center;
      margin-top: 2rem;
      font-size: 2rem;
      color: #00f9ff;
      text-shadow: 0 0 10px #00f9ff;
    }

    .review-form {
      max-width: 600px;
      margin: 2rem auto;
      background-color: #111;
      padding: 2rem;
      border-radius: 10px;
      box-shadow: 0 0 20px #00f9ff;
      border: 2px solid #00f9ff;
    }

    .form-group {
      margin-bottom: 1.5rem;
    }

    label {
      display: block;
      margin-bottom: 0.5rem;
      color: #00f9ff;
      font-size: 1rem;
    }

    input, textarea, select {
      width: 100%;
      padding: 0.75rem;
      background-color: #000;
      border: 1px solid #00f9ff;
      border-radius: 5px;
      color: #00f9ff;
      font-family: 'Orbitron', sans-serif;
    }

    textarea {
      height: 100px;
      resize: vertical;
    }

    .submit-btn {
      background-color: transparent;
      border: 2px solid #00f9ff;
      color: #00f9ff;
      padding: 0.75rem 1.5rem;
      font-size: 1rem;
      cursor: pointer;
      transition: all 0.3s ease;
      width: 100%;
    }

    .submit-btn:hover {
      background-color: #00f9ff;
      color: #000;
      box-shadow: 0 0 10px #00f9ff;
    }

    footer {
      text-align: center;
      padding: 1rem;
      margin-top: 2rem;
      font-size: 0.9rem;
      color: #555;
    }
  </style>
</head>
<body>
  <header class="navbar">
    <div class="logo">NextPlay</div>
    <nav class="nav-links" id="navLinks">
      <a href="index.jsp" class="active">Home</a>
      <a href="store.jsp">Store</a>
      <a href="feedback.jsp">Feedback</a>
      <a href="#">News</a>
      <a href="#">Support</a>
      <div class="auth-buttons">
        <a href="#" class="btn login">Login</a>
        <a href="#" class="btn register">Register</a>
      </div>
    </nav>
    <div class="menu-toggle" onclick="toggleMenu()">☰</div>
  </header>

  
  <h2 class="section-title">ADD YOUR REVIEW</h2>

  <form class="review-form" action="addReview" method="post">
    <div class="form-group">
      <label for="gameid">Game ID</label>
      <input type="text" id="gameid" name="gameid" required>
    </div>

    <div class="form-group">
      <label for="userid">User ID</label>
      <input type="text" id="userid" name="userid" required>
    </div>

    <div class="form-group">
      <label for="review">Review</label>
      <textarea id="review" name="review" required></textarea>
    </div>

    <div class="form-group">
      <label for="rate">Rating (1 - 10)</label>
      <input type="number" id="rate" name="rate" min="1" max="10" required>
    </div>

    <button type="submit" class="submit-btn">SUBMIT REVIEW</button>
  </form>

  <footer class="cyberpunk-footer">
    <div class="footer-container">
      <div class="footer-brand">
        <div class="logo">NextPlay</div>
      </div>
      <div class="footer-links-container">
        <div class="footer-links">
          <a href="#">About Us</a>
          <a href="#">Privacy Policy</a>
          <a href="#">Contact</a>
        </div>
      </div>
      <div class="footer-social-container">
        <div class="footer-social">
          <a href="#"><i class="fab fa-facebook-f"></i> <span>Facebook</span></a>
          <a href="#"><i class="fab fa-tiktok"></i> <span>TikTok</span></a>
          <a href="#"><i class="fab fa-instagram"></i> <span>Instagram</span></a>
          <a href="#"><i class="fab fa-twitter"></i> <span>Twitter</span></a>
        </div>
      </div>
    </div>
    <p class="footer-copy">&copy; 2025 Y2S1 students. All rights reserved.</p>
  </footer>

</body>
</html>
