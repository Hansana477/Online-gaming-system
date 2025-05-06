<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.games.GamesDBUtil" %>
<%@ page import="com.games.Games" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NextPlay - Admin Dashboard</title>
    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <!-- Custom Styles -->
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Orbitron:wght@400;700&display=swap');
        
        body {
            font-family: 'Orbitron', sans-serif;
            background-color: #0a0a0a;
            color: #e5e7eb;
        }
        
        .cyber-text {
            text-shadow: 0 0 8px #00ffff;
        }
        
        .sidebar-item.active {
            background-color: rgba(0, 255, 255, 0.2);
            border-left: 4px solid #00ffff;
            color: #00ffff;
        }
        
        .sidebar-item.active:hover {
            background-color: rgba(0, 255, 255, 0.3);
        }
    </style>
</head>
<body class="flex h-screen overflow-hidden">
    <!-- Sidebar -->
    <div class="w-64 bg-gray-800 border-r border-cyan-500 flex flex-col">
        <div class="p-4 border-b border-gray-700">
            <h1 class="text-2xl font-bold text-cyan-400 cyber-text">NextPlay</h1>
            <p class="text-xs text-cyan-300">Administrator Panel</p>
        </div>
        <nav class="flex-1 overflow-y-auto">
            <a href="#" class="sidebar-item active flex items-center p-4 hover:bg-gray-700">
                <i class="fas fa-tachometer-alt w-6 mr-3 text-center"></i>
                Dashboard
            </a>
            <a href="#" class="sidebar-item flex items-center p-4 hover:bg-gray-700">
                <i class="fas fa-gamepad w-6 mr-3 text-center"></i>
                Games
            </a>
            <a href="#" class="sidebar-item flex items-center p-4 hover:bg-gray-700">
                <i class="fas fa-users w-6 mr-3 text-center"></i>
                Users
            </a>
            <a href="#" class="sidebar-item flex items-center p-4 hover:bg-gray-700">
                <i class="fas fa-shopping-cart w-6 mr-3 text-center"></i>
                Orders
            </a>
            <a href="#" class="sidebar-item flex items-center p-4 hover:bg-gray-700">
                <i class="fas fa-chart-line w-6 mr-3 text-center"></i>
                Analytics
            </a>
            <a href="#" class="sidebar-item flex items-center p-4 hover:bg-gray-700">
                <i class="fas fa-cog w-6 mr-3 text-center"></i>
                Settings
            </a>
        </nav>
    </div>

    <!-- Main Content -->
    <div class="flex-1 flex flex-col overflow-hidden">
        <!-- Top Bar -->
        <header class="bg-gray-800 border-b border-cyan-500 p-4 flex items-center justify-between">
            <div class="flex items-center bg-gray-700 rounded-full px-4 py-2 w-96 max-w-full">
                <i class="fas fa-search text-gray-400 mr-2"></i>
                <input type="text" placeholder="Search..." class="bg-transparent border-none focus:outline-none text-white w-full">
            </div>
            <div class="flex items-center space-x-4">
                <button class="relative p-2 text-gray-400 hover:text-white">
                    <i class="fas fa-bell"></i>
                    <span class="absolute top-0 right-0 bg-red-500 text-white text-xs rounded-full h-5 w-5 flex items-center justify-center">3</span>
                </button>
                <div class="flex items-center space-x-2 cursor-pointer">
                    <img src="https://via.placeholder.com/40" alt="Admin" class="rounded-full border-2 border-cyan-400">
                    <span>Admin User</span>
                </div>
            </div>
        </header>

        <!-- Dashboard Content -->
        <main class="flex-1 overflow-y-auto p-6 bg-gray-900">
            <div class="flex justify-between items-center mb-8">
                <h1 class="text-3xl font-bold text-cyan-400 cyber-text">Game Management</h1>
                <button id="addGameBtn" class="bg-cyan-500 hover:bg-cyan-600 text-black font-bold py-2 px-4 rounded flex items-center">
                    <i class="fas fa-plus mr-2"></i> Add New Game
                </button>
            </div>

            <!-- Stats Cards -->
            <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-8">
                <div class="bg-gray-800 border border-cyan-500 rounded-lg p-6 hover:shadow-lg hover:shadow-cyan-500/20 transition-all">
                    <div class="flex items-center">
                        <div class="p-3 rounded-full bg-cyan-500/20 text-cyan-400 mr-4">
                            <i class="fas fa-gamepad text-xl"></i>
                        </div>
                        <div>
                            <h3 class="text-gray-400">Total Games</h3>
                            <p class="text-2xl font-bold">42</p>
                        </div>
                    </div>
                </div>
                <div class="bg-gray-800 border border-cyan-500 rounded-lg p-6 hover:shadow-lg hover:shadow-cyan-500/20 transition-all">
                    <div class="flex items-center">
                        <div class="p-3 rounded-full bg-purple-500/20 text-purple-400 mr-4">
                            <i class="fas fa-users text-xl"></i>
                        </div>
                        <div>
                            <h3 class="text-gray-400">Active Users</h3>
                            <p class="text-2xl font-bold">1,248</p>
                        </div>
                    </div>
                </div>
                <div class="bg-gray-800 border border-cyan-500 rounded-lg p-6 hover:shadow-lg hover:shadow-cyan-500/20 transition-all">
                    <div class="flex items-center">
                        <div class="p-3 rounded-full bg-yellow-500/20 text-yellow-400 mr-4">
                            <i class="fas fa-shopping-cart text-xl"></i>
                        </div>
                        <div>
                            <h3 class="text-gray-400">Today's Sales</h3>
                            <p class="text-2xl font-bold">$3,845</p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Games Table -->
            <div class="bg-gray-800 border border-cyan-500 rounded-lg overflow-hidden">
                <div class="overflow-x-auto">
                    <table class="min-w-full">
                        <thead class="bg-gray-700">
                            <tr>
                                <th class="px-6 py-3 text-left text-xs font-medium text-cyan-400 uppercase tracking-wider">ID</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-cyan-400 uppercase tracking-wider">Game Title</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-cyan-400 uppercase tracking-wider">Category</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-cyan-400 uppercase tracking-wider">Price</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-cyan-400 uppercase tracking-wider">Status</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-cyan-400 uppercase tracking-wider">Actions</th>
                            </tr>
                        </thead>
                        <tbody class="divide-y divide-gray-700">
                            <%
                                List<Games> games = GamesDBUtil.getAllGames();
                                for (Games game : games) {
                            %>
                            <tr class="hover:bg-gray-700/50">
                                <td class="px-6 py-4 whitespace-nowrap"><%= game.getId() %></td>
                                <td class="px-6 py-4 whitespace-nowrap"><%= game.getTitle() %></td>
                                <td class="px-6 py-4 whitespace-nowrap"><%= game.getCategory() %></td>
                                <td class="px-6 py-4 whitespace-nowrap">$<%= String.format("%.2f", game.getPrice()) %></td>
                                <td class="px-6 py-4 whitespace-nowrap">
                                    <span class="px-2 py-1 text-xs font-semibold rounded-full bg-green-500/20 text-green-400"><%= game.getStatus() %></span>
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap">
                                    <button class="text-yellow-400 hover:text-yellow-300 mr-3">
                                        <i class="fas fa-edit"></i>
                                    </button>
                                    <button class="text-red-400 hover:text-red-300">
                                        <i class="fas fa-trash"></i>
                                    </button>
                                </td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </main>
    </div>

    <!-- Add Game Modal -->
    <div id="addGameModal" class="fixed inset-0 bg-black bg-opacity-80 flex items-center justify-center z-50 hidden">
        <div class="bg-gray-800 border border-cyan-500 rounded-lg w-full max-w-2xl">
            <div class="border-b border-gray-700 p-4 flex justify-between items-center">
                <h2 class="text-xl font-bold text-cyan-400">Add New Game</h2>
                <button id="closeModal" class="text-gray-400 hover:text-white">
                    <i class="fas fa-times"></i>
                </button>
            </div>
            <form id="gameForm" action="insert" method="POST" class="p-6">
                <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                    <div class="col-span-2">
                        <label class="block text-gray-400 mb-2">Game Title</label>
                        <input type="text" name="title" required class="w-full bg-gray-700 border border-gray-600 rounded px-4 py-2 focus:border-cyan-500 focus:outline-none">
                    </div>
                    <div class="col-span-2">
                        <label class="block text-gray-400 mb-2">Description</label>
                        <textarea name="description" rows="4" required class="w-full bg-gray-700 border border-gray-600 rounded px-4 py-2 focus:border-cyan-500 focus:outline-none"></textarea>
                    </div>
                    <div>
                        <label class="block text-gray-400 mb-2">Price ($)</label>
                        <input type="number" name="price" step="0.01" required class="w-full bg-gray-700 border border-gray-600 rounded px-4 py-2 focus:border-cyan-500 focus:outline-none">
                    </div>
                    <div>
                        <label class="block text-gray-400 mb-2">Category</label>
                        <select name="category" required class="w-full bg-gray-700 border border-gray-600 rounded px-4 py-2 focus:border-cyan-500 focus:outline-none">
                            <option value="">Select Category</option>
                            <option value="RPG">RPG</option>
                            <option value="FPS">FPS</option>
                            <option value="Strategy">Strategy</option>
                        </select>
                    </div>
                </div>
                <div class="flex justify-end mt-6 space-x-3">
                    <button type="button" id="cancelBtn" class="px-4 py-2 border border-gray-600 rounded hover:bg-gray-700">Cancel</button>
                    <button type="submit" class="px-4 py-2 bg-cyan-500 text-black rounded hover:bg-cyan-600 font-bold">Add Game</button>
                </div>
            </form>
        </div>
    </div>

    <script>
        // Modal Handling
        const addGameBtn = document.getElementById('addGameBtn');
        const addGameModal = document.getElementById('addGameModal');
        const closeModal = document.getElementById('closeModal');
        const cancelBtn = document.getElementById('cancelBtn');
        
        addGameBtn.addEventListener('click', () => {
            addGameModal.classList.remove('hidden');
        });
        
        [closeModal, cancelBtn].forEach(btn => {
            btn.addEventListener('click', () => {
                addGameModal.classList.add('hidden');
            });
        });
        
        // Close modal when clicking outside
        addGameModal.addEventListener('click', (e) => {
            if (e.target === addGameModal) {
                addGameModal.classList.add('hidden');
            }
        });
    </script>
</body>
</html>