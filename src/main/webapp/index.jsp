<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.games.GamesDBUtil" %>
<%@ page import="com.games.Games" %>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    Games firstGame = null;
    String errorMessage = null;
    try {
        List<Games> games = GamesDBUtil.getAllGames();
        if (games != null && !games.isEmpty()) {
            firstGame = games.get(0);
            System.out.println("First game fetched for index.jsp: ID=" + firstGame.getId() + ", title=" + firstGame.getTitle());
        } else {
            errorMessage = "No games found in database";
            System.out.println(errorMessage);
        }
    } catch (Exception e) {
        errorMessage = "Error fetching games: " + e.getMessage();
        System.out.println(errorMessage);
        e.printStackTrace();
    }
    request.setAttribute("firstGame", firstGame);
    request.setAttribute("errorMessage", errorMessage);
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>NextPlay - Home</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@400;500;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="css/style.css">
  <link rel="stylesheet" href="css/stylehf.css">
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

  <main class="main-content">
    <!-- Hero Section -->
    <section class="hero">
      <div class="hero-content">
        <h1>DIVE INTO THE MATRIX</h1>
        <p>Experience next-gen gaming in our cyberpunk universe</p>
        <a href="store.jsp" class="btn register hero-btn">EXPLORE GAMES</a>
      </div>
    </section>

    <!-- Game Slideshow Section -->
    <section class="games-showcase">
      <h2 class="section-title">FEATURED GAMES</h2>
      
      <div class="slideshow-container">
        <!-- Slide 1: Dynamic First Game -->
        <c:choose>
          <c:when test="${not empty firstGame}">
            <div class="game-slide active">
              <div class="slide-image" style="background-image: url('https://images.unsplash.com/photo-1542751371-adc38448a05e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80');"></div>
              <div class="slide-info">
                <h3>${firstGame.title}</h3>
                <p>${firstGame.description}</p>
                <div class="game-tags">
                  <span>${firstGame.category}</span>
                  <span>Open World</span>
                  <span>Cyberpunk</span>
                </div>
                <a href="viewgame.jsp?id=${firstGame.id}" class="btn login">VIEW DETAILS</a>
              </div>
            </div>
          </c:when>
          <c:otherwise>
            <div class="game-slide active">
              <div class="slide-image" style="background-image: url('https://images.unsplash.com/photo-1542751371-adc38448a05e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80');"></div>
              <div class="slide-info">
                <h3>NO GAMES AVAILABLE</h3>
                <p>Check back later for featured games</p>
                <div class="game-tags">
                  <span>RPG</span>
                  <span>Open World</span>
                  <span>Cyberpunk</span>
                </div>
                <a href="store.jsp" class="btn login">VIEW STORE</a>
              </div>
            </div>
          </c:otherwise>
        </c:choose>
        
        <!-- Slide 2: Static -->
        <div class="game-slide">
          <div class="slide-image" style="background-image: url('https://images.unsplash.com/photo-1586182987320-4f376d39d787?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1374&q=80');"></div>
          <div class="slide-info">
            <h3>QUANTUM DRIFT</h3>
            <p>High-speed anti-gravity racing with neon-lit tracks</p>
            <div class="game-tags">
              <span>Racing</span>
              <span>Multiplayer</span>
              <span>VR Supported</span>
            </div>
            <a href="#" class="btn login">VIEW DETAILS</a>
          </div>
        </div>
        
        <!-- Slide 3: Static -->
        <div class="game-slide">
          <div class="slide-image" style="background-image: url('https://images.unsplash.com/photo-1551103782-8ab07afd45c1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80');"></div>
          <div class="slide-info">
            <h3>SYSTEM HACKER</h3>
            <p>Cyber warfare simulation with deep hacking mechanics</p>
            <div class="game-tags">
              <span>Strategy</span>
              <span>Puzzle</span>
              <span>Single Player</span>
            </div>
            <a href="#" class="btn login">VIEW DETAILS</a>
          </div>
        </div>
        
        <!-- Navigation Dots -->
        <div class="slideshow-dots">
          <span class="dot active" onclick="currentSlide(1)"></span>
          <span class="dot" onclick="currentSlide(2)"></span>
          <span class="dot" onclick="currentSlide(3)"></span>
        </div>
      </div>
    </section>

    <!-- Upcoming Games Section -->
    <section class="upcoming-games">
      <h2 class="section-title">COMING SOON</h2>
      <div class="game-grid">
        <div class="game-card">
          <div class="game-thumbnail" style="background-image: url('https://images.unsplash.com/photo-1511512578047-dfb367046420?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1471&q=80');"></div>
          <h3>VOID RUNNERS</h3>
          <p>Release: Q1 2026</p>
        </div>
        <div class="game-card">
          <div class="game-thumbnail" style="background-image: url('https://images.unsplash.com/photo-1534972195531-d756b9bfa9f2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80');"></div>
          <h3>NEURAL DIVE</h3>
          <p>Release: Q2 2026</p>
        </div>
        <div class="game-card">
          <div class="game-thumbnail" style="background-image: url('https://images.unsplash.com/photo-1547036967-23d11aacaee0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1374&q=80');"></div>
          <h3>CYBER SHADOWS</h3>
          <p>Release: Q3 2026</p>
        </div>
      </div>
    </section>
  </main>

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

  <script src="script.js"></script>
</body>
</html>