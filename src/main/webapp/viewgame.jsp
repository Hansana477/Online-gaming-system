<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NextPlay - Game Details</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/stylehf.css">
    <style>
        /* Additional styles for game details page */
        .game-details-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 40px 20px;
            color: #fff;
        }
        
        .game-header {
            display: flex;
            gap: 40px;
            margin-bottom: 40px;
        }
        
        .game-cover {
            flex: 1;
            min-width: 300px;
            border: 2px solid #0ff;
            box-shadow: 0 0 20px #0ff;
        }
        
        .game-cover img {
            width: 100%;
            height: auto;
            display: block;
        }
        
        .game-info {
            flex: 2;
        }
        
        .game-title {
            font-size: 2.5rem;
            color: #0ff;
            margin-bottom: 20px;
            text-shadow: 0 0 10px #0ff;
        }
        
        .game-meta {
            display: flex;
            gap: 20px;
            margin-bottom: 20px;
        }
        
        .game-price {
            font-size: 1.8rem;
            color: #0ff;
        }
        
        .game-discount {
            background-color: #0ff;
            color: #000;
            padding: 5px 10px;
            border-radius: 4px;
            font-weight: bold;
        }
        
        .game-rating {
            color: #ff0;
            font-size: 1.2rem;
        }
        
        .game-description {
            margin-bottom: 30px;
            line-height: 1.6;
        }
        
        .game-tags {
            display: flex;
            gap: 10px;
            margin-bottom: 30px;
            flex-wrap: wrap;
        }
        
        .game-tag {
            background-color: rgba(0, 255, 255, 0.2);
            color: #0ff;
            padding: 5px 15px;
            border-radius: 20px;
            border: 1px solid #0ff;
        }
        
        .action-buttons {
            display: flex;
            gap: 15px;
        }
        
        .btn {
            padding: 12px 25px;
            text-decoration: none;
            border-radius: 4px;
            font-weight: 600;
            font-family: 'Orbitron', sans-serif;
            text-transform: uppercase;
            transition: all 0.3s ease;
            cursor: pointer;
            border: none;
        }
        
        .btn-primary {
            background-color: #0ff;
            color: #000;
        }
        
        .btn-primary:hover {
            background-color: #000;
            color: #0ff;
            box-shadow: 0 0 15px #0ff;
        }
        
        .btn-secondary {
            background-color: transparent;
            color: #0ff;
            border: 2px solid #0ff;
        }
        
        .btn-secondary:hover {
            background-color: rgba(0, 255, 255, 0.1);
            box-shadow: 0 0 15px #0ff;
        }
        
        .reviews {
            margin-top: 40px;
        }
        
        .review-card {
            background-color: rgba(255, 255, 255, 0.05);
            border: 1px solid #0ff;
            padding: 20px;
            margin-bottom: 20px;
            border-radius: 4px;
        }
        
        .review-header {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
        }
        
        .review-author {
            font-weight: bold;
            color: #0ff;
        }
        
        .review-rating {
            color: #ff0;
        }
        
        .review-date {
            color: #aaa;
            font-size: 0.8rem;
        }
        
        .review-content {
            line-height: 1.5;
        }
        
        /* Responsive adjustments */
        @media (max-width: 768px) {
            .game-header {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>
    <!-- Header (Same as store.jsp) -->
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

    <!-- Game Details Main Content -->
    <main class="game-details-container">
        <div class="game-header">
            <div class="game-cover">
                <img src="https://images.unsplash.com/photo-1542751371-adc38448a05e?ixlib=rb-4.0.3&auto=format&fit=crop&w=1470&q=80" alt="NEON REVOLUTION">
            </div>
            <div class="game-info">
                <h1 class="game-title">NEON REVOLUTION</h1>
                <div class="game-meta">
                    <div class="game-price">$39.99</div>
                    <div class="game-discount">-20%</div>
                    <div class="game-rating">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star-half-alt"></i>
                        <span>(124 reviews)</span>
                    </div>
                </div>
                <div class="game-description">
                    <p>Neon Revolution is a cyberpunk action RPG set in a dystopian future where mega-corporations rule the world. Play as a rogue hacker fighting against the system in this open-world adventure filled with high-tech gadgets, cybernetic enhancements, and neon-lit streets.</p>
                    <p>Features include: fully customizable character, branching storyline, hacking mini-games, and a dynamic combat system that blends melee and ranged weapons.</p>
                </div>
                <div class="game-tags">
                    <span class="game-tag">RPG</span>
                    <span class="game-tag">Cyberpunk</span>
                    <span class="game-tag">Open World</span>
                    <span class="game-tag">Action</span>
                </div>
                <div class="action-buttons">
                    <button class="btn btn-primary">BUY NOW</button>
                    <button class="btn btn-secondary">ADD TO WISHLIST</button>
                </div>
            </div>
        </div>
        
        <div class="reviews">
            <h2 class="section-title">USER REVIEWS</h2>
            <div class="review-card">
                <div class="review-header">
                    <div>
                        <span class="review-author">CyberNinja</span>
                        <span class="review-rating">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                        </span>
                    </div>
                    <div class="review-date">Posted: 2025-03-15</div>
                </div>
                <div class="review-content">
                    <p>Absolutely stunning game! The cyberpunk atmosphere is perfect, and the hacking mechanics are innovative. The story kept me engaged for hours, and the character customization options are extensive.</p>
                </div>
            </div>
            <div class="review-card">
                <div class="review-header">
                    <div>
                        <span class="review-author">NeonRider</span>
                        <span class="review-rating">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="far fa-star"></i>
                        </span>
                    </div>
                    <div class="review-date">Posted: 2025-03-10</div>
                </div>
                <div class="review-content">
                    <p>Great game overall, but some bugs need fixing. The combat system is satisfying, and the world feels alive. The main story is a bit short, but the side quests make up for it.</p>
                </div>
            </div>
        </div>
    </main>

    <!-- Footer (Same as store.jsp) -->
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
        <p class="footer-copy">&copy; 2025 RealmForge. All rights reserved.</p>
    </footer>
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/js/all.min.js"></script>
    <script>
        // You can add JavaScript functionality here
        // For example, handling the buy now button click
        document.querySelector('.btn-primary').addEventListener('click', function() {
            alert('Added to your cart!');
        });
    </script>
</body>
</html>