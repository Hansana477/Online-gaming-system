<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.games.GamesDBUtil" %>
<%@ page import="com.games.Games" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String idParam = request.getParameter("id");
    Games game = null;
    String errorMessage = null;
    if (idParam != null && !idParam.trim().isEmpty()) {
        try {
            int id = Integer.parseInt(idParam);
            System.out.println("Fetching game with ID: " + id);
            game = GamesDBUtil.getGameById(id);
            if (game == null) {
                errorMessage = "Game not found for ID: " + id;
                System.out.println(errorMessage);
            }
        } catch (NumberFormatException e) {
            errorMessage = "Invalid game ID format: " + idParam;
            System.out.println(errorMessage);
        } catch (Exception e) {
            errorMessage = "Error fetching game: " + e.getMessage();
            System.out.println(errorMessage);
            e.printStackTrace();
        }
    } else {
        errorMessage = "No game ID provided";
        System.out.println(errorMessage);
    }
    request.setAttribute("game", game);
    request.setAttribute("errorMessage", errorMessage);
%>
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
        .btn-review {
            background-color: transparent;
            color: #0ff;
            border: 2px solid #0ff;
        }
        .btn-review:hover {
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
        .btn btn-review{
        	text-decoration:none;
        }
        @media (max-width: 768px) {
            .game-header {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>
    <!-- Header -->
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
        <c:choose>
            <c:when test="${not empty game}">
                <div class="game-header">
                    <div class="game-cover">
                        <img src="https://images.unsplash.com/photo-1542751371-adc38448a05e?ixlib=rb-4.0.3&auto=format&fit=crop&w=1470&q=80" alt="${game.title}">
                    </div>
                    <div class="game-info">
                        <h1 class="game-title">${game.title}</h1>
                        <div class="game-meta">
                            <div class="game-price">$${String.format("%.2f", game.price)}</div>
                            <c:if test="${game.price < 30}">
                                <div class="game-discount">SALE</div>
                            </c:if>
                            <div class="game-rating">
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star-half-alt"></i>
                                
                            </div>
                        </div>
                        <div class="game-description">
                            <p>${game.description}</p>
                        </div>
                        <div class="game-tags">
                            <span class="game-tag">${game.category}</span>
                        </div>
                        <div class="action-buttons">
                            <button class="btn btn-primary">BUY NOW</button>
                            <button class="btn btn-secondary">ADD TO WISHLIST</button>
                            <button class="btn btn-review" onclick="window.location.href='Reviewui.jsp'">Write a Review</button>
                            <button class="btn btn-secondary" onclick="window.location.href='seeReviews.jsp'">See Reviews</button>
                        </div>
                    </div>
                </div>
                
 
            </c:when>
            <c:otherwise>
                <h1>Error</h1>
                <p>${errorMessage != null ? errorMessage : "Game not found"}</p>
                <a href="store.jsp">Back to Store</a>
            </c:otherwise>
        </c:choose>
    </main>

    <!-- Footer -->
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
        <p class="footer-copy">2025 Y2S1 students. All rights reserved.</p>
    </footer>
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/js/all.min.js"></script>
    <script>
        // Handle Buy Now button
        document.querySelector('.btn-primary')?.addEventListener('click', function() {
            alert('Added to your cart!');
        });

      
        

        // Menu toggle for mobile
        function toggleMenu() {
            const navLinks = document.getElementById('navLinks');
            navLinks.classList.toggle('active');
        }
    </script>
</body>
</html>