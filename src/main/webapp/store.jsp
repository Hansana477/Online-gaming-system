<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NextPlay - Store</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@400;500;700&display=swap" rel="stylesheet">
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    fontFamily: {
                        orbitron: ['Orbitron', 'sans-serif'],
                    },
                    colors: {
                        primary: '#0ff',
                        dark: '#0d0d0d',
                        darker: '#111',
                    },
                    boxShadow: {
                        'neon': '0 0 10px #0ff',
                        'neon-md': '0 0 20px #0ff',
                        'neon-lg': '0 0 30px #0ff',
                    },
                    animation: {
                        'fade': 'fade 1.5s ease-in-out',
                    },
                    keyframes: {
                        fade: {
                            'from': { opacity: '0.4' },
                            'to': { opacity: '1' }
                        }
                    }
                }
            }
        }
    </script>
    <style>
        body {
            font-family: 'Orbitron', sans-serif;
            background-color: #0d0d0d;
            color: #fff;
        }
        .text-shadow-neon {
            text-shadow: 0 0 10px #0ff;
        }
        .border-neon {
            border-color: #0ff;
        }
        .active-link {
            color: #0ff;
            border-bottom: 2px solid #0ff;
            text-shadow: 0 0 5px #0ff, 0 0 10px #0ff;
        }
    </style>
</head>
<body class="bg-dark font-orbitron">
    <!-- Header -->
    <header class="bg-darker px-8 py-5 flex justify-between items-center border-b-2 border-neon shadow-neon-md">
        <div class="text-primary text-3xl font-bold text-shadow-neon">NextPlay</div>
        <nav class="hidden md:flex items-center gap-6" id="navLinks">
            <a href="index.jsp" class="text-white hover:text-primary hover:border-b-2 hover:border-neon transition-all">Home</a>
            <a href="store.jsp" class="active-link">Store</a>
            <a href="#" class="text-white hover:text-primary hover:border-b-2 hover:border-neon transition-all">Feedback</a>
            <a href="#" class="text-white hover:text-primary hover:border-b-2 hover:border-neon transition-all">News</a>
            <a href="#" class="text-white hover:text-primary hover:border-b-2 hover:border-neon transition-all">Support</a>
            <div class="flex gap-3 ml-6">
                <a href="#" class="px-4 py-2 rounded border-2 border-primary text-primary hover:bg-primary hover:text-black transition-all">Login</a>
                <a href="#" class="px-4 py-2 rounded border-2 border-primary bg-primary text-black hover:bg-transparent hover:text-primary transition-all">Register</a>
            </div>
        </nav>
        <div class="md:hidden text-primary text-2xl cursor-pointer" onclick="toggleMenu()">☰</div>
    </header>

    <!-- Store Main Content -->
    <main class="max-w-6xl mx-auto px-5 py-10 text-white">
        <h1 class="text-4xl text-center mb-12 text-primary text-shadow-neon relative">
            GAME STORE
            <div class="absolute bottom-0 left-1/2 transform -translate-x-1/2 w-24 h-1 bg-primary shadow-neon mt-4"></div>
        </h1>
        
        <!-- Store Filters -->
        <div class="flex flex-col md:flex-row justify-between items-center mb-8 gap-5">
            <div class="flex items-center bg-white bg-opacity-10 border border-primary rounded-full px-4 py-2 w-full md:w-80">
                <input type="text" placeholder="Search games..." class="bg-transparent w-full text-white outline-none">
                <button class="text-primary"><i class="fas fa-search"></i></button>
            </div>
            <div class="flex gap-3 w-full md:w-auto">
                <select class="bg-darker text-white border border-primary px-4 py-2 rounded cursor-pointer">
                    <option value="all">All Categories</option>
                    <option value="rpg">RPG</option>
                    <option value="fps">FPS</option>
                    <option value="racing">Racing</option>
                </select>
                <select class="bg-darker text-white border border-primary px-4 py-2 rounded cursor-pointer">
                    <option value="popular">Popular</option>
                    <option value="newest">Newest</option>
                    <option value="price-low">Price: Low to High</option>
                </select>
            </div>
        </div>

        <!-- Game Products Grid -->
        <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-8">
            <!-- Product 1 -->
            <div class="bg-darker rounded-lg overflow-hidden border border-primary transition-all hover:-translate-y-2 hover:shadow-neon-lg">
                <div class="h-40 bg-cover bg-center relative" style="background-image: url('https://images.unsplash.com/photo-1542751371-adc38448a05e?ixlib=rb-4.0.3&auto=format&fit=crop&w=1470&q=80')">
                    <span class="absolute top-2 right-2 bg-primary text-black px-3 py-1 rounded-full text-xs font-bold">-20%</span>
                </div>
                <div class="p-5">
                    <h3 class="text-xl mb-2 text-primary">NEON REVOLUTION</h3>
                    <div class="mb-2">
                        <span class="text-xl font-bold text-primary">$39.99</span>
                        <span class="text-sm line-through text-gray-400 ml-2">$49.99</span>
                    </div>
                    <div class="mb-4 text-yellow-400">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star-half-alt"></i>
                        <span class="text-gray-400 text-sm ml-1">(124)</span>
                    </div>
                    <button class="w-full py-2 bg-primary text-black font-bold rounded hover:bg-black hover:text-primary transition-all">
                        BUY NOW
                    </button>
                </div>
            </div>

            <!-- Product 2 -->
            <div class="bg-darker rounded-lg overflow-hidden border border-primary transition-all hover:-translate-y-2 hover:shadow-neon-lg">
                <div class="h-40 bg-cover bg-center" style="background-image: url('https://images.unsplash.com/photo-1586182987320-4f376d39d787?ixlib=rb-4.0.3&auto=format&fit=crop&w=1374&q=80')"></div>
                <div class="p-5">
                    <h3 class="text-xl mb-2 text-primary">QUANTUM DRIFT</h3>
                    <div class="mb-2">
                        <span class="text-xl font-bold text-primary">$29.99</span>
                    </div>
                    <div class="mb-4 text-yellow-400">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="far fa-star"></i>
                        <span class="text-gray-400 text-sm ml-1">(87)</span>
                    </div>
                    <button class="w-full py-2 bg-primary text-black font-bold rounded hover:bg-black hover:text-primary transition-all">
                        BUY NOW
                    </button>
                </div>
            </div>

            <!-- Product 3 -->
            <div class="bg-darker rounded-lg overflow-hidden border border-primary transition-all hover:-translate-y-2 hover:shadow-neon-lg">
                <div class="h-40 bg-cover bg-center relative" style="background-image: url('https://images.unsplash.com/photo-1551103782-8ab07afd45c1?ixlib=rb-4.0.3&auto=format&fit=crop&w=1470&q=80')">
                    <span class="absolute top-2 right-2 bg-red-500 text-white px-3 py-1 rounded-full text-xs font-bold">NEW</span>
                </div>
                <div class="p-5">
                    <h3 class="text-xl mb-2 text-primary">SYSTEM HACKER</h3>
                    <div class="mb-2">
                        <span class="text-xl font-bold text-primary">$24.99</span>
                    </div>
                    <div class="mb-4 text-yellow-400">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <span class="text-gray-400 text-sm ml-1">(256)</span>
                    </div>
                    <button class="w-full py-2 bg-primary text-black font-bold rounded hover:bg-black hover:text-primary transition-all">
                        BUY NOW
                    </button>
                </div>
            </div>
        </div>
    </main>

    <!-- Footer -->
    <footer class="bg-darker py-16 px-5 border-t-2 border-neon shadow-neon-md">
        <div class="max-w-6xl mx-auto flex flex-col md:flex-row justify-between items-center gap-10">
            <!-- Left side - NextPlay brand -->
            <div class="text-center md:text-left">
                <div class="text-primary text-2xl font-bold text-shadow-neon mb-2">NextPlay</div>
            </div>
            
            <!-- Center - Horizontal Links -->
            <div class="flex flex-col md:flex-row gap-6">
                <a href="#" class="text-primary hover:text-white transition-all relative after:content-[''] after:absolute after:w-0 after:h-px after:bottom-0 after:left-0 after:bg-primary hover:after:w-full after:transition-all">About Us</a>
                <a href="#" class="text-primary hover:text-white transition-all relative after:content-[''] after:absolute after:w-0 after:h-px after:bottom-0 after:left-0 after:bg-primary hover:after:w-full after:transition-all">Privacy Policy</a>
                <a href="#" class="text-primary hover:text-white transition-all relative after:content-[''] after:absolute after:w-0 after:h-px after:bottom-0 after:left-0 after:bg-primary hover:after:w-full after:transition-all">Contact</a>
            </div>
            
            <!-- Right side - Vertical Social with names -->
            <div class="flex flex-col gap-3">
                <a href="#" class="text-primary hover:text-white transition-all flex items-center gap-2">
                    <i class="fab fa-facebook-f w-5"></i>
                    <span class="hidden md:inline">Facebook</span>
                </a>
                <a href="#" class="text-primary hover:text-white transition-all flex items-center gap-2">
                    <i class="fab fa-tiktok w-5"></i>
                    <span class="hidden md:inline">TikTok</span>
                </a>
                <a href="#" class="text-primary hover:text-white transition-all flex items-center gap-2">
                    <i class="fab fa-instagram w-5"></i>
                    <span class="hidden md:inline">Instagram</span>
                </a>
                <a href="#" class="text-primary hover:text-white transition-all flex items-center gap-2">
                    <i class="fab fa-twitter w-5"></i>
                    <span class="hidden md:inline">Twitter</span>
                </a>
            </div>
        </div>
        
        <p class="text-center text-primary opacity-70 mt-12 text-sm">&copy; 2025 RealmForge. All rights reserved.</p>
    </footer>

    <!-- Font Awesome for icons -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/js/all.min.js"></script>
    
    <!-- JavaScript -->
    <script>
        function toggleMenu() {
            const nav = document.getElementById('navLinks');
            nav.classList.toggle('hidden');
            nav.classList.toggle('flex');
        }

        // Buy Now Button Functionality
        document.addEventListener('DOMContentLoaded', function() {
            const buyButtons = document.querySelectorAll('.bg-primary');
            
            buyButtons.forEach(button => {
                button.addEventListener('click', function() {
                    const productName = this.closest('.bg-darker').querySelector('h3').textContent;
                    alert(`Added ${productName} to your cart!`);
                });
            });
        });
    </script>
</body>
</html>