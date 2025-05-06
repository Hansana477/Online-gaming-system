<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NextPlay - Home</title>
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
            <a href="index.html" class="active-link">Home</a>
            <a href="store.html" class="text-white hover:text-primary hover:border-b-2 hover:border-neon transition-all">Store</a>
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

    <main class="pb-10">
        <!-- Hero Section -->
        <section class="h-[70vh] bg-cover bg-center flex items-center justify-center text-center mb-12 border-b-2 border-neon shadow-neon-lg"
                 style="background-image: linear-gradient(rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.7)), url('https://images.unsplash.com/photo-1489599849927-2ee91cede3ba?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80')">
            <div class="max-w-4xl px-5">
                <h1 class="text-5xl md:text-6xl mb-5 text-primary text-shadow-neon">DIVE INTO THE MATRIX</h1>
                <p class="text-xl md:text-2xl mb-8">Experience next-gen gaming in our cyberpunk universe</p>
                <a href="#" class="inline-block px-8 py-3 rounded border-2 border-primary bg-primary text-black hover:bg-transparent hover:text-primary transition-all font-bold">
                    EXPLORE GAMES
                </a>
            </div>
        </section>

        <!-- Game Slideshow Section -->
        <section class="max-w-6xl mx-auto px-5 mb-20">
            <h2 class="text-4xl text-center mb-12 text-primary text-shadow-neon relative">
                FEATURED GAMES
                <div class="absolute bottom-0 left-1/2 transform -translate-x-1/2 w-24 h-1 bg-primary shadow-neon mt-4"></div>
            </h2>
            
            <div class="max-w-5xl mx-auto relative overflow-hidden border-2 border-neon shadow-neon-md">
                <!-- Slide 1 -->
                <div class="game-slide active flex flex-col md:flex-row animate-fade">
                    <div class="slide-image min-h-[300px] md:min-h-[500px] bg-cover bg-center flex-1" 
                         style="background-image: url('https://images.unsplash.com/photo-1542751371-adc38448a05e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80')"></div>
                    <div class="slide-info bg-darker bg-opacity-90 p-5 md:p-10 flex flex-col justify-center flex-1">
                        <h3 class="text-2xl md:text-3xl mb-5 text-primary text-shadow-neon">NEON REVOLUTION</h3>
                        <p class="mb-6">Fight through the dystopian megacity in this action-packed RPG</p>
                        <div class="game-tags flex gap-3 mb-6 flex-wrap">
                            <span class="bg-primary bg-opacity-20 text-primary px-3 py-1 rounded-full text-sm border border-neon">RPG</span>
                            <span class="bg-primary bg-opacity-20 text-primary px-3 py-1 rounded-full text-sm border border-neon">Open World</span>
                            <span class="bg-primary bg-opacity-20 text-primary px-3 py-1 rounded-full text-sm border border-neon">Cyberpunk</span>
                        </div>
                        <a href="#" class="self-start px-6 py-2 rounded border-2 border-primary text-primary hover:bg-primary hover:text-black transition-all">
                            VIEW DETAILS
                        </a>
                    </div>
                </div>
                
                <!-- Navigation Dots -->
                <div class="absolute bottom-5 left-0 right-0 text-center">
                    <span class="dot active inline-block w-4 h-4 mx-1 rounded-full bg-primary cursor-pointer shadow-neon" onclick="currentSlide(1)"></span>
                    <span class="dot inline-block w-4 h-4 mx-1 rounded-full bg-primary bg-opacity-30 border border-neon cursor-pointer hover:bg-primary hover:shadow-neon" onclick="currentSlide(2)"></span>
                    <span class="dot inline-block w-4 h-4 mx-1 rounded-full bg-primary bg-opacity-30 border border-neon cursor-pointer hover:bg-primary hover:shadow-neon" onclick="currentSlide(3)"></span>
                </div>
            </div>
        </section>

        <!-- Upcoming Games Section -->
        <section class="max-w-6xl mx-auto px-5 mb-20">
            <h2 class="text-4xl text-center mb-12 text-primary text-shadow-neon relative">
                COMING SOON
                <div class="absolute bottom-0 left-1/2 transform -translate-x-1/2 w-24 h-1 bg-primary shadow-neon mt-4"></div>
            </h2>
            
            <div class="grid grid-cols-1 md:grid-cols-3 gap-8 mt-10">
                <div class="game-card bg-darker rounded overflow-hidden border border-neon shadow-neon-md hover:-translate-y-3 hover:shadow-neon-lg transition-all">
                    <div class="game-thumbnail h-48 bg-cover bg-center transition-transform duration-500 hover:scale-105" 
                         style="background-image: url('https://images.unsplash.com/photo-1511512578047-dfb367046420?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1471&q=80')"></div>
                    <div class="p-5">
                        <h3 class="text-xl text-primary mb-1">VOID RUNNERS</h3>
                        <p class="text-gray-400">Release: Q1 2026</p>
                    </div>
                </div>
                
                <div class="game-card bg-darker rounded overflow-hidden border border-neon shadow-neon-md hover:-translate-y-3 hover:shadow-neon-lg transition-all">
                    <div class="game-thumbnail h-48 bg-cover bg-center transition-transform duration-500 hover:scale-105" 
                         style="background-image: url('https://images.unsplash.com/photo-1534972195531-d756b9bfa9f2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80')"></div>
                    <div class="p-5">
                        <h3 class="text-xl text-primary mb-1">NEURAL DIVE</h3>
                        <p class="text-gray-400">Release: Q2 2026</p>
                    </div>
                </div>
                
                <div class="game-card bg-darker rounded overflow-hidden border border-neon shadow-neon-md hover:-translate-y-3 hover:shadow-neon-lg transition-all">
                    <div class="game-thumbnail h-48 bg-cover bg-center transition-transform duration-500 hover:scale-105" 
                         style="background-image: url('https://images.unsplash.com/photo-1547036967-23d11aacaee0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1374&q=80')"></div>
                    <div class="p-5">
                        <h3 class="text-xl text-primary mb-1">CYBER SHADOWS</h3>
                        <p class="text-gray-400">Release: Q3 2026</p>
                    </div>
                </div>
            </div>
        </section>
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

        // Slideshow functionality
        let slideIndex = 1;
        showSlides(slideIndex);
        
        function currentSlide(n) {
            showSlides(slideIndex = n);
        }
        
        function showSlides(n) {
            let i;
            let slides = document.getElementsByClassName("game-slide");
            let dots = document.getElementsByClassName("dot");
            
            if (n > slides.length) {slideIndex = 1}
            if (n < 1) {slideIndex = slides.length}
            
            for (i = 0; i < slides.length; i++) {
                slides[i].classList.remove("active");
                slides[i].classList.remove("animate-fade");
            }
            
            for (i = 0; i < dots.length; i++) {
                dots[i].classList.remove("active");
                dots[i].classList.remove("shadow-neon");
                dots[i].classList.add("bg-opacity-30");
            }
            
            slides[slideIndex-1].classList.add("active");
            slides[slideIndex-1].classList.add("animate-fade");
            dots[slideIndex-1].classList.add("active");
            dots[slideIndex-1].classList.add("shadow-neon");
            dots[slideIndex-1].classList.remove("bg-opacity-30");
        }
        
        // Auto-advance slides every 5 seconds
        setInterval(() => {
            currentSlide(slideIndex + 1);
        }, 5000);

        // Set active navigation link
        const navLinks = document.querySelectorAll('.nav-links a');
        
        navLinks.forEach(link => {
            link.addEventListener('click', function() {
                // Remove active class from all links
                navLinks.forEach(item => item.classList.remove('active-link'));
                // Add active class to clicked link
                this.classList.add('active-link');
            });
        });
    </script>
</body>
</html>