<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/stylehf.css">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <title>Enter User ID - NextPlay Reviews</title>
    <style>
        body {
            background-color: #0d0d0d;
            color: #00f7ff;
            font-family: 'Orbitron', sans-serif;
            text-align: center;
        }
        h1 {
            color: #00f7ff;
            text-shadow: 0 0 10px #00f7ff;
        }
        .form-container {
            border: 2px solid #00f7ff;
            box-shadow: 0 0 15px #00f7ff;
            border-radius: 10px;
            width: 40%;
            margin: 100px auto;
            padding: 20px;
        }
        input[type="text"], input[type="submit"] {
            width: 80%;
            padding: 10px;
            margin: 10px auto;
            border: 1px solid #00f7ff;
            background: #000;
            color: #00f7ff;
            font-size: 16px;
        }
    </style>
</head>
<body>
<header class="navbar">
        <div class="logo">NextPlay</div>
        <nav class="nav-links" id="navLinks">
            <a href="index.jsp">Home</a>
            <a href="store.jsp" class="active">Store</a>
            <a href="#">Feedback</a>
            <a href="#">News</a>
            <a href="#">Support</a>
            <div class="auth-buttons">
                <a href="#" class="btn login">Login</a>
                <a href="#" class="btn register">Register</a>
            </div>
        </nav>
        <div class="menu-toggle" onclick="toggleMenu()">☰</div>
    </header>
    
    <h1>Reviews</h1>
    <div class="form-container">
        <h2>ENTER USER ID</h2>
     <form action="allRevies" method="post">
    <input type="text" name="userId" placeholder="Enter User ID" required />
    <br>
    <input type="submit" value="SEE REVIEWS" />
</form>

    </div>
    
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
