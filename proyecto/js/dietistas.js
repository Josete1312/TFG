window.onscroll = function() {
    const btnTop = document.getElementById('btn-top');
    if (document.body.scrollTop > 100 || document.documentElement.scrollTop > 100) {
        btnTop.style.display = "block";
    } else {
        btnTop.style.display = "none";
    }
};

function scrollToTop() {
    window.scrollTo({
        top: 0,
        behavior: 'smooth'
    });
}

window.onload = function() {
    const mensajeBienvenida = document.getElementById('mensaje-bienvenida');
    const hora = new Date().getHours();
    let mensaje = "";

    if (hora >= 5 && hora < 12) {
        mensaje = "¡Buenos días! Bienvenido a DIETECTIVES";
    } else if (hora >= 12 && hora < 18) {
        mensaje = "¡Buenas tardes! Disfruta de nuestros contenidos";
    } else {
        mensaje = "¡Buenas noches! Relájate y explora nuestra web";
    }

    mensajeBienvenida.textContent = mensaje;
};
