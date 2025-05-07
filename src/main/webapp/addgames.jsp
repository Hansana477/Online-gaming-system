<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.games.GamesDBUtil" %>
<%@ page import="com.games.Games" %>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    List<Games> games = GamesDBUtil.getAllGames();
    request.setAttribute("games", games);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NextPlay - Admin Dashboard</title>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <!-- Custom Styles -->
    <link rel="stylesheet" href="css/stylehf.css">
    <link rel="stylesheet" href="css/admin.css">
</head>
<body class="flex h-screen overflow-hidden">
    <!-- Sidebar -->
    <div class="sidebar">
        <div class="sidebar-header">
            <h1 class="sidebar-title">NextPlay</h1>
            <p class="sidebar-subtitle">Administrator Panel</p>
        </div>
        <nav class="sidebar-nav">
            <a href="#" class="sidebar-item active">
                <i class="fas fa-tachometer-alt sidebar-icon"></i>
                Dashboard
            </a>
            <a href="#" class="sidebar-item">
                <i class="fas fa-gamepad sidebar-icon"></i>
                Games
            </a>
            <a href="#" class="sidebar-item">
                <i class="fas fa-users sidebar-icon"></i>
                Users
            </a>
            <a href="#" class="sidebar-item">
                <i class="fas fa-shopping-cart sidebar-icon"></i>
                Orders
            </a>
            <a href="#" class="sidebar-item">
                <i class="fas fa-chart-line sidebar-icon"></i>
                Analytics
            </a>
            <a href="#" class="sidebar-item">
                <i class="fas fa-cog sidebar-icon"></i>
                Settings
            </a>
        </nav>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <!-- Top Bar -->
        <header class="header">
            <div class="search-bar">
                <i class="fas fa-search search-icon"></i>
                <input type="text" placeholder="Search..." class="search-input">
            </div>
            <div class="header-actions">
                <button class="notification-btn">
                    <i class="fas fa-bell"></i>
                    <span class="notification-badge">3</span>
                </button>
                <div class="user-profile">
                    <img src="https://via.placeholder.com/40" alt="Admin" class="user-avatar">
                    <span>Admin User</span>
                </div>
            </div>
        </header>

        <!-- Dashboard Content -->
        <main class="main">
            <div class="main-header">
                <h1 class="main-title">Game Management</h1>
                <button id="addGameBtn" class="add-game-btn">
                    <i class="fas fa-plus add-game-icon"></i> Add New Game
                </button>
            </div>

            <!-- Games Table -->
            <div class="table-container">
                <div class="table-wrapper">
                    <table class="games-table">
                        <thead class="table-header">
                            <tr>
                                <th class="table-th">ID</th>
                                <th class="table-th">Game Title</th>
                                <th class="table-th">Description</th>
                                <th class="table-th">Category</th>
                                <th class="table-th">Price</th>
                                <th class="table-th">Actions</th>
                            </tr>
                        </thead>
                        <tbody class="table-body">
                            <c:forEach var="game" items="${games}">
                                <c:set var="id" value="${game.id}" />
                                <tr class="table-row">
                                    <td class="table-cell">${id}</td>
                                    <td class="table-cell">${game.title}</td>
                                    <td class="table-cell">${game.description}</td>
                                    <td class="table-cell">${game.category}</td>
                                    <td class="table-cell">$${String.format("%.2f", game.price)}</td>
                                    <td class="table-cell">
                                        <button class="edit-btn" data-id="${id}" data-title="${game.title}" data-description="${game.description}" data-category="${game.category}" data-price="${game.price}">
                                            <i class="fas fa-edit"></i>
                                        </button>
                                        <button class="delete-btn" data-id="${id}">
                                            <i class="fas fa-trash"></i>
                                        </button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </main>
    </div>

    <!-- Add Game Modal -->
    <div id="addGameModal" class="modal hidden">
        <div class="modal-content">
            <div class="modal-header">
                <h2 class="modal-title">Add New Game</h2>
                <button id="closeModal" class="modal-close-btn">
                    <i class="fas fa-times"></i>
                </button>
            </div>
            <form id="gameForm" action="insert" method="POST" class="modal-form">
                <div class="form-grid">
                    <div class="form-group full-width">
                        <label class="form-label">Game Title</label>
                        <input type="text" name="title" required class="form-input">
                    </div>
                    <div class="form-group full-width">
                        <label class="form-label">Description</label>
                        <textarea name="description" rows="4" required class="form-textarea"></textarea>
                    </div>
                    <div class="form-group">
                        <label class="form-label">Price ($)</label>
                        <input type="number" name="price" step="0.01" required class="form-input">
                    </div>
                    <div class="form-group">
                        <label class="form-label">Category</label>
                        <select name="category" required class="form-select">
                            <option value="">Select Category</option>
                            <option value="RPG">RPG</option>
                            <option value="FPS">FPS</option>
                            <option value="Strategy">Strategy</option>
                        </select>
                    </div>
                </div>
                <div class="form-actions">
                    <button type="button" id="cancelBtn" class="cancel-btn">Cancel</button>
                    <button type="submit" class="submit-btn">Add Game</button>
                </div>
            </form>
        </div>
    </div>

    <!-- Edit Game Modal -->
    <div id="editGameModal" class="modal hidden">
        <div class="modal-content">
            <div class="modal-header">
                <h2 class="modal-title">Edit Game</h2>
                <button id="closeEditModal" class="modal-close-btn">
                    <i class="fas fa-times"></i>
                </button>
            </div>
            <form id="editGameForm" action="update" method="POST" class="modal-form">
                <input type="hidden" name="id" id="editGameId">
                <div class="form-grid">
                    <div class="form-group full-width">
                        <label class="form-label">Game Title</label>
                        <input type="text" name="title" id="editTitle" required class="form-input">
                    </div>
                    <div class="form-group full-width">
                        <label class="form-label">Description</label>
                        <textarea name="description" id="editDescription" rows="4" required class="form-textarea"></textarea>
                    </div>
                    <div class="form-group">
                        <label class="form-label">Price ($)</label>
                        <input type="number" name="price" id="editPrice" step="0.01" required class="form-input">
                    </div>
                    <div class="form-group">
                        <label class="form-label">Category</label>
                        <select name="category" id="editCategory" required class="form-select">
                            <option value="">Select Category</option>
                            <option value="RPG">RPG</option>
                            <option value="FPS">FPS</option>
                            <option value="Strategy">Strategy</option>
                        </select>
                    </div>
                </div>
                <div class="form-actions">
                    <button type="button" id="cancelEditBtn" class="cancel-btn">Cancel</button>
                    <button type="submit" class="submit-btn">Save Changes</button>
                </div>
            </form>
            <!-- Debugging Section -->
            <div id="debugOutput" style="margin-top: 10px; color: red;"></div>
        </div>
    </div>

    <script>
        // Log when the page is loaded to ensure DOM is ready
        document.addEventListener('DOMContentLoaded', () => {
            console.log('addgames.jsp loaded, DOM ready');
            console.log('Edit buttons found:', document.getElementsByClassName('edit-btn').length);
            console.log('Delete buttons found:', document.getElementsByClassName('delete-btn').length);
        });
    </script>
    <script src="js/admin.js"></script>
</body>
</html>