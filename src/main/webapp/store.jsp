<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NextPlay - Store</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@400;500;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="css/style.css">
  <link rel="stylesheet" href="css/stylehf.css">
</head>
<body>
    <!-- Header (Matches your existing navbar) -->
    <header class="navbar">
        <div class="logo">NextPlay</div>
        <nav class="nav-links" id="navLinks">
          <a href="index.jsp" >Home</a>
          <a href="store.jsp"class="active">Store</a>
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

    <!-- Store Main Content -->
    <main class="store-container">
        <h1 class="section-title">GAME STORE</h1>
        
        <!-- Store Filters -->
        <div class="store-filters">
            <div class="search-box">
                <input type="text" placeholder="Search games...">
                <button><i class="fas fa-search"></i></button>
            </div>
            <div class="filter-options">
                <select>
                    <option value="all">All Categories</option>
                    <option value="rpg">RPG</option>
                    <option value="fps">FPS</option>
                    <option value="racing">Racing</option>
                </select>
                <select>
                    <option value="popular">Popular</option>
                    <option value="newest">Newest</option>
                    <option value="price-low">Price: Low to High</option>
                </select>
            </div>
        </div>

        <!-- Game Products Grid -->
        <div class="products-grid">
            <!-- Product 1 -->
            <div class="product-card">
                <div class="product-image" style="background-image: url('https://images.unsplash.com/photo-1542751371-adc38448a05e?ixlib=rb-4.0.3&auto=format&fit=crop&w=1470&q=80');">
                    <span class="discount-tag">-20%</span>
                </div>
                <div class="product-info">
                    <h3>NEON REVOLUTION</h3>
                    <div class="price">
                        <span class="current-price">$39.99</span>
                        <span class="original-price">$49.99</span>
                    </div>
                    <div class="rating">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star-half-alt"></i>
                        <span>(124)</span>
                    </div>
                    <!-- In each product card, change the button to: -->
<button class="btn buy-now" onclick="window.location.href='viewgame.jsp'">VIEW GAME</button>
                </div>
            </div>

            <!-- Product 2 -->
            <div class="product-card">
                <div class="product-image" style="background-image: url('https://images.unsplash.com/photo-1586182987320-4f376d39d787?ixlib=rb-4.0.3&auto=format&fit=crop&w=1374&q=80');"></div>
                <div class="product-info">
                    <h3>QUANTUM DRIFT</h3>
                    <div class="price">
                        <span class="current-price">$29.99</span>
                    </div>
                    <div class="rating">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="far fa-star"></i>
                        <span>(87)</span>
                    </div>
                    <button class="btn buy-now">BUY NOW</button>
                </div>
            </div>

            <!-- Product 3 -->
            <div class="product-card">
                <div class="product-image" style="background-image: url('https://images.unsplash.com/photo-1551103782-8ab07afd45c1?ixlib=rb-4.0.3&auto=format&fit=crop&w=1470&q=80');">
                    <span class="new-tag">NEW</span>
                </div>
                <div class="product-info">
                    <h3>SYSTEM HACKER</h3>
                    <div class="price">
                        <span class="current-price">$24.99</span>
                    </div>
                    <div class="rating">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <span>(256)</span>
                    </div>
                    <button class="btn buy-now">BUY NOW</button>
                </div>
            </div>

            <!-- Add more products as needed -->
        </div>
    </main>

    <!-- Footer (Matches your existing footer) -->
    <footer class="cyberpunk-footer">
        <div class="footer-container">
          <!-- Left side - NextPlay brand -->
          <div class="footer-brand">
            <div class="logo">NextPlay</div>
          </div>
          
          <!-- Center - Horizontal Links -->
          <div class="footer-links-container">
            <div class="footer-links">
              <a href="#">About Us</a>
              <a href="#">Privacy Policy</a>
              <a href="#">Contact</a>
            </div>
          </div>
          
          <!-- Right side - Vertical Social with names -->
          <div class="footer-social-container">
            <div class="footer-social">
              <a href="#"><i class="fab fa-facebook-f"></i> <span>Facebook</span></a>
              <a href="#"><i class="fab fa-tiktok"></i> <span>TikTok</span></a>
              <a href="#"><i class="fab fa-instagram"></i> <span>Instagram</span></a>
              <a href="#"><i class="fab fa-twitter"></i> <span>Twitter</span></a>
            </div>
          </div>
        </div>
        
        <p class="footer-copy">&copy; 2025 RealmForge. All rights reserved.</p>
      </footer>
    

    <!-- Font Awesome for icons -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/js/all.min.js"></script>
    
    <!-- Store JavaScript -->
    <script src="store.js"></script>
</body>
</html>