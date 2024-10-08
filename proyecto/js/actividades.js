document.addEventListener('DOMContentLoaded', function() {
    const mediaItems = document.querySelectorAll('.media-item');
    
    // Calcula el ancho de las imágenes y aplica el mismo ancho al video para mantener uniformidad
    const setMediaItemHeight = () => {
        mediaItems.forEach(item => {
            const width = item.clientWidth;
            item.style.height = `${width * 0.66}px`;  // Ajusta el aspecto para mantener proporción
        });
    };

    window.addEventListener('resize', setMediaItemHeight);
    setMediaItemHeight();
});
