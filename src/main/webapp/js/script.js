/**
 * 
 */function toggleMenu() {
  const nav = document.getElementById('navLinks');
  nav.classList.toggle('active');
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
      }
      
      for (i = 0; i < dots.length; i++) {
        dots[i].classList.remove("active");
      }
      
      slides[slideIndex-1].classList.add("active");
      dots[slideIndex-1].classList.add("active");
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
    navLinks.forEach(item => item.classList.remove('active'));
    // Add active class to clicked link
    this.classList.add('active');
  });
});
// Buy Now Button Functionality
document.addEventListener('DOMContentLoaded', function() {
  const buyButtons = document.querySelectorAll('.buy-now');
  
  buyButtons.forEach(button => {
      button.addEventListener('click', function() {
          const productName = this.closest('.product-card').querySelector('h3').textContent;
          alert(`Added ${productName} to your cart!`);
          // In a real app, you would add to cart logic here
      });
  });
  
  // Search functionality would go here
});

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

addGameModal.addEventListener('click', (e) => {
    if (e.target === addGameModal) {
        addGameModal.classList.add('hidden');
    }
});
  