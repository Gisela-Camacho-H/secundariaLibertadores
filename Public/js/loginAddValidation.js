
window.addEventListener("load", function() {
    let formulario = document.querySelector("form.loginFormulario");

    formulario.addEventListener("submit", function(e) {
        e.preventDefault();

        let campoEmail = document.querySelector("input.email");
        
        if(campoEmail.value == ""){
            document.getElementById("errorEmail").innerHTML = "El campo de correo tiene que estar completo";
        }

        let campoContrasena = document.querySelector("input.contrasena");

        if(campoContrasena.value == ""){
            document.getElementById("errorContrasena").innerHTML = "El campo de contraseña tiene que estar completo";
        }
    });
})