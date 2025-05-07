document.addEventListener('DOMContentLoaded', () => {
    console.log('script.js loaded');

    // Toggle mobile menu
    window.toggleMenu = function() {
        const nav = document.getElementById('navLinks');
        nav.classList.toggle('active');
    };

    // Slideshow functionality for index.jsp
    let slideIndex = 1;
    showSlides(slideIndex);

    window.currentSlide = function(n) {
        showSlides(slideIndex = n);
    };

    function showSlides(n) {
        const slides = document.getElementsByClassName('game-slide');
        const dots = document.getElementsByClassName('dot');

        if (slides.length === 0) {
            console.warn('No game slides found');
            return;
        }

        if (n > slides.length) { slideIndex = 1; }
        if (n < 1) { slideIndex = slides.length; }

        for (let i = 0; i < slides.length; i++) {
            slides[i].classList.remove('active');
        }

        for (let i = 0; i < dots.length; i++) {
            dots[i].classList.remove('active');
        }

        slides[slideIndex - 1].classList.add('active');
        dots[slideIndex - 1].classList.add('active');
    }

    // Auto-advance slides every 5 seconds
    setInterval(() => {
        currentSlide(slideIndex + 1);
    }, 5000);

    // Set active navigation link
    const navLinks = document.querySelectorAll('.nav-links a');
    navLinks.forEach(link => {
        link.addEventListener('click', function() {
            navLinks.forEach(item => item.classList.remove('active'));
            this.classList.add('active');
        });
    });

    // Buy Now button functionality for store.jsp and viewgame.jsp
    const buyButtons = document.querySelectorAll('.buy-now, .btn-primary');
    buyButtons.forEach(button => {
        button.addEventListener('click', function() {
            let productName;
            if (this.classList.contains('buy-now')) {
                // store.jsp product card
                const card = this.closest('.product-card');
                productName = card ? card.querySelector('h3').textContent : 'Unknown Game';
            } else {
                // viewgame.jsp main button
                const title = document.querySelector('.game-title');
                productName = title ? title.textContent : 'Unknown Game';
            }
            alert(`Added ${productName} to your cart!`);
            console.log(`Buy Now clicked for ${productName}`);
        });
    });

    // Add Game modal functionality (for addgames.jsp)
    const addGameBtn = document.getElementById('addGameBtn');
    const addGameModal = document.getElementById('addGameModal');
    const closeModal = document.getElementById('closeModal');
    const cancelBtn = document.getElementById('cancelBtn');

    if (addGameBtn && addGameModal) {
        addGameBtn.addEventListener('click', () => {
            addGameModal.classList.remove('hidden');
            console.log('Add Game modal opened');
        });

        [closeModal, cancelBtn].forEach(btn => {
            if (btn) {
                btn.addEventListener('click', () => {
                    addGameModal.classList.add('hidden');
                    console.log('Add Game modal closed');
                });
            }
        });

        addGameModal.addEventListener('click', (e) => {
            if (e.target === addGameModal) {
                addGameModal.classList.add('hidden');
                console.log('Add Game modal closed via backdrop');
            }
        });
    } else {
        console.log('Add Game modal elements not found on this page');
    }
});