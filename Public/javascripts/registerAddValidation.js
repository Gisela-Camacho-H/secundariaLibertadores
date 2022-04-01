
window.addEventListener("load", function() {
    let formulario = document.querySelector("form.registroFormulario");

    formulario.addEventListener("submit", function(e) {
        e.preventDefault();

        let campoNombre = document.querySelector("input.nombre");

        if(campoNombre.value == ""){
            document.getElementById("errorNombre").innerHTML = "El campo de nombre tiene que estar completo";
        }

        let campoApellidos = document.querySelector("input.apellidos");
        
        if(campoApellidos.value == ""){
            document.getElementById("errorApellidos").innerHTML = "El campo de apellidos tiene que estar completo";
        }

        let campoEmail = document.querySelector("input.email");
        
        if(campoEmail.value == ""){
            document.getElementById("errorEmail").innerHTML = "El campo de correo tiene que estar completo";
        }

        let campoConfirmar = document.querySelector("input.confirmar");
        
        if(campoConfirmar.value == ""){
            document.getElementById("errorConfirmar").innerHTML = "El campo de confirmar tiene que estar completo";
        }

        let campoContrasena = document.querySelector("input.contrasena");
        
        if(campoContrasena.value == ""){
            document.getElementById("errorContrasena").innerHTML = "El campo de contraseña tiene que estar completo";
        }
    });
})