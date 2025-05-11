<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NextPlay - Sign Up</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/stylehf.css">
    <style>
        .signup-container {
            max-width: 400px;
            margin: 100px auto;
            padding: 20px;
            background: #1a1a1a;
            border: 1px solid #00ffcc;
            border-radius: 8px;
            box-shadow: 0 0 10px #00ffcc;
        }
        .signup-container h1 {
            text-align: center;
            color: #00ffcc;
            font-family: 'Orbitron', sans-serif;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            color: #fff;
            display: block;
            margin-bottom: 5px;
        }
        .form-group input {
            width: 100%;
            padding: 10px;
            background: #333;
            border: 1px solid #00ffcc;
            color: #fff;
            border-radius: 4px;
        }
        .form-group input:focus {
            outline: none;
            border-color: #ff007a;
        }
        .submit-btn {
            width: 100%;
            padding: 10px;
            background: #ff007a;
            border: none;
            color: #fff;
            font-weight: bold;
            border-radius: 4px;
            cursor: pointer;
        }
        .submit-btn:hover {
            background: #cc0066;
        }
        .error-message {
            color: #ff4d4d;
            text-align: center;
            margin-bottom: 10px;
        }
        .login-link {
            text-align: center;
            margin-top: 10px;
        }
        .login-link a {
            color: #00ffcc;
            text-decoration: none;
        }
        .login-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <header class="navbar">
        <div class="logo">NextPlay</div>
        <nav class="nav-links" id="navLinks">
            <a href="index.jsp">Home</a>
            <a href="store.jsp">Store</a>
            <a href="#">Feedback</a>
            <a href="#">News</a>
            <a href="#">Support</a>
            <div class="auth-buttons">
                <a href="login.jsp" class="btn login">Login</a>
                <a href="signup.jsp" class="btn register active">Register</a>
            </div>
        </nav>
        <div class="menu-toggle" onclick="toggleMenu()">☰</div>
    </header>

    <main class="signup-container">
        <h1>Sign Up</h1>
        <% String errorMessage = (String) request.getAttribute("errorMessage"); %>
        <% if (errorMessage != null) { %>
            <p class="error-message"><%= errorMessage %></p>
        <% } %>
        <form action="signup" method="POST">
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" required>
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required>
            </div>
            <button type="submit" class="submit-btn">Sign Up</button>
        </form>
        <div class="login-link">
            <p>Already have an account? <a href="login.jsp">Login</a></p>
        </div>
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

    <script src="js/script.js"></script>
</body>
</html>