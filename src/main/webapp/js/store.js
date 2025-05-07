document.addEventListener('DOMContentLoaded', () => {
    console.log('store.js loaded');

    window.filterGames = function() {
        const searchInput = document.getElementById('searchInput').value.toLowerCase();
        const categoryFilter = document.getElementById('categoryFilter').value;
        const sortFilter = document.getElementById('sortFilter').value;
        const productCards = Array.from(document.getElementsByClassName('product-card'));

        // Filter by search and category
        productCards.forEach(card => {
            const title = card.getAttribute('data-title');
            const category = card.getAttribute('data-category');
            const matchesSearch = title.includes(searchInput);
            const matchesCategory = categoryFilter === 'all' || category === categoryFilter;
            card.style.display = matchesSearch && matchesCategory ? '' : 'none';
        });

        // Sort
        const grid = document.querySelector('.products-grid');
        const sortedCards = productCards.sort((a, b) => {
            const priceA = parseFloat(a.querySelector('.current-price').textContent.replace('$', ''));
            const priceB = parseFloat(b.querySelector('.current-price').textContent.replace('$', ''));
            if (sortFilter === 'price-low') return priceA - priceB;
            if (sortFilter === 'price-high') return priceB - priceA;
            // Placeholder for popular/newest (requires additional data)
            return 0;
        });

        // Re-append sorted cards
        grid.innerHTML = '';
        sortedCards.forEach(card => grid.appendChild(card));
    };

    // Menu toggle for mobile
    window.toggleMenu = function() {
        const navLinks = document.getElementById('navLinks');
        navLinks.classList.toggle('active');
    };
});/**
 * 
 */