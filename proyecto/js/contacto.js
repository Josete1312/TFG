document.getElementById("form-contacto").addEventListener("submit", function (event) {
    event.preventDefault();

    const nombre = document.getElementById("nombre").value;
    const email = document.getElementById("email").value;
    const mensaje = document.getElementById("mensaje").value;

    if (nombre === "" || email === "" || mensaje === "") {
        alert("Por favor, rellena todos los campos.");
        return;
    }

    const emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
    if (!emailPattern.test(email)) {
        alert("Por favor, introduce un email válido.");
        return;
    }

    alert("Gracias por contactarnos, " + nombre + ". Tu mensaje ha sido enviado con éxito.");

    document.getElementById("form-contacto").reset();
});
