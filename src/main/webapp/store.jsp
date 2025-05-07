<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.games.GamesDBUtil" %>
<%@ page import="com.games.Games" %>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    List<Games> games = null;
    try {
        games = GamesDBUtil.getAllGames();
        System.out.println("Retrieved " + (games != null ? games.size() : 0) + " games for store.jsp");
    } catch (Exception e) {
        System.out.println("Error fetching games: " + e.getMessage());
        e.printStackTrace();
    }
    request.setAttribute("games", games);
%>
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

    <!-- Store Main Content -->
    <main class="store-container">
        <h1 class="section-title">GAME STORE</h1>
        
        <!-- Store Filters -->
        <div class="store-filters">
            <div class="search-box">
                <input type="text" id="searchInput" placeholder="Search games...">
                <button onclick="filterGames()"><i class="fas fa-search"></i></button>
            </div>
            <div class="filter-options">
                <select id="categoryFilter" onchange="filterGames()">
                    <option value="all">All Categories</option>
                    <option value="RPG">RPG</option>
                    <option value="FPS">FPS</option>
                    <option value="Strategy">Strategy</option>
                </select>
                <select id="sortFilter" onchange="filterGames()">
                    <option value="popular">Popular</option>
                    <option value="newest">Newest</option>
                    <option value="price-low">Price: Low to High</option>
                    <option value="price-high">Price: High to Low</option>
                </select>
            </div>
        </div>

        <!-- Game Products Grid -->
        <div class="products-grid">
            <c:choose>
                <c:when test="${not empty games}">
                    <c:forEach var="game" items="${games}">
                        <div class="product-card" data-title="${game.title.toLowerCase()}" data-category="${game.category}">
                            <div class="product-image" style="background-image: url('https://images.unsplash.com/photo-1542751371-adc38448a05e?ixlib=rb-4.0.3&auto=format&fit=crop&w=1470&q=80');">
                                <c:if test="${game.price < 30}">
                                    <span class="discount-tag">SALE</span>
                                </c:if>
                            </div>
                            <div class="product-info">
                                <h3>${game.title}</h3>
                                <div class="price">
                                    <span class="current-price">$${String.format("%.2f", game.price)}</span>
                                </div>
                                <div class="rating">
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="far fa-star"></i>
                                    <span>(0)</span>
                                </div>
                                <button class="btn buy-now" onclick="window.location.href='viewgame.jsp?id=${game.id}'">VIEW GAME</button>
                            </div>
                        </div>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <p>No games available at this time.</p>
                </c:otherwise>
            </c:choose>
        </div>
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
    <script src="js/store.js"></script>
</body>
</html>