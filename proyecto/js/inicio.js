function toggleMenu() {
    const nav = document.getElementById('menu');
    nav.classList.toggle('active');
}

const nav = document.getElementById('menu');
nav.addEventListener('mouseleave', function() {
    nav.classList.remove('active');
});
