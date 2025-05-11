<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.feedback.Feedback" %>
<%@ page isErrorPage="false" %>
<% 
    // Redirect to /viewfeedback if feedbackList is not set
    if (request.getAttribute("feedbackList") == null) {
        response.sendRedirect(request.getContextPath() + "/viewfeedback");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>MatrixNet</title>
  <link rel="stylesheet" href="css/stylehf.css" />
  <link href="https://fonts.googleapis.com/css2?family=Share+Tech+Mono&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="css/feedback.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <style>
    .feedback-list {
      margin-top: 20px;
      padding: 15px;
      background: #1a1a1a;
      border: 1px solid #00ffcc;
      border-radius: 5px;
    }
    .feedback-item {
      margin-bottom: 10px;
      padding: 10px;
      background: #222;
      color: #fff;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }
    .feedback-item strong {
      color: #00ffcc;
    }
    .error-message {
      color: red;
      margin-top: 10px;
    }
    .edit-button, .delete-button {
      padding: 5px 10px;
      border: none;
      border-radius: 3px;
      cursor: pointer;
      margin-bottom: 5px;
    }
    .edit-button {
      background: #00ffcc;
      color: #000;
    }
    .edit-button:hover {
      background: #00ccaa;
    }
    .delete-button {
      background: #ff5555;
      color: #fff;
    }
    .delete-button:hover {
      background: #cc4444;
    }
    .edit-form {
      margin-top: 20px;
      padding: 15px;
      background: #1a1a1a;
      border: 1px solid #00ffcc;
      border-radius: 5px;
    }
  </style>
</head>
<body>
  <header class="navbar">
    <div class="logo">NextPlay</div>
    <nav class="nav-links" id="navLinks">
      <a href="index.html">Home</a>
      <a href="store.jsp">Store</a>
      <a href="${pageContext.request.contextPath}/viewfeedback" class="active">Feedback</a>
      <a href="#">News</a>
      <a href="#">Support</a>
      <div class="auth-buttons">
        <a href="#" class="btn login">Login</a>
        <a href="#" class="btn register">Register</a>
      </div>
    </nav>
    <div class="menu-toggle" onclick="toggleMenu()">☰</div>
  </header>

  <!-- Feedback Form Section -->
  <main class="feedback-container">
    <div class="cyber-form">
      <h2><i class="fas fa-comment-alt"></i> USER FEEDBACK</h2>
      <% 
          String errorMessage = (String) request.getAttribute("errorMessage");
          String success = request.getParameter("success");
          if (errorMessage != null) { 
      %>
          <p class="error-message"><%= errorMessage %></p>
      <% 
          } else if (success != null && success.equals("true")) { 
      %>
          <p style="color: green;">Feedback submitted successfully!</p>
      <% 
          } 
      %>
      <form action="${pageContext.request.contextPath}/insert" method="post">
        <div class="form-group">
          <label for="username">YOUR NAME</label>
          <input type="text" id="username" name="username" required class="cyber-input">
        </div>
        
        <div class="form-group">
          <label for="comment">YOUR MESSAGE</label>
          <textarea id="comment" name="comment" rows="5" required class="cyber-input"></textarea>
        </div>
        
        <div class="form-group">
          <label for="rating">RATING (1-10)</label>
          <div class="number-rating">
            <button type="button" class="number-minus" onclick="adjustRating(-1)">−</button>
            <input type="number" id="rating" name="rating" min="1" max="10" value="5" 
                   class="cyber-input number-input">
            <button type="button" class="number-plus" onclick="adjustRating(1)">+</button>
          </div>
        </div>
        
        <button type="submit" class="cyber-button">SUBMIT FEEDBACK <i class="fas fa-paper-plane"></i></button>
      </form>

      <!-- Edit Feedback Form (shown when editing) -->
      <% 
          Feedback editFeedback = (Feedback) request.getAttribute("editFeedback");
          if (editFeedback != null) {
      %>
      <div class="edit-form">
        <h3><i class="fas fa-edit"></i> Edit Feedback (ID: <%= editFeedback.getId() %>)</h3>
        <form action="${pageContext.request.contextPath}/editfeedback" method="post">
          <input type="hidden" name="id" value="<%= editFeedback.getId() %>">
          <input type="hidden" name="action" value="update">
          <div class="form-group">
            <label for="editUsername">YOUR NAME</label>
            <input type="text" id="editUsername" name="username" value="<%= editFeedback.getUsername() %>" required class="cyber-input">
          </div>
          
          <div class="form-group">
            <label for="editComment">YOUR MESSAGE</label>
            <textarea id="editComment" name="comment" rows="5" required class="cyber-input"><%= editFeedback.getComment() %></textarea>
          </div>
          
          <div class="form-group">
            <label for="editRating">RATING (1-10)</label>
            <div class="number-rating">
              <button type="button" class="number-minus" onclick="adjustEditRating(-1)">−</button>
              <input type="number" id="editRating" name="rating" min="1" max="10" value="<%= editFeedback.getRating() %>" 
                     class="cyber-input number-input">
              <button type="button" class="number-plus" onclick="adjustEditRating(1)">+</button>
            </div>
          </div>
          
          <button type="submit" class="cyber-button">UPDATE FEEDBACK <i class="fas fa-save"></i></button>
        </form>
      </div>
      <% 
          } 
      %>

      <!-- Feedback Display Section -->
      <div class="feedback-list">
        <h3><i class="fas fa-list"></i> Submitted Feedback</h3>
        <% 
            @SuppressWarnings("unchecked")
            List<Feedback> feedbackList = (List<Feedback>) request.getAttribute("feedbackList");
            if (feedbackList != null) {
                if (!feedbackList.isEmpty()) {
                    for (Feedback feedback : feedbackList) {
        %>
            <div class="feedback-item">
              <div>
                <strong>ID:</strong> <%= feedback.getId() %> <br>
                <strong>Username:</strong> <%= feedback.getUsername() %> <br>
                <strong>Comment:</strong> <%= feedback.getComment() %> <br>
                <strong>Rating:</strong> <%= feedback.getRating() %>/10
              </div>
              <div>
                <form action="${pageContext.request.contextPath}/editfeedback" method="post" style="display:inline;">
                  <input type="hidden" name="id" value="<%= feedback.getId() %>">
                  <input type="hidden" name="action" value="edit">
                  <button type="submit" class="edit-button">Edit</button>
                </form>
                <br>
                <form action="${pageContext.request.contextPath}/deletefeedback" method="post" style="display:inline;">
                  <input type="hidden" name="id" value="<%= feedback.getId() %>">
                  <button type="submit" class="delete-button">Delete</button>
                </form>
              </div>
            </div>
        <% 
                    }
                } else {
        %>
            <p>No feedback available yet.</p>
        <% 
                }
            } else {
        %>
            <p class="error-message">Failed to load feedback list.</p>
        <% 
            }
        %>
      </div>
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
    
    <p class="footer-copy">© 2025 RealmForge. All rights reserved.</p>
  </footer>
  
  <script>
function adjustRating(change) {
  const ratingInput = document.getElementById('rating');
  let newValue = parseInt(ratingInput.value) + change;
  newValue = Math.max(1, Math.min(10, newValue));
  ratingInput.value = newValue;
  ratingInput.dispatchEvent(new Event('input'));
}

function adjustEditRating(change) {
  const ratingInput = document.getElementById('editRating');
  let newValue = parseInt(ratingInput.value) + change;
  newValue = Math.max(1, Math.min(10, newValue));
  ratingInput.value = newValue;
  ratingInput.dispatchEvent(new Event('input'));
}
</script>
  
  <script src="js/script.js"></script>
</body>
</html>